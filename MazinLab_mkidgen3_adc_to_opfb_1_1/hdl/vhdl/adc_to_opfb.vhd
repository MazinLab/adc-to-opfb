-- ==============================================================
-- RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and OpenCL
-- Version: 2019.2.1
-- Copyright (C) 1986-2019 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity adc_to_opfb is
port (
    istream_V_TDATA : IN STD_LOGIC_VECTOR (127 downto 0);
    qstream_V_TDATA : IN STD_LOGIC_VECTOR (127 downto 0);
    lane_TDATA : OUT STD_LOGIC_VECTOR (511 downto 0);
    lane_TLAST : OUT STD_LOGIC_VECTOR (0 downto 0);
    ap_clk : IN STD_LOGIC;
    ap_rst_n : IN STD_LOGIC;
    istream_V_TVALID : IN STD_LOGIC;
    istream_V_TREADY : OUT STD_LOGIC;
    qstream_V_TVALID : IN STD_LOGIC;
    qstream_V_TREADY : OUT STD_LOGIC;
    lane_TVALID : OUT STD_LOGIC;
    lane_TREADY : IN STD_LOGIC );
end;


architecture behav of adc_to_opfb is 
    attribute CORE_GENERATION_INFO : STRING;
    attribute CORE_GENERATION_INFO of behav : architecture is
    "adc_to_opfb,hls_ip_2019_2_1,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=1,HLS_INPUT_PART=xczu28dr-ffvg1517-2-e,HLS_INPUT_CLOCK=1.818000,HLS_INPUT_ARCH=dataflow,HLS_SYN_CLOCK=1.516000,HLS_SYN_LAT=3,HLS_SYN_TPT=1,HLS_SYN_MEM=16,HLS_SYN_DSP=0,HLS_SYN_FF=548,HLS_SYN_LUT=2139,HLS_VERSION=2019_2_1}";
    constant ap_const_lv512_lc_1 : STD_LOGIC_VECTOR (511 downto 0) := "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';

    signal ap_rst_n_inv : STD_LOGIC;
    signal adc2iq_U0_ap_start : STD_LOGIC;
    signal adc2iq_U0_ap_done : STD_LOGIC;
    signal adc2iq_U0_ap_continue : STD_LOGIC;
    signal adc2iq_U0_ap_idle : STD_LOGIC;
    signal adc2iq_U0_ap_ready : STD_LOGIC;
    signal adc2iq_U0_start_out : STD_LOGIC;
    signal adc2iq_U0_start_write : STD_LOGIC;
    signal adc2iq_U0_iin_V_TREADY : STD_LOGIC;
    signal adc2iq_U0_qin_V_TREADY : STD_LOGIC;
    signal adc2iq_U0_iq_V_V_din : STD_LOGIC_VECTOR (255 downto 0);
    signal adc2iq_U0_iq_V_V_write : STD_LOGIC;
    signal process_lanes_U0_ap_start : STD_LOGIC;
    signal process_lanes_U0_ap_done : STD_LOGIC;
    signal process_lanes_U0_ap_continue : STD_LOGIC;
    signal process_lanes_U0_ap_idle : STD_LOGIC;
    signal process_lanes_U0_ap_ready : STD_LOGIC;
    signal process_lanes_U0_iqstream_V_V_read : STD_LOGIC;
    signal process_lanes_U0_lane_TDATA : STD_LOGIC_VECTOR (511 downto 0);
    signal process_lanes_U0_lane_TVALID : STD_LOGIC;
    signal process_lanes_U0_lane_TLAST : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_sync_continue : STD_LOGIC;
    signal iq_V_V_full_n : STD_LOGIC;
    signal iq_V_V_dout : STD_LOGIC_VECTOR (255 downto 0);
    signal iq_V_V_empty_n : STD_LOGIC;
    signal start_for_process_lanes_U0_din : STD_LOGIC_VECTOR (0 downto 0);
    signal start_for_process_lanes_U0_full_n : STD_LOGIC;
    signal start_for_process_lanes_U0_dout : STD_LOGIC_VECTOR (0 downto 0);
    signal start_for_process_lanes_U0_empty_n : STD_LOGIC;
    signal process_lanes_U0_start_full_n : STD_LOGIC;
    signal process_lanes_U0_start_write : STD_LOGIC;

    component adc2iq IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        start_full_n : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_continue : IN STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        start_out : OUT STD_LOGIC;
        start_write : OUT STD_LOGIC;
        iin_V_TDATA : IN STD_LOGIC_VECTOR (127 downto 0);
        iin_V_TVALID : IN STD_LOGIC;
        iin_V_TREADY : OUT STD_LOGIC;
        qin_V_TDATA : IN STD_LOGIC_VECTOR (127 downto 0);
        qin_V_TVALID : IN STD_LOGIC;
        qin_V_TREADY : OUT STD_LOGIC;
        iq_V_V_din : OUT STD_LOGIC_VECTOR (255 downto 0);
        iq_V_V_full_n : IN STD_LOGIC;
        iq_V_V_write : OUT STD_LOGIC );
    end component;


    component process_lanes IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_continue : IN STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        iqstream_V_V_dout : IN STD_LOGIC_VECTOR (255 downto 0);
        iqstream_V_V_empty_n : IN STD_LOGIC;
        iqstream_V_V_read : OUT STD_LOGIC;
        lane_TREADY : IN STD_LOGIC;
        lane_TDATA : OUT STD_LOGIC_VECTOR (511 downto 0);
        lane_TVALID : OUT STD_LOGIC;
        lane_TLAST : OUT STD_LOGIC_VECTOR (0 downto 0) );
    end component;


    component fifo_w256_d2_A IS
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        if_read_ce : IN STD_LOGIC;
        if_write_ce : IN STD_LOGIC;
        if_din : IN STD_LOGIC_VECTOR (255 downto 0);
        if_full_n : OUT STD_LOGIC;
        if_write : IN STD_LOGIC;
        if_dout : OUT STD_LOGIC_VECTOR (255 downto 0);
        if_empty_n : OUT STD_LOGIC;
        if_read : IN STD_LOGIC );
    end component;


    component start_for_processdEe IS
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        if_read_ce : IN STD_LOGIC;
        if_write_ce : IN STD_LOGIC;
        if_din : IN STD_LOGIC_VECTOR (0 downto 0);
        if_full_n : OUT STD_LOGIC;
        if_write : IN STD_LOGIC;
        if_dout : OUT STD_LOGIC_VECTOR (0 downto 0);
        if_empty_n : OUT STD_LOGIC;
        if_read : IN STD_LOGIC );
    end component;



