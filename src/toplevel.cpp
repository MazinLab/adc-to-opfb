#include "toplevel.hpp"

void adc2iq(adcaxis_t &iin, adcaxis_t &qin, hls::stream<iqadcgroup_t> &iq) {
//Package raw ADC samples into complex fixed point IQ values
#pragma HLS INLINE OFF  //for dataflow
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
	static ap_uint<9> cycle;
	static bool primed;
	static iq128delay_t even_delay, odd_delay;
	static iqadcgroup_t even_lane_z1;
	iqadcgroup_t iq, even_delay_iq, odd_delay_iq;

	iq=iqstream.read();

	even_delay_iq = even_delay.shift(iq, N_DELAY-1, !cycle[0]);
	odd_delay_iq = odd_delay.shift(iq, N_DELAY-1, cycle[0]);

	iq_t outtmp[N_LANES];
#pragma HLS ARRAY_PARTITION variable=outtmp complete

	eachlane: for (int i=0;i<N_ADC_OUT;i++) {
#pragma HLS UNROLL
		if (primed) { //This probably isn't necessary but it makes the output a bit cleaner
			outtmp[i] = even_lane_z1.data[i];
			outtmp[i+8] = !cycle[0] ? odd_delay_iq.data[i]:iq.data[i];
		} else {
			outtmp[i]=0;
			outtmp[i+8]=0;
		}
	}

	for (int i=0; i<N_LANES;i++) {
#pragma HLS UNROLL
		lane[i].data=outtmp[i];
		lane[i].last=cycle==511;
	}

	//Delay to get all the lanes in sync
	even_lane_z1= cycle[0] ? even_delay_iq:iq;

	primed |= cycle==511;
	cycle++;
}

void adc_to_opfb(adcaxis_t &istream, adcaxis_t &qstream, pfbaxisin_t lane[N_LANES]) {
#pragma HLS DATAFLOW
#pragma HLS DATA_PACK variable=istream
#pragma HLS DATA_PACK variable=qstream
#pragma HLS INTERFACE axis register reverse port=istream
#pragma HLS INTERFACE axis register reverse port=qstream
#pragma HLS INTERFACE axis register forward port=lane
#pragma HLS ARRAY_PARTITION variable=lane complete
#pragma HLS INTERFACE ap_ctrl_none port=return

	hls::stream<iqadcgroup_t> iq;
	adc2iq(istream, qstream, iq);
	process_lanes(iq, lane);

}
