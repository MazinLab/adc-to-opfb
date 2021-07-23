-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.1 (64-bit)
-- Version: 2021.1
-- Copyright (C) Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity adc_to_opfb_process_lanes is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_continue : IN STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    iq1_dout : IN STD_LOGIC_VECTOR (255 downto 0);
    iq1_empty_n : IN STD_LOGIC;
    iq1_read : OUT STD_LOGIC;
    lanes_TREADY : IN STD_LOGIC;
    lanes_TDATA : OUT STD_LOGIC_VECTOR (511 downto 0);
    lanes_TVALID : OUT STD_LOGIC;
    lanes_TKEEP : OUT STD_LOGIC_VECTOR (63 downto 0);
    lanes_TSTRB : OUT STD_LOGIC_VECTOR (63 downto 0);
    lanes_TLAST : OUT STD_LOGIC_VECTOR (0 downto 0) );
end;


architecture behav of adc_to_opfb_process_lanes is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_pp0_stage0 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv512_lc_1 : STD_LOGIC_VECTOR (511 downto 0) := "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
    constant ap_const_lv64_0 : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
    constant ap_const_lv7_7F : STD_LOGIC_VECTOR (6 downto 0) := "1111111";
    constant ap_const_lv9_1FF : STD_LOGIC_VECTOR (8 downto 0) := "111111111";
    constant ap_const_lv9_1 : STD_LOGIC_VECTOR (8 downto 0) := "000000001";

