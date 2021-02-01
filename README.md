# adc-to-opfb
Package and reorder ADC data for the OPFB

Git:  [adc-to-opfb](https://github.com/MazinLab/adc-to-opfb)

Inputs:
- I 128bit AXI4S of 16 bit words
- Q 128bit AXI4S of 16 bit words

Outputs:
- 512b AXI4S of 16 16bit complex words, equipped with TLAST.

Interface:

    void adc_to_opfb(adcaxis_t &istream, adcaxis_t &qstream, pfbaxisin_t &lane) {
    #pragma HLS DATAFLOW
    #pragma HLS INTERFACE axis port=istream register
    #pragma HLS INTERFACE axis port=qstream register
    #pragma HLS INTERFACE axis port=lane register
    #pragma HLS INTERFACE ap_ctrl_none port=return


Variants:
- The pipeline branch contains a pipeline variant that is out of date. It worked in cosim but has not been checked for pipeline bubbles or for operation with Vivado/PYNQ.

This block uses the internal function adc2iq to take the incoming 8 I & 8 Q samples from the ADCs and bundles them, into an ap_uint<256> word as this plays much better with HLS than using structs or keeping the values discreete. 

The lanes are driven by the function process_lanes, which takes in the 8 IQs and maintains 2 internal delay lines of 128 IQ groups.  The function alternates between driving the output with the end of the delay lines and the current sample. odd lanes get their delay line updated on odd cycles (outputting the new sample), even lane delay lines get updates on even cycles (outputting the new sample). An extra cycle of delay is applied to even lanes to ensure that even an odd lane output is not one cycle out of phase, i.e even and odd lanes see new or delayed data on the same clocks. Finally the output is blanked for the first 512 cycles to make it simpler to make sense of things at startup. This results in a lane pattern (where the numbers represent the sample arrival order) like:

    Lane  0: 0, 2048, 16, 2064, 32, 2080, ... 
    Lane  1: 8, 2056, 24, 2072, 40, 2088, ...
    Lane  2: 1, 2049, 17, 2065, 33, 2081, ...
    Lane 15: 15, 2063, 31, 2079, 47, 2095, ...

The resulting pattern may be seen in full, along with the intended FIR coefficient set for multiplication in the simulation output. 

Note that the output of the core has odd and even lanes grouped: bins 0-255 are lanes 0,2,4..14 and 256-511 are 1,3,15. Block diagram wiring and an axis broadcaster are required to connect the core to the OPFB FIRs. 

TLAST is set on the 512th cycle of . See [gen3-vivado-top](https://github.com/MazinLab/gen3-vivado-top) for usage.
