// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and OpenCL
// Version: 2019.2.1
// Copyright (C) 1986-2019 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="adc_to_opfb,hls_ip_2019_2_1,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xczu28dr-ffvg1517-2-e,HLS_INPUT_CLOCK=1.953000,HLS_INPUT_ARCH=dataflow,HLS_SYN_CLOCK=1.453000,HLS_SYN_LAT=2,HLS_SYN_TPT=1,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=1592,HLS_SYN_LUT=4020,HLS_VERSION=2019_2_1}" *)

module adc_to_opfb (
        istream_data_TDATA,
        qstream_data_TDATA,
        lane_0_TDATA,
        lane_1_TDATA,
        lane_2_TDATA,
        lane_3_TDATA,
        lane_4_TDATA,
        lane_5_TDATA,
        lane_6_TDATA,
        lane_7_TDATA,
        lane_8_TDATA,
        lane_9_TDATA,
        lane_10_TDATA,
        lane_11_TDATA,
        lane_12_TDATA,
        lane_13_TDATA,
        lane_14_TDATA,
        lane_15_TDATA,
        lane_0_TLAST,
        lane_1_TLAST,
        lane_2_TLAST,
        lane_3_TLAST,
        lane_4_TLAST,
        lane_5_TLAST,
        lane_6_TLAST,
        lane_7_TLAST,
        lane_8_TLAST,
        lane_9_TLAST,
        lane_10_TLAST,
        lane_11_TLAST,
        lane_12_TLAST,
        lane_13_TLAST,
        lane_14_TLAST,
        lane_15_TLAST,
        ap_clk,
        ap_rst_n,
        istream_data_TVALID,
        istream_data_TREADY,
        qstream_data_TVALID,
        qstream_data_TREADY,
        lane_0_TVALID,
        lane_0_TREADY,
        lane_1_TVALID,
        lane_1_TREADY,
        lane_2_TVALID,
        lane_2_TREADY,
        lane_3_TVALID,
        lane_3_TREADY,
        lane_4_TVALID,
        lane_4_TREADY,
        lane_5_TVALID,
        lane_5_TREADY,
        lane_6_TVALID,
        lane_6_TREADY,
        lane_7_TVALID,
        lane_7_TREADY,
        lane_8_TVALID,
        lane_8_TREADY,
        lane_9_TVALID,
        lane_9_TREADY,
        lane_10_TVALID,
        lane_10_TREADY,
        lane_11_TVALID,
        lane_11_TREADY,
        lane_12_TVALID,
        lane_12_TREADY,
        lane_13_TVALID,
        lane_13_TREADY,
        lane_14_TVALID,
        lane_14_TREADY,
        lane_15_TVALID,
        lane_15_TREADY
);