attribute shreg_extract : string;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (0 downto 0) := "1";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_pp0_stage0 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage0 : signal is "none";
    signal ap_enable_reg_pp0_iter0 : STD_LOGIC;
    signal ap_enable_reg_pp0_iter1 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter2 : STD_LOGIC := '0';
    signal ap_idle_pp0 : STD_LOGIC;
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_block_state1_pp0_stage0_iter0 : BOOLEAN;
    signal primed_load_reg_205 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_block_state2_pp0_stage0_iter1 : BOOLEAN;
    signal ap_block_state2_io : BOOLEAN;
    signal primed_load_reg_205_pp0_iter1_reg : STD_LOGIC_VECTOR (0 downto 0);
    signal regslice_both_lanes_V_data_V_U_apdone_blk : STD_LOGIC;
    signal ap_block_state3_pp0_stage0_iter2 : BOOLEAN;
    signal ap_block_state3_io : BOOLEAN;
    signal ap_block_pp0_stage0_subdone : BOOLEAN;
    signal cycle_V : STD_LOGIC_VECTOR (8 downto 0) := "000000000";
    signal even_lane_z1_V : STD_LOGIC_VECTOR (255 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
    signal primed : STD_LOGIC_VECTOR (0 downto 0) := "0";
    signal even_delay_Array_ce0 : STD_LOGIC;
    signal even_delay_Array_we0 : STD_LOGIC;
    signal even_delay_Array_q0 : STD_LOGIC_VECTOR (255 downto 0);
    signal odd_delay_Array_ce0 : STD_LOGIC;
    signal odd_delay_Array_we0 : STD_LOGIC;
    signal odd_delay_Array_q0 : STD_LOGIC_VECTOR (255 downto 0);
    signal iq1_blk_n : STD_LOGIC;
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal lanes_TDATA_blk_n : STD_LOGIC;
    signal tmp_2_reg_180 : STD_LOGIC_VECTOR (255 downto 0);
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal p_Result_s_fu_89_p1 : STD_LOGIC_VECTOR (0 downto 0);
    signal p_Result_s_reg_188 : STD_LOGIC_VECTOR (0 downto 0);
    signal xor_ln32_fu_93_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal xor_ln32_reg_195 : STD_LOGIC_VECTOR (0 downto 0);
    signal lane_last_V_fu_99_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal lane_last_V_reg_200 : STD_LOGIC_VECTOR (0 downto 0);
    signal lane_data_V_fu_159_p3 : STD_LOGIC_VECTOR (511 downto 0);
    signal add_ln870_fu_121_p2 : STD_LOGIC_VECTOR (8 downto 0);
    signal select_ln52_fu_168_p3 : STD_LOGIC_VECTOR (255 downto 0);
    signal or_ln54_fu_109_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_block_pp0_stage0_01001 : BOOLEAN;
    signal select_ln42_fu_153_p3 : STD_LOGIC_VECTOR (255 downto 0);
    signal ap_NS_fsm : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_idle_pp0_0to1 : STD_LOGIC;
    signal ap_reset_idle_pp0 : STD_LOGIC;
    signal ap_enable_pp0 : STD_LOGIC;
    signal lanes_TDATA_int_regslice : STD_LOGIC_VECTOR (511 downto 0);
    signal lanes_TVALID_int_regslice : STD_LOGIC;
    signal lanes_TREADY_int_regslice : STD_LOGIC;
    signal regslice_both_lanes_V_data_V_U_vld_out : STD_LOGIC;
    signal regslice_both_lanes_V_keep_V_U_apdone_blk : STD_LOGIC;
    signal regslice_both_lanes_V_keep_V_U_ack_in_dummy : STD_LOGIC;
    signal regslice_both_lanes_V_keep_V_U_vld_out : STD_LOGIC;
    signal regslice_both_lanes_V_strb_V_U_apdone_blk : STD_LOGIC;
    signal regslice_both_lanes_V_strb_V_U_ack_in_dummy : STD_LOGIC;
    signal regslice_both_lanes_V_strb_V_U_vld_out : STD_LOGIC;
    signal regslice_both_lanes_V_last_V_U_apdone_blk : STD_LOGIC;
    signal regslice_both_lanes_V_last_V_U_ack_in_dummy : STD_LOGIC;
    signal regslice_both_lanes_V_last_V_U_vld_out : STD_LOGIC;
    signal ap_condition_167 : BOOLEAN;
    signal ap_ce_reg : STD_LOGIC;

    component adc_to_opfb_process_lanes_even_delay_Array IS
    generic (
        DataWidth : INTEGER;
        AddressRange : INTEGER;
        AddressWidth : INTEGER );
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR (6 downto 0);
        ce0 : IN STD_LOGIC;
        we0 : IN STD_LOGIC;
        d0 : IN STD_LOGIC_VECTOR (255 downto 0);
        q0 : OUT STD_LOGIC_VECTOR (255 downto 0) );
    end component;


    component adc_to_opfb_regslice_both IS
    generic (
        DataWidth : INTEGER );
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        data_in : IN STD_LOGIC_VECTOR (DataWidth-1 downto 0);
        vld_in : IN STD_LOGIC;
        ack_in : OUT STD_LOGIC;
        data_out : OUT STD_LOGIC_VECTOR (DataWidth-1 downto 0);
        vld_out : OUT STD_LOGIC;
        ack_out : IN STD_LOGIC;
        apdone_blk : OUT STD_LOGIC );
    end component;



