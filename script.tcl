open_project adc-to-opfb
set_top top
add_files src/toplevel.hpp
add_files src/toplevel.cpp
add_files src/datatypes.hpp
add_files -tb src/tb.cpp -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
open_solution "solution1"
set_part {xczu28dr-ffvg1517-2-e}
create_clock -period 550MHz -name default
config_export -description {Package ADC data for OPFB FIRs} -display_name "ADC to OPFB" -format ip_catalog -library mkidgen3 -rtl verilog -vendor MazinLab -version 0.1
csim_design
csynth_design
cosim_design -tool xsim
export_design -flow impl -rtl verilog -format ip_catalog -description "Package ADC data for OPFB FIRs" -vendor "MazinLab" -library "mkidgen3" -version "0.1" -display_name "ADC to OPFB"
