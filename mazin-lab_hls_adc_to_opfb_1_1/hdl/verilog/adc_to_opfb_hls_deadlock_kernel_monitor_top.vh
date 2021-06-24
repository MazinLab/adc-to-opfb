
wire kernel_monitor_reset;
wire kernel_monitor_clock;
assign kernel_monitor_reset = ~ap_rst_n;
assign kernel_monitor_clock = ap_clk;
wire [2:0] axis_block_sigs;
wire [4:0] inst_idle_sigs;
wire [1:0] inst_block_sigs;
wire kernel_block;

assign axis_block_sigs[0] = ~adc2iq_U0.istream_V_TDATA_blk_n;
assign axis_block_sigs[1] = ~adc2iq_U0.qstream_V_TDATA_blk_n;
assign axis_block_sigs[2] = ~process_lanes_U0.lanes_TDATA_blk_n;

assign inst_idle_sigs[0] = adc2iq_U0.ap_idle;
assign inst_block_sigs[0] = (adc2iq_U0.ap_done & ~adc2iq_U0.ap_continue);
assign inst_idle_sigs[1] = process_lanes_U0.ap_idle;
assign inst_block_sigs[1] = (process_lanes_U0.ap_done & ~process_lanes_U0.ap_continue) | ~process_lanes_U0.iq1_blk_n;

assign inst_idle_sigs[2] = 1'b0;
assign inst_idle_sigs[3] = adc2iq_U0.ap_idle;
assign inst_idle_sigs[4] = process_lanes_U0.ap_idle;

adc_to_opfb_hls_deadlock_idx0_monitor adc_to_opfb_hls_deadlock_idx0_monitor_U (
    .clock(kernel_monitor_clock),
    .reset(kernel_monitor_reset),
    .axis_block_sigs(axis_block_sigs),
    .inst_idle_sigs(inst_idle_sigs),
    .inst_block_sigs(inst_block_sigs),
    .block(kernel_block)
);