input  [127:0] istream_data_TDATA;
input  [127:0] qstream_data_TDATA;
output  [31:0] lane_0_TDATA;
output  [31:0] lane_1_TDATA;
output  [31:0] lane_2_TDATA;
output  [31:0] lane_3_TDATA;
output  [31:0] lane_4_TDATA;
output  [31:0] lane_5_TDATA;
output  [31:0] lane_6_TDATA;
output  [31:0] lane_7_TDATA;
output  [31:0] lane_8_TDATA;
output  [31:0] lane_9_TDATA;
output  [31:0] lane_10_TDATA;
output  [31:0] lane_11_TDATA;
output  [31:0] lane_12_TDATA;
output  [31:0] lane_13_TDATA;
output  [31:0] lane_14_TDATA;
output  [31:0] lane_15_TDATA;
output  [0:0] lane_0_TLAST;
output  [0:0] lane_1_TLAST;
output  [0:0] lane_2_TLAST;
output  [0:0] lane_3_TLAST;
output  [0:0] lane_4_TLAST;
output  [0:0] lane_5_TLAST;
output  [0:0] lane_6_TLAST;
output  [0:0] lane_7_TLAST;
output  [0:0] lane_8_TLAST;
output  [0:0] lane_9_TLAST;
output  [0:0] lane_10_TLAST;
output  [0:0] lane_11_TLAST;
output  [0:0] lane_12_TLAST;
output  [0:0] lane_13_TLAST;
output  [0:0] lane_14_TLAST;
output  [0:0] lane_15_TLAST;
input   ap_clk;
input   ap_rst_n;
input   istream_data_TVALID;
output   istream_data_TREADY;
input   qstream_data_TVALID;
output   qstream_data_TREADY;
output   lane_0_TVALID;
input   lane_0_TREADY;
output   lane_1_TVALID;
input   lane_1_TREADY;
output   lane_2_TVALID;
input   lane_2_TREADY;
output   lane_3_TVALID;
input   lane_3_TREADY;
output   lane_4_TVALID;
input   lane_4_TREADY;
output   lane_5_TVALID;
input   lane_5_TREADY;
output   lane_6_TVALID;
input   lane_6_TREADY;
output   lane_7_TVALID;
input   lane_7_TREADY;
output   lane_8_TVALID;
input   lane_8_TREADY;
output   lane_9_TVALID;
input   lane_9_TREADY;
output   lane_10_TVALID;
input   lane_10_TREADY;
output   lane_11_TVALID;
input   lane_11_TREADY;
output   lane_12_TVALID;
input   lane_12_TREADY;
output   lane_13_TVALID;
input   lane_13_TREADY;
output   lane_14_TVALID;
input   lane_14_TREADY;
output   lane_15_TVALID;
input   lane_15_TREADY;

 reg    ap_rst_n_inv;
