#include "toplevel.hpp"

void adc2iq(adcaxis_t istream, adcaxis_t qstream, iq_t iq[N_ADC_OUT]) {
//Package raw ADC samples into complex fixed point IQ values
#pragma HLS INLINE
	adcpack: for (int i=0;i<N_ADC_OUT;i++) {
#pragma HLS UNROLL
		iq[i]=iq_t(istream.data[i], qstream.data[i]);
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

void top(adcaxis_t &istream, adcaxis_t &qstream, pfbaxisin_t lane[N_LANES]) {
#pragma HLS PIPELINE ii=1
#pragma HLS DATA_PACK variable=istream
#pragma HLS DATA_PACK variable=qstream
#pragma HLS DATA_PACK variable=lane
#pragma HLS INTERFACE axis port=istream depth=768 register=reverse
#pragma HLS INTERFACE axis port=qstream depth=768 register=reverse
#pragma HLS INTERFACE axis port=lane depth=768 register=forward
//#pragma HLS STREAM depth=768 variable=lane
//#pragma HLS STREAM depth=768 variable=istream
//#pragma HLS STREAM depth=768 variable=qstream
#pragma HLS ARRAY_PARTITION variable=lane complete
//#pragma HLS INTERFACE s_axilite port=return depth=768 //for cosim warning, don't need this
#pragma HLS INTERFACE ap_ctrl_none port=return

	static ap_uint<1> cycle;
	static iq128delay_t delays[N_LANES];

	static iq_t even_lane_z1[N_LANES/2];
#pragma HLS ARRAY_PARTITION variable=even_lane_z1 complete

	iq_t iq[N_ADC_OUT];

	bool odd_cycle = cycle[0];
	adc2iq(istream, qstream, iq);

	eachlane: for (int i=0;i<N_LANES;i++) {
#pragma HLS UNROLL
		bool odd_lane = ap_uint<1>(i);
		bool run_lane;
		iq_t iq_out;

		//Odd lanes get odd cycles, even lanes get even cycles
		run_lane = odd_cycle ? odd_lane : !odd_lane;
		lane_delay_interleave(iq[i/2], iq_out, delays[i], !run_lane); //update every other lane

		//Delay to get things back in sync
		if (!odd_lane) {
			lane[i].data = even_lane_z1[i/2];
			even_lane_z1[i/2]=iq_out;
		} else {
			lane[i].data=iq_out;
		}
	}
	cycle++;
}