begin
    even_delay_Array_U : component adc_to_opfb_process_lanes_even_delay_Array
    generic map (
        DataWidth => 256,
        AddressRange => 128,
        AddressWidth => 7)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        address0 => ap_const_lv7_7F,
        ce0 => even_delay_Array_ce0,
        we0 => even_delay_Array_we0,
        d0 => tmp_2_reg_180,
        q0 => even_delay_Array_q0);

    odd_delay_Array_U : component adc_to_opfb_process_lanes_even_delay_Array
    generic map (
        DataWidth => 256,
        AddressRange => 128,
        AddressWidth => 7)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        address0 => ap_const_lv7_7F,
        ce0 => odd_delay_Array_ce0,
        we0 => odd_delay_Array_we0,
        d0 => tmp_2_reg_180,
        q0 => odd_delay_Array_q0);

    regslice_both_lanes_V_data_V_U : component adc_to_opfb_regslice_both
    generic map (
        DataWidth => 512)
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        data_in => lanes_TDATA_int_regslice,
        vld_in => lanes_TVALID_int_regslice,
        ack_in => lanes_TREADY_int_regslice,
        data_out => lanes_TDATA,
        vld_out => regslice_both_lanes_V_data_V_U_vld_out,
        ack_out => lanes_TREADY,
        apdone_blk => regslice_both_lanes_V_data_V_U_apdone_blk);

    regslice_both_lanes_V_keep_V_U : component adc_to_opfb_regslice_both
    generic map (
        DataWidth => 64)
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        data_in => ap_const_lv64_0,
        vld_in => lanes_TVALID_int_regslice,
        ack_in => regslice_both_lanes_V_keep_V_U_ack_in_dummy,
        data_out => lanes_TKEEP,
        vld_out => regslice_both_lanes_V_keep_V_U_vld_out,
        ack_out => lanes_TREADY,
        apdone_blk => regslice_both_lanes_V_keep_V_U_apdone_blk);

    regslice_both_lanes_V_strb_V_U : component adc_to_opfb_regslice_both
    generic map (
        DataWidth => 64)
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        data_in => ap_const_lv64_0,
        vld_in => lanes_TVALID_int_regslice,
        ack_in => regslice_both_lanes_V_strb_V_U_ack_in_dummy,
        data_out => lanes_TSTRB,
        vld_out => regslice_both_lanes_V_strb_V_U_vld_out,
        ack_out => lanes_TREADY,
        apdone_blk => regslice_both_lanes_V_strb_V_U_apdone_blk);

    regslice_both_lanes_V_last_V_U : component adc_to_opfb_regslice_both
    generic map (
        DataWidth => 1)
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        data_in => lane_last_V_reg_200,
        vld_in => lanes_TVALID_int_regslice,
        ack_in => regslice_both_lanes_V_last_V_U_ack_in_dummy,
        data_out => lanes_TLAST,
        vld_out => regslice_both_lanes_V_last_V_U_vld_out,
        ack_out => lanes_TREADY,
        apdone_blk => regslice_both_lanes_V_last_V_U_apdone_blk);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_pp0_stage0;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    ap_done_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_done_reg <= ap_const_logic_0;
            else
                if ((ap_continue = ap_const_logic_1)) then 
                    ap_done_reg <= ap_const_logic_0;
                elsif (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1))) then 
                    ap_done_reg <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter1_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
            else
                if (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                    ap_enable_reg_pp0_iter1 <= ap_start;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter2_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter2 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
                end if; 
            end if;
        end if;
    end process;

    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                cycle_V <= add_ln870_fu_121_p2;
                primed <= or_ln54_fu_109_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                even_lane_z1_V <= select_ln52_fu_168_p3;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                lane_last_V_reg_200 <= lane_last_V_fu_99_p2;
                p_Result_s_reg_188 <= p_Result_s_fu_89_p1;
                primed_load_reg_205 <= primed;
                primed_load_reg_205_pp0_iter1_reg <= primed_load_reg_205;
                tmp_2_reg_180 <= iq1_dout;
                xor_ln32_reg_195 <= xor_ln32_fu_93_p2;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_CS_fsm, ap_block_pp0_stage0_subdone, ap_reset_idle_pp0)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_pp0_stage0 => 
                ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
            when others =>  
                ap_NS_fsm <= "X";
        end case;
    end process;
    add_ln870_fu_121_p2 <= std_logic_vector(unsigned(cycle_V) + unsigned(ap_const_lv9_1));
    ap_CS_fsm_pp0_stage0 <= ap_CS_fsm(0);
        ap_block_pp0_stage0 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_pp0_stage0_01001_assign_proc : process(ap_start, ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter2, iq1_empty_n, ap_done_reg, primed_load_reg_205, primed_load_reg_205_pp0_iter1_reg, regslice_both_lanes_V_data_V_U_apdone_blk, lanes_TREADY_int_regslice)
    begin
                ap_block_pp0_stage0_01001 <= ((ap_done_reg = ap_const_logic_1) or ((ap_enable_reg_pp0_iter2 = ap_const_logic_1) and ((regslice_both_lanes_V_data_V_U_apdone_blk = ap_const_logic_1) or ((primed_load_reg_205_pp0_iter1_reg = ap_const_lv1_1) and (lanes_TREADY_int_regslice = ap_const_logic_0)) or ((primed_load_reg_205_pp0_iter1_reg = ap_const_lv1_0) and (lanes_TREADY_int_regslice = ap_const_logic_0)))) or ((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (((primed_load_reg_205 = ap_const_lv1_1) and (lanes_TREADY_int_regslice = ap_const_logic_0)) or ((primed_load_reg_205 = ap_const_lv1_0) and (lanes_TREADY_int_regslice = ap_const_logic_0)))) or ((ap_start = ap_const_logic_1) and ((ap_done_reg = ap_const_logic_1) or (iq1_empty_n = ap_const_logic_0))));
    end process;


    ap_block_pp0_stage0_11001_assign_proc : process(ap_start, ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter2, iq1_empty_n, ap_done_reg, primed_load_reg_205, ap_block_state2_io, primed_load_reg_205_pp0_iter1_reg, regslice_both_lanes_V_data_V_U_apdone_blk, ap_block_state3_io, lanes_TREADY_int_regslice)
    begin
                ap_block_pp0_stage0_11001 <= ((ap_done_reg = ap_const_logic_1) or ((ap_enable_reg_pp0_iter2 = ap_const_logic_1) and ((regslice_both_lanes_V_data_V_U_apdone_blk = ap_const_logic_1) or (ap_const_boolean_1 = ap_block_state3_io) or ((primed_load_reg_205_pp0_iter1_reg = ap_const_lv1_1) and (lanes_TREADY_int_regslice = ap_const_logic_0)) or ((primed_load_reg_205_pp0_iter1_reg = ap_const_lv1_0) and (lanes_TREADY_int_regslice = ap_const_logic_0)))) or ((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and ((ap_const_boolean_1 = ap_block_state2_io) or ((primed_load_reg_205 = ap_const_lv1_1) and (lanes_TREADY_int_regslice = ap_const_logic_0)) or ((primed_load_reg_205 = ap_const_lv1_0) and (lanes_TREADY_int_regslice = ap_const_logic_0)))) or ((ap_start = ap_const_logic_1) and ((ap_done_reg = ap_const_logic_1) or (iq1_empty_n = ap_const_logic_0))));
    end process;


    ap_block_pp0_stage0_subdone_assign_proc : process(ap_start, ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter2, iq1_empty_n, ap_done_reg, primed_load_reg_205, ap_block_state2_io, primed_load_reg_205_pp0_iter1_reg, regslice_both_lanes_V_data_V_U_apdone_blk, ap_block_state3_io, lanes_TREADY_int_regslice)
    begin
                ap_block_pp0_stage0_subdone <= ((ap_done_reg = ap_const_logic_1) or ((ap_enable_reg_pp0_iter2 = ap_const_logic_1) and ((regslice_both_lanes_V_data_V_U_apdone_blk = ap_const_logic_1) or (ap_const_boolean_1 = ap_block_state3_io) or ((primed_load_reg_205_pp0_iter1_reg = ap_const_lv1_1) and (lanes_TREADY_int_regslice = ap_const_logic_0)) or ((primed_load_reg_205_pp0_iter1_reg = ap_const_lv1_0) and (lanes_TREADY_int_regslice = ap_const_logic_0)))) or ((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and ((ap_const_boolean_1 = ap_block_state2_io) or ((primed_load_reg_205 = ap_const_lv1_1) and (lanes_TREADY_int_regslice = ap_const_logic_0)) or ((primed_load_reg_205 = ap_const_lv1_0) and (lanes_TREADY_int_regslice = ap_const_logic_0)))) or ((ap_start = ap_const_logic_1) and ((ap_done_reg = ap_const_logic_1) or (iq1_empty_n = ap_const_logic_0))));
    end process;


    ap_block_state1_pp0_stage0_iter0_assign_proc : process(iq1_empty_n, ap_done_reg)
    begin
                ap_block_state1_pp0_stage0_iter0 <= ((ap_done_reg = ap_const_logic_1) or (iq1_empty_n = ap_const_logic_0));
    end process;


    ap_block_state2_io_assign_proc : process(primed_load_reg_205, lanes_TREADY_int_regslice)
    begin
                ap_block_state2_io <= (((primed_load_reg_205 = ap_const_lv1_1) and (lanes_TREADY_int_regslice = ap_const_logic_0)) or ((primed_load_reg_205 = ap_const_lv1_0) and (lanes_TREADY_int_regslice = ap_const_logic_0)));
    end process;


    ap_block_state2_pp0_stage0_iter1_assign_proc : process(primed_load_reg_205, lanes_TREADY_int_regslice)
    begin
                ap_block_state2_pp0_stage0_iter1 <= (((primed_load_reg_205 = ap_const_lv1_1) and (lanes_TREADY_int_regslice = ap_const_logic_0)) or ((primed_load_reg_205 = ap_const_lv1_0) and (lanes_TREADY_int_regslice = ap_const_logic_0)));
    end process;


    ap_block_state3_io_assign_proc : process(primed_load_reg_205_pp0_iter1_reg, lanes_TREADY_int_regslice)
    begin
                ap_block_state3_io <= (((primed_load_reg_205_pp0_iter1_reg = ap_const_lv1_1) and (lanes_TREADY_int_regslice = ap_const_logic_0)) or ((primed_load_reg_205_pp0_iter1_reg = ap_const_lv1_0) and (lanes_TREADY_int_regslice = ap_const_logic_0)));
    end process;


    ap_block_state3_pp0_stage0_iter2_assign_proc : process(primed_load_reg_205_pp0_iter1_reg, regslice_both_lanes_V_data_V_U_apdone_blk, lanes_TREADY_int_regslice)
    begin
                ap_block_state3_pp0_stage0_iter2 <= ((regslice_both_lanes_V_data_V_U_apdone_blk = ap_const_logic_1) or ((primed_load_reg_205_pp0_iter1_reg = ap_const_lv1_1) and (lanes_TREADY_int_regslice = ap_const_logic_0)) or ((primed_load_reg_205_pp0_iter1_reg = ap_const_lv1_0) and (lanes_TREADY_int_regslice = ap_const_logic_0)));
    end process;


    ap_condition_167_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0_01001)
    begin
                ap_condition_167 <= ((ap_const_boolean_0 = ap_block_pp0_stage0_01001) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0));
    end process;


    ap_done_assign_proc : process(ap_enable_reg_pp0_iter2, ap_done_reg, ap_block_pp0_stage0_subdone)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_done_reg;
        end if; 
    end process;

    ap_enable_pp0 <= (ap_idle_pp0 xor ap_const_logic_1);
    ap_enable_reg_pp0_iter0 <= ap_start;

    ap_idle_assign_proc : process(ap_start, ap_CS_fsm_pp0_stage0, ap_idle_pp0)
    begin
        if (((ap_start = ap_const_logic_0) and (ap_idle_pp0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_pp0_assign_proc : process(ap_enable_reg_pp0_iter0, ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter2)
    begin
        if (((ap_enable_reg_pp0_iter2 = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_0))) then 
            ap_idle_pp0 <= ap_const_logic_1;
        else 
            ap_idle_pp0 <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_pp0_0to1_assign_proc : process(ap_enable_reg_pp0_iter0, ap_enable_reg_pp0_iter1)
    begin
        if (((ap_enable_reg_pp0_iter1 = ap_const_logic_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_0))) then 
            ap_idle_pp0_0to1 <= ap_const_logic_1;
        else 
            ap_idle_pp0_0to1 <= ap_const_logic_0;
        end if; 
    end process;


    ap_ready_assign_proc : process(ap_start, ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0_subdone)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;


    ap_reset_idle_pp0_assign_proc : process(ap_start, ap_idle_pp0_0to1)
    begin
        if (((ap_start = ap_const_logic_0) and (ap_idle_pp0_0to1 = ap_const_logic_1))) then 
            ap_reset_idle_pp0 <= ap_const_logic_1;
        else 
            ap_reset_idle_pp0 <= ap_const_logic_0;
        end if; 
    end process;


    even_delay_Array_ce0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0_11001, xor_ln32_reg_195)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            even_delay_Array_ce0 <= xor_ln32_reg_195(0);
        else 
            even_delay_Array_ce0 <= ap_const_logic_0;
        end if; 
    end process;


    even_delay_Array_we0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0_11001, xor_ln32_reg_195)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            even_delay_Array_we0 <= xor_ln32_reg_195(0);
        else 
            even_delay_Array_we0 <= ap_const_logic_0;
        end if; 
    end process;


    iq1_blk_n_assign_proc : process(ap_start, ap_CS_fsm_pp0_stage0, iq1_empty_n, ap_done_reg, ap_block_pp0_stage0)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_done_reg = ap_const_logic_0) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            iq1_blk_n <= iq1_empty_n;
        else 
            iq1_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    iq1_read_assign_proc : process(ap_start, ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            iq1_read <= ap_const_logic_1;
        else 
            iq1_read <= ap_const_logic_0;
        end if; 
    end process;

    lane_data_V_fu_159_p3 <= (select_ln42_fu_153_p3 & even_lane_z1_V);
    lane_last_V_fu_99_p2 <= "1" when (cycle_V = ap_const_lv9_1FF) else "0";

    lanes_TDATA_blk_n_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter2, primed_load_reg_205, primed_load_reg_205_pp0_iter1_reg, ap_block_pp0_stage0, lanes_TREADY_int_regslice)
    begin
        if ((((ap_const_boolean_0 = ap_block_pp0_stage0) and (primed_load_reg_205_pp0_iter1_reg = ap_const_lv1_1) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1)) or ((ap_const_boolean_0 = ap_block_pp0_stage0) and (primed_load_reg_205_pp0_iter1_reg = ap_const_lv1_0) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1)) or ((ap_const_boolean_0 = ap_block_pp0_stage0) and (primed_load_reg_205 = ap_const_lv1_1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0)) or ((ap_const_boolean_0 = ap_block_pp0_stage0) and (primed_load_reg_205 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0)))) then 
            lanes_TDATA_blk_n <= lanes_TREADY_int_regslice;
        else 
            lanes_TDATA_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    lanes_TDATA_int_regslice_assign_proc : process(primed_load_reg_205, lane_data_V_fu_159_p3, ap_condition_167)
    begin
        if ((ap_const_boolean_1 = ap_condition_167)) then
            if ((primed_load_reg_205 = ap_const_lv1_1)) then 
                lanes_TDATA_int_regslice <= lane_data_V_fu_159_p3;
            elsif ((primed_load_reg_205 = ap_const_lv1_0)) then 
                lanes_TDATA_int_regslice <= ap_const_lv512_lc_1;
            else 
                lanes_TDATA_int_regslice <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
            end if;
        else 
            lanes_TDATA_int_regslice <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
        end if; 
    end process;

    lanes_TVALID <= regslice_both_lanes_V_data_V_U_vld_out;

    lanes_TVALID_int_regslice_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, primed_load_reg_205, ap_block_pp0_stage0_11001)
    begin
        if ((((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (primed_load_reg_205 = ap_const_lv1_1) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0)) or ((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (primed_load_reg_205 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0)))) then 
            lanes_TVALID_int_regslice <= ap_const_logic_1;
        else 
            lanes_TVALID_int_regslice <= ap_const_logic_0;
        end if; 
    end process;


    odd_delay_Array_ce0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0_11001, p_Result_s_reg_188)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            odd_delay_Array_ce0 <= p_Result_s_reg_188(0);
        else 
            odd_delay_Array_ce0 <= ap_const_logic_0;
        end if; 
    end process;


    odd_delay_Array_we0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0_11001, p_Result_s_reg_188)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            odd_delay_Array_we0 <= p_Result_s_reg_188(0);
        else 
            odd_delay_Array_we0 <= ap_const_logic_0;
        end if; 
    end process;

    or_ln54_fu_109_p2 <= (primed or lane_last_V_fu_99_p2);
    p_Result_s_fu_89_p1 <= cycle_V(1 - 1 downto 0);
    select_ln42_fu_153_p3 <= 
        tmp_2_reg_180 when (p_Result_s_reg_188(0) = '1') else 
        odd_delay_Array_q0;
    select_ln52_fu_168_p3 <= 
        even_delay_Array_q0 when (p_Result_s_reg_188(0) = '1') else 
        tmp_2_reg_180;
    xor_ln32_fu_93_p2 <= (p_Result_s_fu_89_p1 xor ap_const_lv1_1);
end behav;
