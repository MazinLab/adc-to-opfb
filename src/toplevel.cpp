#include "toplevel.hpp"


void adc2iq(adcstream_t &iin, adcstream_t &qin, hls::stream<iqadcgroup_t> &iq) {
//Package raw ADC samples into complex fixed point IQ values
#pragma HLS INLINE OFF  //for dataflow
#pragma HLS PIPELINE II=1
#pragma HLS INTERFACE ap_ctrl_none port=return
	adcaxis_t istream=iin.read();
	adcaxis_t qstream=qin.read();
	iqadcgroup_t group;

	adcpack: for (int i=0;i<N_ADC_OUT;i++) {
#pragma HLS UNROLL
		group.range(32*(i+1)-1, 32*i)=istream.range(16*(i+1)-1, 16*i) | (qstream.range(16*(i+1)-1, 16*i)<<16);
	}
	iq.write_nb(group);
}


void process_lanes(hls::stream<iqadcgroup_t> &iqstream, firstream_t &lanes) {
#pragma HLS PIPELINE II=1
#pragma HLS INTERFACE ap_ctrl_none port=return
	static ap_uint<9> cycle;
	static bool primed;
	static iq128delay_t even_delay, odd_delay;
	static iqadcgroup_t even_lane_z1;
	iqadcgroup_t iq, even_delay_iq, odd_delay_iq;
	ap_axiu<512,0,0,0> lane, lane0;
	iq=iqstream.read();

	even_delay_iq = even_delay.shift(iq, N_DELAY-1, !cycle[0]);
	odd_delay_iq = odd_delay.shift(iq, N_DELAY-1, cycle[0]);

	ap_uint<512> outtmp_even=0, outtmp_odd=0;

	outtmp_even.range(32*N_ADC_OUT-1, 0) = even_lane_z1;
	outtmp_even.range(32*N_LANES-1, 32*N_ADC_OUT) = odd_delay_iq;
	outtmp_odd.range(32*N_ADC_OUT-1, 0) = even_lane_z1;
	outtmp_odd.range(32*N_LANES-1, 32*N_ADC_OUT) = iq;

	lane.data=cycle[0] ? outtmp_odd:outtmp_even;
	lane.last=cycle==511;
	lane0.last=cycle==511;
	lane0.data=0;
	if (primed)  //This might not be necessary but it makes the output a bit cleaner
		lanes.write(lane);
	else
		lanes.write(lane0);

	//Delay to get all the lanes in sync
	even_lane_z1= cycle[0] ? even_delay_iq:iq;

	primed |= cycle==511;
	cycle++;
}


void adc_to_opfb(adcstream_t &istream, adcstream_t &qstream, firstream_t &lanes) {
#pragma HLS DATAFLOW
#pragma HLS INTERFACE axis register port=istream
#pragma HLS INTERFACE axis register port=qstream
#pragma HLS INTERFACE axis register port=lanes
#pragma HLS INTERFACE ap_ctrl_none port=return

	hls::stream<iqadcgroup_t> iq("iq");
	adc2iq(istream, qstream, iq);
	process_lanes(iq, lanes);

}
