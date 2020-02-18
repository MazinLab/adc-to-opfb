#include "toplevel.hpp"

void adc2iq(adcaxis_t &iin, adcaxis_t &qin, hls::stream<iq_t> iq[N_ADC_OUT]) {
//Package raw ADC samples into complex fixed point IQ values
#pragma HLS INLINE off
#pragma HLS INTERFACE ap_ctrl_none port=return
	adcaxis_t istream=iin;
	adcaxis_t qstream=qin;
	adcpack: for (int i=0;i<N_ADC_OUT;i++) {
#pragma HLS UNROLL
		iq[i].write(((unsigned int)istream.data[i]) | (((unsigned int)qstream.data[i])<<16));
	}
}

void lane_delay_interleave(iq_t in, iq_t &out, iq128delay_t &delay_line, bool get_delayed) {
//This function takes in an IQ and returns an IQ. If get_delayed is set it returns the last
// value from the delay line. If get_delayed is not set the function both shifts the input
// into the delay line and passes the input to the output.
#pragma HLS INLINE
	iq_t delay_iq = delay_line.shift(in, 127,!get_delayed);
	out = get_delayed ? delay_iq:in;
}

void process_lanes(hls::stream<iq_t> iqstream[N_ADC_OUT], pfbaxisin_t lane[N_LANES]) {
#pragma HLS PIPELINE II=1
#pragma HLS INTERFACE ap_ctrl_none port=return
	static ap_uint<8> cycle;
	static iq128delay_t delays[N_LANES];
	static iq_t even_lane_z1[N_LANES/2];
#pragma HLS ARRAY_PARTITION variable=even_lane_z1 complete

	iq_t iq[N_ADC_OUT];
#pragma HLS ARRAY_PARTITION variable=iq complete
	readiqstream: for (int i=0;i<N_ADC_OUT;i++) {
		iq[i]=iqstream[i].read();
	}

	eachlane: for (int i=0;i<N_LANES;i++) {
#pragma HLS UNROLL
		bool odd_cycle = cycle[0];
		bool odd_lane = ap_uint<1>(i);
		bool run_lane;
		iq_t iq_out;

		//Odd lanes get odd cycles, even lanes get even cycles, update every other lane
		run_lane = odd_cycle ? odd_lane : !odd_lane;
		lane_delay_interleave(iq[i/2], iq_out, delays[i], !run_lane);

		//Delay to get things back in sync
		if (!odd_lane) {
			lane[i].data = even_lane_z1[i/2];
			lane[i].last=cycle==255;
			even_lane_z1[i/2]=iq_out;
		} else {
			lane[i].data=iq_out;
			lane[i].last=cycle==255;
		}
	}
	cycle++;
}

void adc_to_opfb(adcaxis_t &istream, adcaxis_t &qstream, pfbaxisin_t lane[N_LANES]) {
#pragma HLS DATAFLOW
#pragma HLS DATA_PACK variable=istream
#pragma HLS DATA_PACK variable=qstream
#pragma HLS INTERFACE axis port=istream register=reverse
#pragma HLS INTERFACE axis port=qstream register=reverse
#pragma HLS INTERFACE axis port=lane register=forward
#pragma HLS ARRAY_PARTITION variable=lane complete
#pragma HLS INTERFACE ap_ctrl_none port=return

	hls::stream<iq_t> iq[N_ADC_OUT];
#pragma HLS ARRAY_PARTITION variable=iq complete

	adc2iq(istream, qstream, iq);
	process_lanes(iq, lane);

}