wire    adc2iq_U0_ap_start;
wire    adc2iq_U0_ap_done;
wire    adc2iq_U0_ap_continue;
wire    adc2iq_U0_ap_idle;
wire    adc2iq_U0_ap_ready;
wire    adc2iq_U0_start_out;
wire    adc2iq_U0_start_write;
wire    adc2iq_U0_iin_data_TREADY;
wire    adc2iq_U0_qin_data_TREADY;
wire   [31:0] adc2iq_U0_iq_V_data_0_V_din;
wire    adc2iq_U0_iq_V_data_0_V_write;
wire   [31:0] adc2iq_U0_iq_V_data_1_V_din;
wire    adc2iq_U0_iq_V_data_1_V_write;
wire   [31:0] adc2iq_U0_iq_V_data_2_V_din;
wire    adc2iq_U0_iq_V_data_2_V_write;
wire   [31:0] adc2iq_U0_iq_V_data_3_V_din;
wire    adc2iq_U0_iq_V_data_3_V_write;
wire   [31:0] adc2iq_U0_iq_V_data_4_V_din;
wire    adc2iq_U0_iq_V_data_4_V_write;
wire   [31:0] adc2iq_U0_iq_V_data_5_V_din;
wire    adc2iq_U0_iq_V_data_5_V_write;
wire   [31:0] adc2iq_U0_iq_V_data_6_V_din;
wire    adc2iq_U0_iq_V_data_6_V_write;
wire   [31:0] adc2iq_U0_iq_V_data_7_V_din;
wire    adc2iq_U0_iq_V_data_7_V_write;
wire    process_lanes_U0_ap_start;
wire    process_lanes_U0_ap_done;
wire    process_lanes_U0_ap_continue;
wire    process_lanes_U0_ap_idle;
wire    process_lanes_U0_ap_ready;
wire    process_lanes_U0_iqstream_V_data_0_V_read;
wire    process_lanes_U0_iqstream_V_data_1_V_read;
wire    process_lanes_U0_iqstream_V_data_2_V_read;
wire    process_lanes_U0_iqstream_V_data_3_V_read;
wire    process_lanes_U0_iqstream_V_data_4_V_read;
wire    process_lanes_U0_iqstream_V_data_5_V_read;
wire    process_lanes_U0_iqstream_V_data_6_V_read;
wire    process_lanes_U0_iqstream_V_data_7_V_read;
wire   [31:0] process_lanes_U0_lane_0_TDATA;
wire    process_lanes_U0_lane_0_TVALID;
wire   [31:0] process_lanes_U0_lane_1_TDATA;
wire    process_lanes_U0_lane_1_TVALID;
wire   [31:0] process_lanes_U0_lane_2_TDATA;
wire    process_lanes_U0_lane_2_TVALID;
wire   [31:0] process_lanes_U0_lane_3_TDATA;
wire    process_lanes_U0_lane_3_TVALID;
wire   [31:0] process_lanes_U0_lane_4_TDATA;
wire    process_lanes_U0_lane_4_TVALID;
wire   [31:0] process_lanes_U0_lane_5_TDATA;
wire    process_lanes_U0_lane_5_TVALID;
wire   [31:0] process_lanes_U0_lane_6_TDATA;
wire    process_lanes_U0_lane_6_TVALID;
wire   [31:0] process_lanes_U0_lane_7_TDATA;
wire    process_lanes_U0_lane_7_TVALID;
wire   [31:0] process_lanes_U0_lane_8_TDATA;
wire    process_lanes_U0_lane_8_TVALID;
wire   [31:0] process_lanes_U0_lane_9_TDATA;
wire    process_lanes_U0_lane_9_TVALID;
wire   [31:0] process_lanes_U0_lane_10_TDATA;
wire    process_lanes_U0_lane_10_TVALID;
wire   [31:0] process_lanes_U0_lane_11_TDATA;
wire    process_lanes_U0_lane_11_TVALID;
wire   [31:0] process_lanes_U0_lane_12_TDATA;
wire    process_lanes_U0_lane_12_TVALID;
wire   [31:0] process_lanes_U0_lane_13_TDATA;
wire    process_lanes_U0_lane_13_TVALID;
wire   [31:0] process_lanes_U0_lane_14_TDATA;
wire    process_lanes_U0_lane_14_TVALID;
wire   [31:0] process_lanes_U0_lane_15_TDATA;
wire    process_lanes_U0_lane_15_TVALID;
wire   [0:0] process_lanes_U0_lane_0_TLAST;
wire   [0:0] process_lanes_U0_lane_1_TLAST;
wire   [0:0] process_lanes_U0_lane_2_TLAST;
wire   [0:0] process_lanes_U0_lane_3_TLAST;
wire   [0:0] process_lanes_U0_lane_4_TLAST;
wire   [0:0] process_lanes_U0_lane_5_TLAST;
wire   [0:0] process_lanes_U0_lane_6_TLAST;
wire   [0:0] process_lanes_U0_lane_7_TLAST;
wire   [0:0] process_lanes_U0_lane_8_TLAST;
wire   [0:0] process_lanes_U0_lane_9_TLAST;
wire   [0:0] process_lanes_U0_lane_10_TLAST;
wire   [0:0] process_lanes_U0_lane_11_TLAST;
wire   [0:0] process_lanes_U0_lane_12_TLAST;
wire   [0:0] process_lanes_U0_lane_13_TLAST;
wire   [0:0] process_lanes_U0_lane_14_TLAST;
wire   [0:0] process_lanes_U0_lane_15_TLAST;
wire    ap_sync_continue;
wire    iq_V_data_0_V_full_n;
wire   [31:0] iq_V_data_0_V_dout;
wire    iq_V_data_0_V_empty_n;
wire    iq_V_data_1_V_full_n;
wire   [31:0] iq_V_data_1_V_dout;
wire    iq_V_data_1_V_empty_n;
wire    iq_V_data_2_V_full_n;
wire   [31:0] iq_V_data_2_V_dout;
wire    iq_V_data_2_V_empty_n;
wire    iq_V_data_3_V_full_n;
wire   [31:0] iq_V_data_3_V_dout;
wire    iq_V_data_3_V_empty_n;
wire    iq_V_data_4_V_full_n;
wire   [31:0] iq_V_data_4_V_dout;
wire    iq_V_data_4_V_empty_n;
wire    iq_V_data_5_V_full_n;
wire   [31:0] iq_V_data_5_V_dout;
wire    iq_V_data_5_V_empty_n;
wire    iq_V_data_6_V_full_n;
wire   [31:0] iq_V_data_6_V_dout;
wire    iq_V_data_6_V_empty_n;
wire    iq_V_data_7_V_full_n;
wire   [31:0] iq_V_data_7_V_dout;
wire    iq_V_data_7_V_empty_n;
wire   [0:0] start_for_process_lanes_U0_din;
wire    start_for_process_lanes_U0_full_n;
wire   [0:0] start_for_process_lanes_U0_dout;
wire    start_for_process_lanes_U0_empty_n;
wire    process_lanes_U0_start_full_n;
wire    process_lanes_U0_start_write;

