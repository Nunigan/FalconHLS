############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
############################################################
set top [lindex $argv 2]

puts $top

open_project falcon
set_top $top
add_files code_hls/vrfy.c
add_files code_hls/shake.c
add_files code_hls/common.c
add_files code_hls/codec.c
add_files code_hls/keygen.c
add_files code_hls/fpr.c
add_files code_hls/sign.c
add_files code_hls/rng.c
add_files code_hls/fft.c
add_files code_hls/header.h
add_files code_hls/tb_data.h
add_files -tb code_hls/tb.c -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
open_solution "solution1" -flow_target vivado
# set_part {xck26-sfvc784-2LV-c}
set_part {xczu7ev-ffvc1156-2-e}
create_clock -period 10 -name default
source "./falcon/solution1/directives.tcl"
#csim_design 
csynth_design 
cosim_design -rtl vhdl
export_design -rtl verilog -format ip_catalog -output hls_export -description $top
exit
