// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and OpenCL
// Version: 2019.2.1
// Copyright (C) 1986-2019 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="adc_to_opfb,hls_ip_2019_2_1,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=1,HLS_INPUT_PART=xczu28dr-ffvg1517-2-e,HLS_INPUT_CLOCK=1.818000,HLS_INPUT_ARCH=dataflow,HLS_SYN_CLOCK=1.516000,HLS_SYN_LAT=3,HLS_SYN_TPT=1,HLS_SYN_MEM=16,HLS_SYN_DSP=0,HLS_SYN_FF=548,HLS_SYN_LUT=2139,HLS_VERSION=2019_2_1}" *)

module adc_to_opfb (
        istream_V_TDATA,
        qstream_V_TDATA,
        lane_TDATA,
        lane_TLAST,
        ap_clk,
        ap_rst_n,
        istream_V_TVALID,
        istream_V_TREADY,
        qstream_V_TVALID,
        qstream_V_TREADY,
        lane_TVALID,
        lane_TREADY
);


input  [127:0] istream_V_TDATA;
input  [127:0] qstream_V_TDATA;
output  [511:0] lane_TDATA;
output  [0:0] lane_TLAST;
input   ap_clk;
input   ap_rst_n;
input   istream_V_TVALID;
output   istream_V_TREADY;
input   qstream_V_TVALID;
output   qstream_V_TREADY;
output   lane_TVALID;
input   lane_TREADY;

 reg    ap_rst_n_inv;
wire    adc2iq_U0_ap_start;
wire    adc2iq_U0_ap_done;
wire    adc2iq_U0_ap_continue;
wire    adc2iq_U0_ap_idle;
wire    adc2iq_U0_ap_ready;
wire    adc2iq_U0_start_out;
wire    adc2iq_U0_start_write;
wire    adc2iq_U0_iin_V_TREADY;
wire    adc2iq_U0_qin_V_TREADY;
wire   [255:0] adc2iq_U0_iq_V_V_din;
wire    adc2iq_U0_iq_V_V_write;
wire    process_lanes_U0_ap_start;
wire    process_lanes_U0_ap_done;
wire    process_lanes_U0_ap_continue;
wire    process_lanes_U0_ap_idle;
wire    process_lanes_U0_ap_ready;
wire    process_lanes_U0_iqstream_V_V_read;
wire   [511:0] process_lanes_U0_lane_TDATA;
wire    process_lanes_U0_lane_TVALID;
wire   [0:0] process_lanes_U0_lane_TLAST;
wire    ap_sync_continue;
wire    iq_V_V_full_n;
wire   [255:0] iq_V_V_dout;
wire    iq_V_V_empty_n;
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
    .iin_V_TDATA(istream_V_TDATA),
    .iin_V_TVALID(istream_V_TVALID),
    .iin_V_TREADY(adc2iq_U0_iin_V_TREADY),
    .qin_V_TDATA(qstream_V_TDATA),
    .qin_V_TVALID(qstream_V_TVALID),
    .qin_V_TREADY(adc2iq_U0_qin_V_TREADY),
    .iq_V_V_din(adc2iq_U0_iq_V_V_din),
    .iq_V_V_full_n(iq_V_V_full_n),
    .iq_V_V_write(adc2iq_U0_iq_V_V_write)
);

process_lanes process_lanes_U0(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst_n_inv),
    .ap_start(process_lanes_U0_ap_start),
    .ap_done(process_lanes_U0_ap_done),
    .ap_continue(process_lanes_U0_ap_continue),
    .ap_idle(process_lanes_U0_ap_idle),
    .ap_ready(process_lanes_U0_ap_ready),
    .iqstream_V_V_dout(iq_V_V_dout),
    .iqstream_V_V_empty_n(iq_V_V_empty_n),
    .iqstream_V_V_read(process_lanes_U0_iqstream_V_V_read),
    .lane_TREADY(lane_TREADY),
    .lane_TDATA(process_lanes_U0_lane_TDATA),
    .lane_TVALID(process_lanes_U0_lane_TVALID),
    .lane_TLAST(process_lanes_U0_lane_TLAST)
);

fifo_w256_d2_A iq_V_V_U(
    .clk(ap_clk),
    .reset(ap_rst_n_inv),
    .if_read_ce(1'b1),
    .if_write_ce(1'b1),
    .if_din(adc2iq_U0_iq_V_V_din),
    .if_full_n(iq_V_V_full_n),
    .if_write(adc2iq_U0_iq_V_V_write),
    .if_dout(iq_V_V_dout),
    .if_empty_n(iq_V_V_empty_n),
    .if_read(process_lanes_U0_iqstream_V_V_read)
);

start_for_processdEe start_for_processdEe_U(
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

assign istream_V_TREADY = adc2iq_U0_iin_V_TREADY;

assign lane_TDATA = process_lanes_U0_lane_TDATA;

assign lane_TLAST = process_lanes_U0_lane_TLAST;

assign lane_TVALID = process_lanes_U0_lane_TVALID;

assign process_lanes_U0_ap_continue = 1'b1;

assign process_lanes_U0_ap_start = start_for_process_lanes_U0_empty_n;

assign process_lanes_U0_start_full_n = 1'b1;

assign process_lanes_U0_start_write = 1'b0;

assign qstream_V_TREADY = adc2iq_U0_qin_V_TREADY;

assign start_for_process_lanes_U0_din = 1'b1;

endmodule //adc_to_opfb
