// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL
// Version: 2020.1.1
// Copyright (C) 1986-2020 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module adc_to_opfb_process_lanes (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        iqstream_dout,
        iqstream_empty_n,
        iqstream_read,
        lanes_TREADY,
        lanes_TDATA,
        lanes_TVALID,
        lanes_TLAST
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
input  [255:0] iqstream_dout;
input   iqstream_empty_n;
output   iqstream_read;
input   lanes_TREADY;
output  [511:0] lanes_TDATA;
output   lanes_TVALID;
output  [0:0] lanes_TLAST;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg iqstream_read;

reg    ap_done_reg;
(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_enable_reg_pp0_iter2;
reg    ap_enable_reg_pp0_iter3;
reg    ap_idle_pp0;
reg    ap_block_state1_pp0_stage0_iter0;
wire    ap_block_state2_pp0_stage0_iter1;
wire    ap_block_state3_pp0_stage0_iter2;
wire    regslice_both_lanes_V_data_V_U_apdone_blk;
reg    ap_block_state4_pp0_stage0_iter3;
reg    ap_block_pp0_stage0_11001;
reg   [8:0] cycle;
reg   [0:0] primed;
reg   [255:0] even_lane_z1;
reg    even_delay_Array_V_ce0;
reg    even_delay_Array_V_we0;
wire   [255:0] even_delay_Array_V_q0;
reg    odd_delay_Array_V_ce0;
reg    odd_delay_Array_V_we0;
wire   [255:0] odd_delay_Array_V_q0;
reg    iqstream_blk_n;
wire    ap_block_pp0_stage0;
reg    lanes_TDATA_blk_n;
reg   [255:0] tmp_V_reg_186;
reg   [255:0] tmp_V_reg_186_pp0_iter1_reg;
wire   [0:0] p_Result_s_fu_72_p1;
reg   [0:0] p_Result_s_reg_194;
wire   [0:0] xor_ln29_fu_76_p2;
reg   [0:0] xor_ln29_reg_200;
reg   [255:0] odd_delay_iq_V_reg_205;
wire   [0:0] tmp_last_V_fu_91_p2;
reg   [0:0] tmp_last_V_reg_210;
reg    ap_block_pp0_stage0_subdone;
wire   [8:0] add_ln695_fu_97_p2;
wire   [0:0] or_ln47_fu_175_p2;
wire   [255:0] select_ln324_fu_163_p3;
reg    ap_block_pp0_stage0_01001;
wire   [511:0] p_Result_3_fu_125_p3;
wire   [511:0] p_Result_4_fu_132_p3;
wire   [511:0] select_ln33_1_fu_147_p3;
wire   [511:0] select_ln33_fu_139_p3;
reg   [0:0] ap_NS_fsm;
reg    ap_idle_pp0_0to2;
reg    ap_reset_idle_pp0;
wire    ap_enable_pp0;
wire   [511:0] lanes_TDATA_int_regslice;
reg    lanes_TVALID_int_regslice;
wire    lanes_TREADY_int_regslice;
wire    regslice_both_lanes_V_data_V_U_vld_out;
wire    regslice_both_lanes_V_last_V_U_apdone_blk;
wire    regslice_both_lanes_V_last_V_U_ack_in_dummy;
wire    regslice_both_lanes_V_last_V_U_vld_out;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
#0 ap_enable_reg_pp0_iter3 = 1'b0;
#0 cycle = 9'd0;
#0 primed = 1'd0;
#0 even_lane_z1 = 256'd0;
end

adc_to_opfb_process_lanes_even_delay_Array_V #(
    .DataWidth( 256 ),
    .AddressRange( 128 ),
    .AddressWidth( 7 ))
even_delay_Array_V_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(7'd127),
    .ce0(even_delay_Array_V_ce0),
    .we0(even_delay_Array_V_we0),
    .d0(tmp_V_reg_186_pp0_iter1_reg),
    .q0(even_delay_Array_V_q0)
);

adc_to_opfb_process_lanes_even_delay_Array_V #(
    .DataWidth( 256 ),
    .AddressRange( 128 ),
    .AddressWidth( 7 ))
odd_delay_Array_V_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(7'd127),
    .ce0(odd_delay_Array_V_ce0),
    .we0(odd_delay_Array_V_we0),
    .d0(tmp_V_reg_186),
    .q0(odd_delay_Array_V_q0)
);

regslice_both #(
    .DataWidth( 512 ))
regslice_both_lanes_V_data_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .data_in(lanes_TDATA_int_regslice),
    .vld_in(lanes_TVALID_int_regslice),
    .ack_in(lanes_TREADY_int_regslice),
    .data_out(lanes_TDATA),
    .vld_out(regslice_both_lanes_V_data_V_U_vld_out),
    .ack_out(lanes_TREADY),
    .apdone_blk(regslice_both_lanes_V_data_V_U_apdone_blk)
);

regslice_both #(
    .DataWidth( 1 ))
