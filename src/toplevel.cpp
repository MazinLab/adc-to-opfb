#include "toplevel.hpp"

void adc2iq(adcaxis_t &iin, adcaxis_t &qin, hls::stream<iqadcgroup_t> &iq) {
//Package raw ADC samples into complex fixed point IQ values
#pragma HLS INLINE OFF  //for dataflow
	adcaxis_t istream=iin;
	adcaxis_t qstream=qin;
	iqadcgroup_t group;

	adcpack: for (int i=0;i<N_ADC_OUT;i++) {
#pragma HLS UNROLL
		group.range(32*(i+1)-1, 32*i)=istream.range(16*(i+1)-1, 16*i) | (qstream.range(16*(i+1)-1, 16*i)<<16);
	}
	iq.write_nb(group);
}


void process_lanes(hls::stream<iqadcgroup_t> &iqstream, pfbaxisin_t &lane) {
#pragma HLS PIPELINE II=1
	static ap_uint<9> cycle;
	static bool primed;
	static iq128delay_t even_delay, odd_delay;
	static iqadcgroup_t even_lane_z1;
	iqadcgroup_t iq, even_delay_iq, odd_delay_iq;

	iq=iqstream.read();

	even_delay_iq = even_delay.shift(iq, N_DELAY-1, !cycle[0]);
	odd_delay_iq = odd_delay.shift(iq, N_DELAY-1, cycle[0]);

//	eachlane: for (int i=0;i<N_ADC_OUT;i++) {
//#pragma HLS UNROLL
//		if (primed) { //This probably isn't necessary but it makes the output a bit cleaner
//			outtmp[i] = even_lane_z1.data[i];
//			outtmp[i+8] = !cycle[0] ? odd_delay_iq.data[i]:iq.data[i];
//		} else {
//			outtmp[i]=0;
//			outtmp[i+8]=0;
//		}
//	}

	ap_uint<512> outtmp_even=0, outtmp_odd=0;
	if (primed) { //This probably isn't necessary but it makes the output a bit cleaner
		outtmp_even.range(32*N_ADC_OUT-1, 0) = even_lane_z1;
		outtmp_even.range(32*N_LANES-1, 32*N_ADC_OUT) = odd_delay_iq;
		outtmp_odd.range(32*N_ADC_OUT-1, 0) = even_lane_z1;
		outtmp_odd.range(32*N_LANES-1, 32*N_ADC_OUT) = iq;
	}

	lane.data=cycle[0] ? outtmp_odd:outtmp_even;
	lane.last=cycle==511;

	//Delay to get all the lanes in sync
	even_lane_z1= cycle[0] ? even_delay_iq:iq;

	primed |= cycle==511;
	cycle++;
}

void adc_to_opfb(adcaxis_t &istream, adcaxis_t &qstream, pfbaxisin_t &lane) {
#pragma HLS DATAFLOW
//#pragma HLS DATA_PACK variable=istream
//#pragma HLS DATA_PACK variable=qstream
#pragma HLS INTERFACE axis register port=istream
#pragma HLS INTERFACE axis register port=qstream
#pragma HLS INTERFACE axis register port=lane
#pragma HLS INTERFACE ap_ctrl_none port=return

	hls::stream<iqadcgroup_t> iq;
	adc2iq(istream, qstream, iq);
	process_lanes(iq, lane);

}
