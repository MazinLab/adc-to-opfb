#include "datatypes.hpp"
#include "ap_shift_reg.h"
#include "hls_stream.h"
#include "ap_axi_sdata.h"


typedef hls::stream<ap_uint<128>> adcstream_t;
typedef hls::stream<ap_axiu<512,0,0,0>> firstream_t;

#define N_DELAY 128
typedef ap_shift_reg<iqadcgroup_t, N_DELAY> iq128delay_t;

void adc_to_opfb(adcstream_t &istream, adcstream_t &qstream, firstream_t &lane);
