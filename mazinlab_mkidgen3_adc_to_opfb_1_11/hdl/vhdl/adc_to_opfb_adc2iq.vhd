-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL
-- Version: 2020.1.1
-- Copyright (C) 1986-2020 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity adc_to_opfb_adc2iq is
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
    istream_V_TDATA : IN STD_LOGIC_VECTOR (127 downto 0);
    istream_V_TVALID : IN STD_LOGIC;
    istream_V_TREADY : OUT STD_LOGIC;
    qstream_V_TDATA : IN STD_LOGIC_VECTOR (127 downto 0);
    qstream_V_TVALID : IN STD_LOGIC;
    qstream_V_TREADY : OUT STD_LOGIC;
    iq_din : OUT STD_LOGIC_VECTOR (255 downto 0);
    iq_full_n : IN STD_LOGIC;
    iq_write : OUT STD_LOGIC );
end;


architecture behav of adc_to_opfb_adc2iq is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv32_10 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000010000";
    constant ap_const_lv32_1F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000011111";
    constant ap_const_lv32_20 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000100000";
    constant ap_const_lv32_2F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000101111";
    constant ap_const_lv32_30 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000110000";
    constant ap_const_lv32_3F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000111111";
    constant ap_const_lv32_40 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000001000000";
    constant ap_const_lv32_4F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000001001111";
    constant ap_const_lv32_50 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000001010000";
    constant ap_const_lv32_5F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000001011111";
    constant ap_const_lv32_60 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000001100000";
    constant ap_const_lv32_6F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000001101111";
    constant ap_const_lv32_70 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000001110000";
    constant ap_const_lv32_7F : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000001111111";
    constant ap_const_boolean_1 : BOOLEAN := true;