begin
    adc2iq_U0 : component adc2iq
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        ap_start => adc2iq_U0_ap_start,
        start_full_n => start_for_process_lanes_U0_full_n,
        ap_done => adc2iq_U0_ap_done,
        ap_continue => adc2iq_U0_ap_continue,
        ap_idle => adc2iq_U0_ap_idle,
        ap_ready => adc2iq_U0_ap_ready,
        start_out => adc2iq_U0_start_out,
        start_write => adc2iq_U0_start_write,
        iin_V_TDATA => istream_V_TDATA,
        iin_V_TVALID => istream_V_TVALID,
        iin_V_TREADY => adc2iq_U0_iin_V_TREADY,
        qin_V_TDATA => qstream_V_TDATA,
        qin_V_TVALID => qstream_V_TVALID,
        qin_V_TREADY => adc2iq_U0_qin_V_TREADY,
        iq_V_V_din => adc2iq_U0_iq_V_V_din,
        iq_V_V_full_n => iq_V_V_full_n,
        iq_V_V_write => adc2iq_U0_iq_V_V_write);

    process_lanes_U0 : component process_lanes
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        ap_start => process_lanes_U0_ap_start,
        ap_done => process_lanes_U0_ap_done,
        ap_continue => process_lanes_U0_ap_continue,
        ap_idle => process_lanes_U0_ap_idle,
        ap_ready => process_lanes_U0_ap_ready,
        iqstream_V_V_dout => iq_V_V_dout,
        iqstream_V_V_empty_n => iq_V_V_empty_n,
        iqstream_V_V_read => process_lanes_U0_iqstream_V_V_read,
        lane_TREADY => lane_TREADY,
        lane_TDATA => process_lanes_U0_lane_TDATA,
        lane_TVALID => process_lanes_U0_lane_TVALID,
        lane_TLAST => process_lanes_U0_lane_TLAST);

    iq_V_V_U : component fifo_w256_d2_A
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => adc2iq_U0_iq_V_V_din,
        if_full_n => iq_V_V_full_n,
        if_write => adc2iq_U0_iq_V_V_write,
        if_dout => iq_V_V_dout,
        if_empty_n => iq_V_V_empty_n,
        if_read => process_lanes_U0_iqstream_V_V_read);

    start_for_processdEe_U : component start_for_processdEe
    port map (
        clk => ap_clk,
        reset => ap_rst_n_inv,
        if_read_ce => ap_const_logic_1,
        if_write_ce => ap_const_logic_1,
        if_din => start_for_process_lanes_U0_din,
        if_full_n => start_for_process_lanes_U0_full_n,
        if_write => adc2iq_U0_start_write,
        if_dout => start_for_process_lanes_U0_dout,
        if_empty_n => start_for_process_lanes_U0_empty_n,
        if_read => process_lanes_U0_ap_ready);




    adc2iq_U0_ap_continue <= ap_const_logic_1;
    adc2iq_U0_ap_start <= ap_const_logic_1;

    ap_rst_n_inv_assign_proc : process(ap_rst_n)
    begin
                ap_rst_n_inv <= not(ap_rst_n);
    end process;

    ap_sync_continue <= ap_const_logic_0;
    istream_V_TREADY <= adc2iq_U0_iin_V_TREADY;
    lane_TDATA <= process_lanes_U0_lane_TDATA;
    lane_TLAST <= process_lanes_U0_lane_TLAST;
    lane_TVALID <= process_lanes_U0_lane_TVALID;
    process_lanes_U0_ap_continue <= ap_const_logic_1;
    process_lanes_U0_ap_start <= start_for_process_lanes_U0_empty_n;
    process_lanes_U0_start_full_n <= ap_const_logic_1;
    process_lanes_U0_start_write <= ap_const_logic_0;
    qstream_V_TREADY <= adc2iq_U0_qin_V_TREADY;
    start_for_process_lanes_U0_din <= (0=>ap_const_logic_1, others=>'-');
end behav;