adc2iq adc2iq_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(adc2iq_U0_ap_start),
    .start_full_n(start_for_process_lanes_U0_full_n),
    .ap_done(adc2iq_U0_ap_done),
    .ap_continue(adc2iq_U0_ap_continue),
    .ap_idle(adc2iq_U0_ap_idle),
    .ap_ready(adc2iq_U0_ap_ready),
    .start_out(adc2iq_U0_start_out),
    .start_write(adc2iq_U0_start_write),
    .iin_data_TDATA(istream_data_TDATA),
    .iin_data_TVALID(istream_data_TVALID),
    .iin_data_TREADY(adc2iq_U0_iin_data_TREADY),
    .qin_data_TDATA(qstream_data_TDATA),
    .qin_data_TVALID(qstream_data_TVALID),
    .qin_data_TREADY(adc2iq_U0_qin_data_TREADY),
    .iq_V_data_0_V_din(adc2iq_U0_iq_V_data_0_V_din),
    .iq_V_data_0_V_full_n(iq_V_data_0_V_full_n),
    .iq_V_data_0_V_write(adc2iq_U0_iq_V_data_0_V_write),
    .iq_V_data_1_V_din(adc2iq_U0_iq_V_data_1_V_din),
    .iq_V_data_1_V_full_n(iq_V_data_1_V_full_n),
    .iq_V_data_1_V_write(adc2iq_U0_iq_V_data_1_V_write),
    .iq_V_data_2_V_din(adc2iq_U0_iq_V_data_2_V_din),
    .iq_V_data_2_V_full_n(iq_V_data_2_V_full_n),
    .iq_V_data_2_V_write(adc2iq_U0_iq_V_data_2_V_write),
    .iq_V_data_3_V_din(adc2iq_U0_iq_V_data_3_V_din),
    .iq_V_data_3_V_full_n(iq_V_data_3_V_full_n),
    .iq_V_data_3_V_write(adc2iq_U0_iq_V_data_3_V_write),
    .iq_V_data_4_V_din(adc2iq_U0_iq_V_data_4_V_din),
    .iq_V_data_4_V_full_n(iq_V_data_4_V_full_n),
    .iq_V_data_4_V_write(adc2iq_U0_iq_V_data_4_V_write),
    .iq_V_data_5_V_din(adc2iq_U0_iq_V_data_5_V_din),
    .iq_V_data_5_V_full_n(iq_V_data_5_V_full_n),
    .iq_V_data_5_V_write(adc2iq_U0_iq_V_data_5_V_write),
    .iq_V_data_6_V_din(adc2iq_U0_iq_V_data_6_V_din),
    .iq_V_data_6_V_full_n(iq_V_data_6_V_full_n),
    .iq_V_data_6_V_write(adc2iq_U0_iq_V_data_6_V_write),
    .iq_V_data_7_V_din(adc2iq_U0_iq_V_data_7_V_din),
    .iq_V_data_7_V_full_n(iq_V_data_7_V_full_n),
    .iq_V_data_7_V_write(adc2iq_U0_iq_V_data_7_V_write)
);

