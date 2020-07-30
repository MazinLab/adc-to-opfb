# Create project
open_project -reset adc-to-opfb

# Add source files and test bench
add_files src/toplevel.hpp
add_files src/toplevel.cpp
add_files src/datatypes.hpp
add_files -tb src/tb.cpp -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"

# Specify the top-level function for synthesis
set_top adc_to_opfb

# Create solution1
open_solution -reset "solution1"

# Specify a Xilinx device, clock period, and export style
set_part {xczu28dr-ffvg1517-2-e}
create_clock -period 550MHz -name default
config_export -description {Package ADC data for OPFB FIRs} -display_name "ADC to OPFB" -format ip_catalog -library mkidgen3 -rtl verilog -vendor MazinLab -version 0.1

# Simulate the C code
csim_design

# Synthesize, verify the RTL and package the IP
csynth_design
cosim_design -tool xsim
export_design
exit
