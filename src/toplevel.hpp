#include "datatypes.hpp"
#include "ap_shift_reg.h"
#include "hls_stream.h"

#define N_DELAY 128
typedef ap_shift_reg<iq_t, N_DELAY> iq128delay_t;

void adc_to_opfb(adcaxis_t &istream, adcaxis_t &qstream, pfbaxisin_t lane[N_LANES]);