process_lanes process_lanes_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(process_lanes_U0_ap_start),
    .ap_done(process_lanes_U0_ap_done),
    .ap_continue(process_lanes_U0_ap_continue),
    .ap_idle(process_lanes_U0_ap_idle),
    .ap_ready(process_lanes_U0_ap_ready),
    .iqstream_V_data_0_V_dout(iq_V_data_0_V_dout),
    .iqstream_V_data_0_V_empty_n(iq_V_data_0_V_empty_n),
    .iqstream_V_data_0_V_read(process_lanes_U0_iqstream_V_data_0_V_read),
    .iqstream_V_data_1_V_dout(iq_V_data_1_V_dout),
    .iqstream_V_data_1_V_empty_n(iq_V_data_1_V_empty_n),
    .iqstream_V_data_1_V_read(process_lanes_U0_iqstream_V_data_1_V_read),
    .iqstream_V_data_2_V_dout(iq_V_data_2_V_dout),
    .iqstream_V_data_2_V_empty_n(iq_V_data_2_V_empty_n),
    .iqstream_V_data_2_V_read(process_lanes_U0_iqstream_V_data_2_V_read),
    .iqstream_V_data_3_V_dout(iq_V_data_3_V_dout),
    .iqstream_V_data_3_V_empty_n(iq_V_data_3_V_empty_n),
    .iqstream_V_data_3_V_read(process_lanes_U0_iqstream_V_data_3_V_read),
    .iqstream_V_data_4_V_dout(iq_V_data_4_V_dout),
    .iqstream_V_data_4_V_empty_n(iq_V_data_4_V_empty_n),
    .iqstream_V_data_4_V_read(process_lanes_U0_iqstream_V_data_4_V_read),
    .iqstream_V_data_5_V_dout(iq_V_data_5_V_dout),
    .iqstream_V_data_5_V_empty_n(iq_V_data_5_V_empty_n),
    .iqstream_V_data_5_V_read(process_lanes_U0_iqstream_V_data_5_V_read),
    .iqstream_V_data_6_V_dout(iq_V_data_6_V_dout),
    .iqstream_V_data_6_V_empty_n(iq_V_data_6_V_empty_n),
    .iqstream_V_data_6_V_read(process_lanes_U0_iqstream_V_data_6_V_read),
    .iqstream_V_data_7_V_dout(iq_V_data_7_V_dout),
    .iqstream_V_data_7_V_empty_n(iq_V_data_7_V_empty_n),
    .iqstream_V_data_7_V_read(process_lanes_U0_iqstream_V_data_7_V_read),
    .lane_0_TREADY(lane_0_TREADY),
    .lane_1_TREADY(lane_1_TREADY),
    .lane_2_TREADY(lane_2_TREADY),
    .lane_3_TREADY(lane_3_TREADY),
    .lane_4_TREADY(lane_4_TREADY),
    .lane_5_TREADY(lane_5_TREADY),
    .lane_6_TREADY(lane_6_TREADY),
    .lane_7_TREADY(lane_7_TREADY),
    .lane_8_TREADY(lane_8_TREADY),
    .lane_9_TREADY(lane_9_TREADY),
    .lane_10_TREADY(lane_10_TREADY),
    .lane_11_TREADY(lane_11_TREADY),
    .lane_12_TREADY(lane_12_TREADY),
    .lane_13_TREADY(lane_13_TREADY),
    .lane_14_TREADY(lane_14_TREADY),
    .lane_15_TREADY(lane_15_TREADY),
    .lane_0_TDATA(process_lanes_U0_lane_0_TDATA),
    .lane_0_TVALID(process_lanes_U0_lane_0_TVALID),
    .lane_1_TDATA(process_lanes_U0_lane_1_TDATA),
    .lane_1_TVALID(process_lanes_U0_lane_1_TVALID),
    .lane_2_TDATA(process_lanes_U0_lane_2_TDATA),
    .lane_2_TVALID(process_lanes_U0_lane_2_TVALID),
    .lane_3_TDATA(process_lanes_U0_lane_3_TDATA),
    .lane_3_TVALID(process_lanes_U0_lane_3_TVALID),
    .lane_4_TDATA(process_lanes_U0_lane_4_TDATA),
    .lane_4_TVALID(process_lanes_U0_lane_4_TVALID),
    .lane_5_TDATA(process_lanes_U0_lane_5_TDATA),
    .lane_5_TVALID(process_lanes_U0_lane_5_TVALID),
    .lane_6_TDATA(process_lanes_U0_lane_6_TDATA),
    .lane_6_TVALID(process_lanes_U0_lane_6_TVALID),
    .lane_7_TDATA(process_lanes_U0_lane_7_TDATA),
    .lane_7_TVALID(process_lanes_U0_lane_7_TVALID),
    .lane_8_TDATA(process_lanes_U0_lane_8_TDATA),
    .lane_8_TVALID(process_lanes_U0_lane_8_TVALID),
    .lane_9_TDATA(process_lanes_U0_lane_9_TDATA),
    .lane_9_TVALID(process_lanes_U0_lane_9_TVALID),
    .lane_10_TDATA(process_lanes_U0_lane_10_TDATA),
    .lane_10_TVALID(process_lanes_U0_lane_10_TVALID),
    .lane_11_TDATA(process_lanes_U0_lane_11_TDATA),
    .lane_11_TVALID(process_lanes_U0_lane_11_TVALID),
    .lane_12_TDATA(process_lanes_U0_lane_12_TDATA),
    .lane_12_TVALID(process_lanes_U0_lane_12_TVALID),
    .lane_13_TDATA(process_lanes_U0_lane_13_TDATA),
    .lane_13_TVALID(process_lanes_U0_lane_13_TVALID),
    .lane_14_TDATA(process_lanes_U0_lane_14_TDATA),
    .lane_14_TVALID(process_lanes_U0_lane_14_TVALID),
    .lane_15_TDATA(process_lanes_U0_lane_15_TDATA),
    .lane_15_TVALID(process_lanes_U0_lane_15_TVALID),
    .lane_0_TLAST(process_lanes_U0_lane_0_TLAST),
    .lane_1_TLAST(process_lanes_U0_lane_1_TLAST),
    .lane_2_TLAST(process_lanes_U0_lane_2_TLAST),
    .lane_3_TLAST(process_lanes_U0_lane_3_TLAST),
    .lane_4_TLAST(process_lanes_U0_lane_4_TLAST),
    .lane_5_TLAST(process_lanes_U0_lane_5_TLAST),
    .lane_6_TLAST(process_lanes_U0_lane_6_TLAST),
    .lane_7_TLAST(process_lanes_U0_lane_7_TLAST),
    .lane_8_TLAST(process_lanes_U0_lane_8_TLAST),
    .lane_9_TLAST(process_lanes_U0_lane_9_TLAST),
    .lane_10_TLAST(process_lanes_U0_lane_10_TLAST),
    .lane_11_TLAST(process_lanes_U0_lane_11_TLAST),
    .lane_12_TLAST(process_lanes_U0_lane_12_TLAST),
    .lane_13_TLAST(process_lanes_U0_lane_13_TLAST),
    .lane_14_TLAST(process_lanes_U0_lane_14_TLAST),
    .lane_15_TLAST(process_lanes_U0_lane_15_TLAST)
);

