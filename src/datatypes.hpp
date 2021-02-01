#ifndef __DATATYPES_HPP__
#define __DATATYPES_HPP__
#include "ap_fixed.h"
#include <complex>
#include "ap_int.h"

#define N_LANES 16
#define N_ADC_OUT 8
#define N_GROUPS 256

typedef unsigned short rawsample_t;

typedef ap_uint<32> iq_t;

typedef ap_uint<128> adcaxis_t;

typedef struct {
	iq_t data;
	ap_uint<1> last;
} pfbaxisinarray_t;

typedef struct {
	ap_uint<512> data;
	ap_uint<1> last;
} pfbaxisin_t;

typedef ap_uint<256> iqadcgroup_t;

#endif
