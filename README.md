# adc-to-opfb
Package and reorder ADC data for the OPFB

Git:  [adc-to-opfb](https://github.com/MazinLab/adc-to-opfb)

Inputs:
- I 128bit AXI4S of 16 bit words
- Q 128bit AXI4S of 16 bit words

Outputs:
- 16x IQ 32bit AXI4S of 16bit complex words, streams equipped with TLAST.

Interface:

    void adc_to_opfb(adcaxis_t &istream, adcaxis_t &qstream, pfbaxisin_t lane[N_LANES]) {
    #pragma HLS DATAFLOW
    #pragma HLS DATA_PACK variable=istream
    #pragma HLS DATA_PACK variable=qstream
    #pragma HLS INTERFACE axis port=istream register
    #pragma HLS INTERFACE axis port=qstream register
    #pragma HLS INTERFACE axis port=lane register
    #pragma HLS ARRAY_PARTITION variable=lane complete
    #pragma HLS INTERFACE ap_ctrl_none port=return


Variants:
- The pipeline branch contains a pipeline variant (instead of a dataflow variant) that works in cosim but has not been checked for pipeline bubbles with Vivado/Pynq

This block uses the internal function adc2iq to take the incoming 8 I & 8 Q samples from the ADCs and bundle them, placing each of the 8 pairs into their own internal buffer. Internally an ap_uint<32> was used instead of a complex or struct since this seemed to allow greater compatability with various HLS tasks for reasons that are poorly understood. 

The lanes are driven by the function process_lanes, which takes in the 8 IQs and maintains 16 internal delay lines of 128 IQ samples.  For each lane the function alternates between driving the lane with the end of the delay line and the current sample: odd lanes get their delay line updated on odd cycles (outputting the new sample), even lane delay lines get updates on even cycles (outputting the new sample). Finally an extra cycle of delay is applied to even lanes to ensure that even an odd lane output is not one cycle out of phase, i.e even and odd lanes see new or delayed data on the same clocks. This results in a lane pattern (where the numbers represent the sample arrival order) like:

    Lane  0: 0, 2048, 16, 2064, 32, 2080, ... 
    Lane  1: 8, 2056, 24, 2072, 40, 2088, ...
    Lane  2: 1, 2049, 17, 2065, 33, 2081, ...
    Lane 15: 15, 2063, 31, 2079, 47, 2095, ...

The resulting pattern may be seen in full, along with the intended FIR coefficient set for multiplication in the simulation output  (TODO). 

TLAST is set on the 256th cycle of each lane. An example block diagram for testing the core is contained in [gen3-opfb](https://github.com/MazinLab/gen3-opdb).