fifo_w32_d2_A iq_V_data_0_V_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(adc2iq_U0_iq_V_data_0_V_din),
    .if_full_n(iq_V_data_0_V_full_n),
    .if_write(adc2iq_U0_iq_V_data_0_V_write),
    .if_dout(iq_V_data_0_V_dout),
    .if_empty_n(iq_V_data_0_V_empty_n),
    .if_read(process_lanes_U0_iqstream_V_data_0_V_read)
);

fifo_w32_d2_A iq_V_data_1_V_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(adc2iq_U0_iq_V_data_1_V_din),
    .if_full_n(iq_V_data_1_V_full_n),
    .if_write(adc2iq_U0_iq_V_data_1_V_write),
    .if_dout(iq_V_data_1_V_dout),
    .if_empty_n(iq_V_data_1_V_empty_n),
    .if_read(process_lanes_U0_iqstream_V_data_1_V_read)
);

fifo_w32_d2_A iq_V_data_2_V_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(adc2iq_U0_iq_V_data_2_V_din),
    .if_full_n(iq_V_data_2_V_full_n),
    .if_write(adc2iq_U0_iq_V_data_2_V_write),
    .if_dout(iq_V_data_2_V_dout),
    .if_empty_n(iq_V_data_2_V_empty_n),
    .if_read(process_lanes_U0_iqstream_V_data_2_V_read)
);

