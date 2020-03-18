#include "toplevel.hpp"

void adc2iq(adcaxis_t iin, adcaxis_t qin, iq_t iq[N_ADC_OUT]) {
//Package raw ADC samples into complex fixed point IQ values
//#pragma HLS INLINE off

//Making the inputs pass by reference (regardless of packing the temp variables) moves this
// function from a latency of 1 to 3 and slightly increases resource use (makes sense). It also
// creates a scheduling warning about unable to sched call on adc2iq within the first cycle 204-63
// Without the pass by reference it seems all the temp variables are optimized away.

	adcaxis_t istream=iin;
	adcaxis_t qstream=qin;
	#pragma HLS DATA_PACK variable=istream
	#pragma HLS DATA_PACK variable=qstream
	adcpack: for (int i=0;i<N_ADC_OUT;i++) {
#pragma HLS UNROLL
		iq[i]=((unsigned int)istream.data[i]) | (((unsigned int)qstream.data[i])<<16);
	}
}


void process_lanes(iq_t iqs[N_ADC_OUT], pfbaxisin_t lane[N_LANES]) {
#pragma HLS pipeline ii=1
	static bool primed;
	static ap_uint<8> cycle;
	static iq_t even_lane_z1[N_LANES/2];
#pragma HLS ARRAY_PARTITION variable=even_lane_z1 complete
	static iq_t last[N_LANES];
#pragma HLS ARRAY_PARTITION variable=last complete
//#pragma HLS INTERFACE ap_ctrl_none port=return


	eachlane: for (int i=0;i<N_LANES;i++) {
#pragma HLS UNROLL
		bool odd_cycle = cycle[0];
		bool odd_lane = ap_uint<1>(i);
		bool run_lane;
		iq_t iq_out, laneiq;

		laneiq=iqs[i/2];
		//Odd lanes get odd cycles, even lanes get even cycles
		iq_out = odd_cycle == odd_lane ? laneiq:last[i];
		if (odd_cycle == odd_lane) last[i]=laneiq;

		//Delay to get things back in sync
		if (!odd_lane) {
			//if (primed) {
				lane[i].data = even_lane_z1[i/2];
				lane[i].last=cycle==255;
			//}
			even_lane_z1[i/2]=iq_out;
		} else {
			//if (primed) {
				lane[i].data=iq_out;
				lane[i].last=cycle==255;
			//}
		}
	}
	//primed=true;
	cycle++;
}

void adc_to_opfb(adcaxis_t &istream, adcaxis_t &qstream, pfbaxisin_t lane[16]) {
#pragma HLS PIPELINE II=1
#pragma HLS DATA_PACK variable=istream
#pragma HLS DATA_PACK variable=qstream
#pragma HLS INTERFACE axis port=istream register=reverse
#pragma HLS INTERFACE axis port=qstream register=reverse
#pragma HLS INTERFACE axis port=lane register=forward
#pragma HLS ARRAY_PARTITION variable=lane complete
#pragma HLS INTERFACE ap_ctrl_none port=return

	iq_t iq[N_ADC_OUT];
#pragma HLS ARRAY_PARTITION variable=iq complete

	adc2iq(istream, qstream, iq);
	process_lanes(iq, lane);

}