regslice_both_lanes_V_last_V_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .data_in(tmp_last_V_reg_210),
    .vld_in(lanes_TVALID_int_regslice),
    .ack_in(regslice_both_lanes_V_last_V_U_ack_in_dummy),
    .data_out(lanes_TLAST),
    .vld_out(regslice_both_lanes_V_last_V_U_vld_out),
    .ack_out(lanes_TREADY),
    .apdone_blk(regslice_both_lanes_V_last_V_U_apdone_blk)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_pp0_stage0;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_done_reg <= 1'b0;
    end else begin
        if ((ap_continue == 1'b1)) begin
            ap_done_reg <= 1'b0;
        end else if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter3 == 1'b1))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ap_enable_reg_pp0_iter1 <= ap_start;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter2 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter3 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter3 <= ap_enable_reg_pp0_iter2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        cycle <= add_ln695_fu_97_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        even_lane_z1 <= select_ln324_fu_163_p3;
        primed <= or_ln47_fu_175_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        odd_delay_iq_V_reg_205 <= odd_delay_Array_V_q0;
        p_Result_s_reg_194 <= p_Result_s_fu_72_p1;
        tmp_V_reg_186 <= iqstream_dout;
        tmp_V_reg_186_pp0_iter1_reg <= tmp_V_reg_186;
        tmp_last_V_reg_210 <= tmp_last_V_fu_91_p2;
        xor_ln29_reg_200 <= xor_ln29_fu_76_p2;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter3 == 1'b1))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = ap_done_reg;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) & (ap_idle_pp0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter3 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0_0to2 = 1'b1;
    end else begin
        ap_idle_pp0_0to2 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) & (ap_idle_pp0_0to2 == 1'b1))) begin
        ap_reset_idle_pp0 = 1'b1;
    end else begin
        ap_reset_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        even_delay_Array_V_ce0 = xor_ln29_reg_200;
    end else begin
        even_delay_Array_V_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        even_delay_Array_V_we0 = xor_ln29_reg_200;
    end else begin
        even_delay_Array_V_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b0 == ap_block_pp0_stage0) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        iqstream_blk_n = iqstream_empty_n;
    end else begin
        iqstream_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_start == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        iqstream_read = 1'b1;
    end else begin
        iqstream_read = 1'b0;
    end
end

always @ (*) begin
    if ((((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter3 == 1'b1)) | ((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter2 == 1'b1)))) begin
        lanes_TDATA_blk_n = lanes_TREADY_int_regslice;
    end else begin
        lanes_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
        lanes_TVALID_int_regslice = 1'b1;
    end else begin
        lanes_TVALID_int_regslice = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        odd_delay_Array_V_ce0 = p_Result_s_fu_72_p1;
    end else begin
        odd_delay_Array_V_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        odd_delay_Array_V_we0 = p_Result_s_fu_72_p1;
    end else begin
        odd_delay_Array_V_we0 = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_pp0_stage0 : begin
            ap_NS_fsm = ap_ST_fsm_pp0_stage0;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln695_fu_97_p2 = (9'd1 + cycle);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_01001 = ((ap_done_reg == 1'b1) | ((regslice_both_lanes_V_data_V_U_apdone_blk == 1'b1) & (ap_enable_reg_pp0_iter3 == 1'b1)) | ((ap_start == 1'b1) & ((ap_start == 1'b0) | (iqstream_empty_n == 1'b0) | (ap_done_reg == 1'b1))));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = ((ap_done_reg == 1'b1) | ((ap_enable_reg_pp0_iter3 == 1'b1) & ((regslice_both_lanes_V_data_V_U_apdone_blk == 1'b1) | (lanes_TREADY_int_regslice == 1'b0))) | ((ap_enable_reg_pp0_iter2 == 1'b1) & (lanes_TREADY_int_regslice == 1'b0)) | ((ap_start == 1'b1) & ((ap_start == 1'b0) | (iqstream_empty_n == 1'b0) | (ap_done_reg == 1'b1))));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = ((ap_done_reg == 1'b1) | ((ap_enable_reg_pp0_iter3 == 1'b1) & ((regslice_both_lanes_V_data_V_U_apdone_blk == 1'b1) | (lanes_TREADY_int_regslice == 1'b0))) | ((ap_enable_reg_pp0_iter2 == 1'b1) & (lanes_TREADY_int_regslice == 1'b0)) | ((ap_start == 1'b1) & ((ap_start == 1'b0) | (iqstream_empty_n == 1'b0) | (ap_done_reg == 1'b1))));
end

always @ (*) begin
    ap_block_state1_pp0_stage0_iter0 = ((ap_start == 1'b0) | (iqstream_empty_n == 1'b0) | (ap_done_reg == 1'b1));
end

assign ap_block_state2_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state3_pp0_stage0_iter2 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state4_pp0_stage0_iter3 = (regslice_both_lanes_V_data_V_U_apdone_blk == 1'b1);
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start;

assign lanes_TDATA_int_regslice = ((p_Result_s_reg_194[0:0] === 1'b1) ? select_ln33_1_fu_147_p3 : select_ln33_fu_139_p3);

assign lanes_TVALID = regslice_both_lanes_V_data_V_U_vld_out;

assign or_ln47_fu_175_p2 = (tmp_last_V_reg_210 | primed);

assign p_Result_3_fu_125_p3 = {{odd_delay_iq_V_reg_205}, {even_lane_z1}};

assign p_Result_4_fu_132_p3 = {{tmp_V_reg_186_pp0_iter1_reg}, {even_lane_z1}};

assign p_Result_s_fu_72_p1 = cycle[0:0];

assign select_ln324_fu_163_p3 = ((p_Result_s_reg_194[0:0] === 1'b1) ? even_delay_Array_V_q0 : tmp_V_reg_186_pp0_iter1_reg);

assign select_ln33_1_fu_147_p3 = ((primed[0:0] === 1'b1) ? p_Result_4_fu_132_p3 : 512'd0);

assign select_ln33_fu_139_p3 = ((primed[0:0] === 1'b1) ? p_Result_3_fu_125_p3 : 512'd0);

assign tmp_last_V_fu_91_p2 = ((cycle == 9'd511) ? 1'b1 : 1'b0);

assign xor_ln29_fu_76_p2 = (p_Result_s_fu_72_p1 ^ 1'd1);

endmodule //adc_to_opfb_process_lanes