fifo_w32_d2_A iq_V_data_3_V_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(adc2iq_U0_iq_V_data_3_V_din),
    .if_full_n(iq_V_data_3_V_full_n),
    .if_write(adc2iq_U0_iq_V_data_3_V_write),
    .if_dout(iq_V_data_3_V_dout),
    .if_empty_n(iq_V_data_3_V_empty_n),
    .if_read(process_lanes_U0_iqstream_V_data_3_V_read)
);

fifo_w32_d2_A iq_V_data_4_V_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(adc2iq_U0_iq_V_data_4_V_din),
    .if_full_n(iq_V_data_4_V_full_n),
    .if_write(adc2iq_U0_iq_V_data_4_V_write),
    .if_dout(iq_V_data_4_V_dout),
    .if_empty_n(iq_V_data_4_V_empty_n),
    .if_read(process_lanes_U0_iqstream_V_data_4_V_read)
);

fifo_w32_d2_A iq_V_data_5_V_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(adc2iq_U0_iq_V_data_5_V_din),
    .if_full_n(iq_V_data_5_V_full_n),
    .if_write(adc2iq_U0_iq_V_data_5_V_write),
    .if_dout(iq_V_data_5_V_dout),
    .if_empty_n(iq_V_data_5_V_empty_n),
    .if_read(process_lanes_U0_iqstream_V_data_5_V_read)
);

fifo_w32_d2_A iq_V_data_6_V_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(adc2iq_U0_iq_V_data_6_V_din),
    .if_full_n(iq_V_data_6_V_full_n),
    .if_write(adc2iq_U0_iq_V_data_6_V_write),
    .if_dout(iq_V_data_6_V_dout),
    .if_empty_n(iq_V_data_6_V_empty_n),
    .if_read(process_lanes_U0_iqstream_V_data_6_V_read)
);

fifo_w32_d2_A iq_V_data_7_V_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(adc2iq_U0_iq_V_data_7_V_din),
    .if_full_n(iq_V_data_7_V_full_n),
    .if_write(adc2iq_U0_iq_V_data_7_V_write),
    .if_dout(iq_V_data_7_V_dout),
    .if_empty_n(iq_V_data_7_V_empty_n),
    .if_read(process_lanes_U0_iqstream_V_data_7_V_read)
);

start_for_processrcU start_for_processrcU_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(start_for_process_lanes_U0_din),
    .if_full_n(start_for_process_lanes_U0_full_n),
    .if_write(adc2iq_U0_start_write),
    .if_dout(start_for_process_lanes_U0_dout),
    .if_empty_n(start_for_process_lanes_U0_empty_n),
    .if_read(process_lanes_U0_ap_ready)
);

assign adc2iq_U0_ap_continue = 1'b1;

assign adc2iq_U0_ap_start = 1'b1;

always @ (*) begin
    ap_rst_n_inv = ~ap_rst_n;
end

assign ap_sync_continue = 1'b0;

assign istream_data_TREADY = adc2iq_U0_iin_data_TREADY;

assign lane_0_TDATA = process_lanes_U0_lane_0_TDATA;

assign lane_0_TLAST = process_lanes_U0_lane_0_TLAST;

assign lane_0_TVALID = process_lanes_U0_lane_0_TVALID;

assign lane_10_TDATA = process_lanes_U0_lane_10_TDATA;