attribute shreg_extract : string;
    signal real_start : STD_LOGIC;
    signal start_once_reg : STD_LOGIC := '0';
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_CS_fsm : STD_LOGIC_VECTOR (0 downto 0) := "1";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal internal_ap_ready : STD_LOGIC;
    signal istream_V_TDATA_blk_n : STD_LOGIC;
    signal qstream_V_TDATA_blk_n : STD_LOGIC;
    signal ap_block_state1 : BOOLEAN;
    signal tmp_7_fu_213_p4 : STD_LOGIC_VECTOR (15 downto 0);
    signal p_Result_6_fu_203_p4 : STD_LOGIC_VECTOR (15 downto 0);
    signal tmp_6_fu_193_p4 : STD_LOGIC_VECTOR (15 downto 0);
    signal p_Result_5_fu_183_p4 : STD_LOGIC_VECTOR (15 downto 0);
    signal tmp_5_fu_173_p4 : STD_LOGIC_VECTOR (15 downto 0);
    signal p_Result_4_fu_163_p4 : STD_LOGIC_VECTOR (15 downto 0);
    signal tmp_4_fu_153_p4 : STD_LOGIC_VECTOR (15 downto 0);
    signal p_Result_3_fu_143_p4 : STD_LOGIC_VECTOR (15 downto 0);
    signal tmp_3_fu_133_p4 : STD_LOGIC_VECTOR (15 downto 0);
    signal p_Result_2_fu_123_p4 : STD_LOGIC_VECTOR (15 downto 0);
    signal tmp_2_fu_113_p4 : STD_LOGIC_VECTOR (15 downto 0);
    signal p_Result_1_fu_103_p4 : STD_LOGIC_VECTOR (15 downto 0);
    signal tmp_1_fu_93_p4 : STD_LOGIC_VECTOR (15 downto 0);
    signal p_Result_s_fu_83_p4 : STD_LOGIC_VECTOR (15 downto 0);
    signal trunc_ln1353_fu_79_p1 : STD_LOGIC_VECTOR (15 downto 0);
    signal trunc_ln674_fu_75_p1 : STD_LOGIC_VECTOR (15 downto 0);
    signal ap_NS_fsm : STD_LOGIC_VECTOR (0 downto 0);
    signal regslice_both_istream_V_U_apdone_blk : STD_LOGIC;
    signal istream_V_TDATA_int_regslice : STD_LOGIC_VECTOR (127 downto 0);
    signal istream_V_TVALID_int_regslice : STD_LOGIC;
    signal istream_V_TREADY_int_regslice : STD_LOGIC;
    signal regslice_both_istream_V_U_ack_in : STD_LOGIC;
    signal regslice_both_qstream_V_U_apdone_blk : STD_LOGIC;
    signal qstream_V_TDATA_int_regslice : STD_LOGIC_VECTOR (127 downto 0);
    signal qstream_V_TVALID_int_regslice : STD_LOGIC;
    signal qstream_V_TREADY_int_regslice : STD_LOGIC;
    signal regslice_both_qstream_V_U_ack_in : STD_LOGIC;

    component regslice_both IS
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
    regslice_both_istream_V_U : component regslice_both
    generic map (
        DataWidth => 128)
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        data_in => istream_V_TDATA,
        vld_in => istream_V_TVALID,
        ack_in => regslice_both_istream_V_U_ack_in,
        data_out => istream_V_TDATA_int_regslice,
        vld_out => istream_V_TVALID_int_regslice,
        ack_out => istream_V_TREADY_int_regslice,
        apdone_blk => regslice_both_istream_V_U_apdone_blk);

    regslice_both_qstream_V_U : component regslice_both
    generic map (
        DataWidth => 128)
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        data_in => qstream_V_TDATA,
        vld_in => qstream_V_TVALID,
        ack_in => regslice_both_qstream_V_U_ack_in,
        data_out => qstream_V_TDATA_int_regslice,
        vld_out => qstream_V_TVALID_int_regslice,
        ack_out => qstream_V_TREADY_int_regslice,
        apdone_blk => regslice_both_qstream_V_U_apdone_blk);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_state1;
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
                elsif ((not(((real_start = ap_const_logic_0) or (qstream_V_TVALID_int_regslice = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1) or (istream_V_TVALID_int_regslice = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                    ap_done_reg <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    start_once_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                start_once_reg <= ap_const_logic_0;
            else
                if (((real_start = ap_const_logic_1) and (internal_ap_ready = ap_const_logic_0))) then 
                    start_once_reg <= ap_const_logic_1;
                elsif ((internal_ap_ready = ap_const_logic_1)) then 
                    start_once_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    ap_NS_fsm_assign_proc : process (real_start, ap_done_reg, ap_CS_fsm, ap_CS_fsm_state1, istream_V_TVALID_int_regslice, qstream_V_TVALID_int_regslice)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                ap_NS_fsm <= ap_ST_fsm_state1;
            when others =>  
                ap_NS_fsm <= "X";
        end case;
    end process;
    ap_CS_fsm_state1 <= ap_CS_fsm(0);

    ap_block_state1_assign_proc : process(real_start, ap_done_reg, istream_V_TVALID_int_regslice, qstream_V_TVALID_int_regslice)
    begin
                ap_block_state1 <= ((real_start = ap_const_logic_0) or (qstream_V_TVALID_int_regslice = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1) or (istream_V_TVALID_int_regslice = ap_const_logic_0));
    end process;


    ap_done_assign_proc : process(real_start, ap_done_reg, ap_CS_fsm_state1, istream_V_TVALID_int_regslice, qstream_V_TVALID_int_regslice)
    begin
        if ((not(((real_start = ap_const_logic_0) or (qstream_V_TVALID_int_regslice = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1) or (istream_V_TVALID_int_regslice = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_done_reg;
        end if; 
    end process;


    ap_idle_assign_proc : process(real_start, ap_CS_fsm_state1)
    begin
        if (((real_start = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;

    ap_ready <= internal_ap_ready;

    internal_ap_ready_assign_proc : process(real_start, ap_done_reg, ap_CS_fsm_state1, istream_V_TVALID_int_regslice, qstream_V_TVALID_int_regslice)
    begin
        if ((not(((real_start = ap_const_logic_0) or (qstream_V_TVALID_int_regslice = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1) or (istream_V_TVALID_int_regslice = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            internal_ap_ready <= ap_const_logic_1;
        else 
            internal_ap_ready <= ap_const_logic_0;
        end if; 
    end process;

    iq_din <= (((((((((((((((tmp_7_fu_213_p4 & p_Result_6_fu_203_p4) & tmp_6_fu_193_p4) & p_Result_5_fu_183_p4) & tmp_5_fu_173_p4) & p_Result_4_fu_163_p4) & tmp_4_fu_153_p4) & p_Result_3_fu_143_p4) & tmp_3_fu_133_p4) & p_Result_2_fu_123_p4) & tmp_2_fu_113_p4) & p_Result_1_fu_103_p4) & tmp_1_fu_93_p4) & p_Result_s_fu_83_p4) & trunc_ln1353_fu_79_p1) & trunc_ln674_fu_75_p1);

    iq_write_assign_proc : process(real_start, ap_done_reg, ap_CS_fsm_state1, iq_full_n, istream_V_TVALID_int_regslice, qstream_V_TVALID_int_regslice)
    begin
        if ((not(((real_start = ap_const_logic_0) or (qstream_V_TVALID_int_regslice = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1) or (istream_V_TVALID_int_regslice = ap_const_logic_0))) and (iq_full_n = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            iq_write <= ap_const_logic_1;
        else 
            iq_write <= ap_const_logic_0;
        end if; 
    end process;


    istream_V_TDATA_blk_n_assign_proc : process(real_start, ap_done_reg, ap_CS_fsm_state1, istream_V_TVALID_int_regslice)
    begin
        if ((not(((real_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            istream_V_TDATA_blk_n <= istream_V_TVALID_int_regslice;
        else 
            istream_V_TDATA_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    istream_V_TREADY <= regslice_both_istream_V_U_ack_in;

    istream_V_TREADY_int_regslice_assign_proc : process(real_start, ap_done_reg, ap_CS_fsm_state1, istream_V_TVALID_int_regslice, qstream_V_TVALID_int_regslice)
    begin
        if ((not(((real_start = ap_const_logic_0) or (qstream_V_TVALID_int_regslice = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1) or (istream_V_TVALID_int_regslice = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            istream_V_TREADY_int_regslice <= ap_const_logic_1;
        else 
            istream_V_TREADY_int_regslice <= ap_const_logic_0;
        end if; 
    end process;

    p_Result_1_fu_103_p4 <= istream_V_TDATA_int_regslice(47 downto 32);
    p_Result_2_fu_123_p4 <= istream_V_TDATA_int_regslice(63 downto 48);
    p_Result_3_fu_143_p4 <= istream_V_TDATA_int_regslice(79 downto 64);
    p_Result_4_fu_163_p4 <= istream_V_TDATA_int_regslice(95 downto 80);
    p_Result_5_fu_183_p4 <= istream_V_TDATA_int_regslice(111 downto 96);
    p_Result_6_fu_203_p4 <= istream_V_TDATA_int_regslice(127 downto 112);
    p_Result_s_fu_83_p4 <= istream_V_TDATA_int_regslice(31 downto 16);

    qstream_V_TDATA_blk_n_assign_proc : process(real_start, ap_done_reg, ap_CS_fsm_state1, qstream_V_TVALID_int_regslice)
    begin
        if ((not(((real_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            qstream_V_TDATA_blk_n <= qstream_V_TVALID_int_regslice;
        else 
            qstream_V_TDATA_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    qstream_V_TREADY <= regslice_both_qstream_V_U_ack_in;

    qstream_V_TREADY_int_regslice_assign_proc : process(real_start, ap_done_reg, ap_CS_fsm_state1, istream_V_TVALID_int_regslice, qstream_V_TVALID_int_regslice)
    begin
        if ((not(((real_start = ap_const_logic_0) or (qstream_V_TVALID_int_regslice = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1) or (istream_V_TVALID_int_regslice = ap_const_logic_0))) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            qstream_V_TREADY_int_regslice <= ap_const_logic_1;
        else 
            qstream_V_TREADY_int_regslice <= ap_const_logic_0;
        end if; 
    end process;


    real_start_assign_proc : process(ap_start, start_full_n, start_once_reg)
    begin
        if (((start_full_n = ap_const_logic_0) and (start_once_reg = ap_const_logic_0))) then 
            real_start <= ap_const_logic_0;
        else 
            real_start <= ap_start;
        end if; 
    end process;

    start_out <= real_start;

    start_write_assign_proc : process(real_start, start_once_reg)
    begin
        if (((real_start = ap_const_logic_1) and (start_once_reg = ap_const_logic_0))) then 
            start_write <= ap_const_logic_1;
        else 
            start_write <= ap_const_logic_0;
        end if; 
    end process;

    tmp_1_fu_93_p4 <= qstream_V_TDATA_int_regslice(31 downto 16);
    tmp_2_fu_113_p4 <= qstream_V_TDATA_int_regslice(47 downto 32);
    tmp_3_fu_133_p4 <= qstream_V_TDATA_int_regslice(63 downto 48);
    tmp_4_fu_153_p4 <= qstream_V_TDATA_int_regslice(79 downto 64);
    tmp_5_fu_173_p4 <= qstream_V_TDATA_int_regslice(95 downto 80);
    tmp_6_fu_193_p4 <= qstream_V_TDATA_int_regslice(111 downto 96);
    tmp_7_fu_213_p4 <= qstream_V_TDATA_int_regslice(127 downto 112);
    trunc_ln1353_fu_79_p1 <= qstream_V_TDATA_int_regslice(16 - 1 downto 0);
    trunc_ln674_fu_75_p1 <= istream_V_TDATA_int_regslice(16 - 1 downto 0);
end behav;
