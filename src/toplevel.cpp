#include "toplevel.hpp"

void adc2iq(adcaxis_t &iin, adcaxis_t &qin, hls::stream<iqadcgroup_t> &iq) {
//Package raw ADC samples into complex fixed point IQ values
#pragma HLS INLINE off
//#pragma HLS INTERFACE ap_ctrl_none port=return
	adcaxis_t istream=iin;
	adcaxis_t qstream=qin;
	iqadcgroup_t group;

	adcpack: for (int i=0;i<N_ADC_OUT;i++) {
#pragma HLS UNROLL
		group.data[i]=istream.data[i] | (qstream.data[i]<<16);
	}
	iq.write_nb(group);
}


void process_lanes(hls::stream<iqadcgroup_t> &iqstream, pfbaxisin_t lane[N_LANES]) {
#pragma HLS PIPELINE II=1
#pragma HLS INTERFACE ap_ctrl_none port=return
	static ap_uint<8> cycle;
	static iq128delay_t even_delay, odd_delay;
	static iqadcgroup_t even_lane_z1;
//#pragma HLS ARRAY_PARTITION variable=even_lane_z1 complete
//#pragma HLS DATA_PACK variable=even_lane_z1

	iqadcgroup_t iq, even_delay_iq, odd_delay_iq;
//#pragma HLS ARRAY_PARTITION variable=iq.data complete
//#pragma HLS DATA_PACK variable=iq
//#pragma HLS DATA_PACK variable=even_delay_iq
//#pragma HLS DATA_PACK variable=odd_delay_iq

	iq=iqstream.read();

	even_delay_iq = even_delay.shift(iq, N_DELAY-1, !cycle[0]);
	odd_delay_iq = odd_delay.shift(iq, N_DELAY-1, cycle[0]);

	eachlane: for (int i=0;i<N_ADC_OUT;i++) {
#pragma HLS UNROLL

		lane[2*i].data = even_lane_z1.data[i];
		lane[2*i+1].data = !cycle[0] ? odd_delay_iq.data[i]:iq.data[i];
		lane[2*i].last=cycle==255;
		lane[2*i+1].last=cycle==255;
	}

	//Delay to get things back in sync
	even_lane_z1= cycle[0] ? even_delay_iq:iq;

	cycle++;
}

void adc_to_opfb(adcaxis_t &istream, adcaxis_t &qstream, pfbaxisin_t lane[N_LANES]) {
#pragma HLS DATAFLOW
#pragma HLS DATA_PACK variable=istream
#pragma HLS DATA_PACK variable=qstream
#pragma HLS INTERFACE axis port=istream register reverse
#pragma HLS INTERFACE axis port=qstream register reverse
#pragma HLS INTERFACE axis port=lane register forward
#pragma HLS ARRAY_PARTITION variable=lane complete
#pragma HLS INTERFACE ap_ctrl_none port=return

	hls::stream<iqadcgroup_t> iq;
//#pragma HLS ARRAY_PARTITION variable=iq.data complete
//#pragma HLS DATA_PACK variable=iq

	adc2iq(istream, qstream, iq);
	process_lanes(iq, lane);

}