assign lane_10_TLAST = process_lanes_U0_lane_10_TLAST;

assign lane_10_TVALID = process_lanes_U0_lane_10_TVALID;

assign lane_11_TDATA = process_lanes_U0_lane_11_TDATA;

assign lane_11_TLAST = process_lanes_U0_lane_11_TLAST;

assign lane_11_TVALID = process_lanes_U0_lane_11_TVALID;

assign lane_12_TDATA = process_lanes_U0_lane_12_TDATA;

assign lane_12_TLAST = process_lanes_U0_lane_12_TLAST;

assign lane_12_TVALID = process_lanes_U0_lane_12_TVALID;

assign lane_13_TDATA = process_lanes_U0_lane_13_TDATA;

assign lane_13_TLAST = process_lanes_U0_lane_13_TLAST;

assign lane_13_TVALID = process_lanes_U0_lane_13_TVALID;

assign lane_14_TDATA = process_lanes_U0_lane_14_TDATA;

assign lane_14_TLAST = process_lanes_U0_lane_14_TLAST;

assign lane_14_TVALID = process_lanes_U0_lane_14_TVALID;

assign lane_15_TDATA = process_lanes_U0_lane_15_TDATA;

assign lane_15_TLAST = process_lanes_U0_lane_15_TLAST;

assign lane_15_TVALID = process_lanes_U0_lane_15_TVALID;

assign lane_1_TDATA = process_lanes_U0_lane_1_TDATA;

assign lane_1_TLAST = process_lanes_U0_lane_1_TLAST;

assign lane_1_TVALID = process_lanes_U0_lane_1_TVALID;

assign lane_2_TDATA = process_lanes_U0_lane_2_TDATA;

assign lane_2_TLAST = process_lanes_U0_lane_2_TLAST;

assign lane_2_TVALID = process_lanes_U0_lane_2_TVALID;

assign lane_3_TDATA = process_lanes_U0_lane_3_TDATA;

assign lane_3_TLAST = process_lanes_U0_lane_3_TLAST;

assign lane_3_TVALID = process_lanes_U0_lane_3_TVALID;

assign lane_4_TDATA = process_lanes_U0_lane_4_TDATA;

assign lane_4_TLAST = process_lanes_U0_lane_4_TLAST;

assign lane_4_TVALID = process_lanes_U0_lane_4_TVALID;

assign lane_5_TDATA = process_lanes_U0_lane_5_TDATA;

assign lane_5_TLAST = process_lanes_U0_lane_5_TLAST;

assign lane_5_TVALID = process_lanes_U0_lane_5_TVALID;

assign lane_6_TDATA = process_lanes_U0_lane_6_TDATA;

assign lane_6_TLAST = process_lanes_U0_lane_6_TLAST;

assign lane_6_TVALID = process_lanes_U0_lane_6_TVALID;

assign lane_7_TDATA = process_lanes_U0_lane_7_TDATA;

assign lane_7_TLAST = process_lanes_U0_lane_7_TLAST;

assign lane_7_TVALID = process_lanes_U0_lane_7_TVALID;

assign lane_8_TDATA = process_lanes_U0_lane_8_TDATA;

assign lane_8_TLAST = process_lanes_U0_lane_8_TLAST;

assign lane_8_TVALID = process_lanes_U0_lane_8_TVALID;

assign lane_9_TDATA = process_lanes_U0_lane_9_TDATA;

assign lane_9_TLAST = process_lanes_U0_lane_9_TLAST;

assign lane_9_TVALID = process_lanes_U0_lane_9_TVALID;

assign process_lanes_U0_ap_continue = 1'b1;

assign process_lanes_U0_ap_start = start_for_process_lanes_U0_empty_n;

assign process_lanes_U0_start_full_n = 1'b1;

assign process_lanes_U0_start_write = 1'b0;

assign qstream_data_TREADY = adc2iq_U0_qin_data_TREADY;

assign start_for_process_lanes_U0_din = 1'b1;

endmodule //adc_to_opfb
