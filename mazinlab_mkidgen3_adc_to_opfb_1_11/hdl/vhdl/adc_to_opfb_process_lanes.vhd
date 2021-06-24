-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL
-- Version: 2020.1.1
-- Copyright (C) 1986-2020 Xilinx, Inc. All Rights Reserved.
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
    iqstream_dout : IN STD_LOGIC_VECTOR (255 downto 0);
    iqstream_empty_n : IN STD_LOGIC;
    iqstream_read : OUT STD_LOGIC;
    lanes_TREADY : IN STD_LOGIC;
    lanes_TDATA : OUT STD_LOGIC_VECTOR (511 downto 0);
    lanes_TVALID : OUT STD_LOGIC;
    lanes_TLAST : OUT STD_LOGIC_VECTOR (0 downto 0) );
end;


architecture behav of adc_to_opfb_process_lanes is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_pp0_stage0 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv7_7F : STD_LOGIC_VECTOR (6 downto 0) := "1111111";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv9_1FF : STD_LOGIC_VECTOR (8 downto 0) := "111111111";
    constant ap_const_lv9_1 : STD_LOGIC_VECTOR (8 downto 0) := "000000001";
    constant ap_const_lv512_lc_1 : STD_LOGIC_VECTOR (511 downto 0) := "00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";

attribute shreg_extract : string;
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_CS_fsm : STD_LOGIC_VECTOR (0 downto 0) := "1";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_pp0_stage0 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage0 : signal is "none";
    signal ap_enable_reg_pp0_iter0 : STD_LOGIC;
    signal ap_enable_reg_pp0_iter1 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter2 : STD_LOGIC := '0';
    signal ap_enable_reg_pp0_iter3 : STD_LOGIC := '0';
    signal ap_idle_pp0 : STD_LOGIC;
    signal ap_block_state1_pp0_stage0_iter0 : BOOLEAN;
    signal ap_block_state2_pp0_stage0_iter1 : BOOLEAN;
    signal ap_block_state3_pp0_stage0_iter2 : BOOLEAN;
    signal regslice_both_lanes_V_data_V_U_apdone_blk : STD_LOGIC;
    signal ap_block_state4_pp0_stage0_iter3 : BOOLEAN;
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal cycle : STD_LOGIC_VECTOR (8 downto 0) := "000000000";
    signal primed : STD_LOGIC_VECTOR (0 downto 0) := "0";
    signal even_lane_z1 : STD_LOGIC_VECTOR (255 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
    signal even_delay_Array_V_ce0 : STD_LOGIC;
    signal even_delay_Array_V_we0 : STD_LOGIC;
    signal even_delay_Array_V_q0 : STD_LOGIC_VECTOR (255 downto 0);
    signal odd_delay_Array_V_ce0 : STD_LOGIC;
    signal odd_delay_Array_V_we0 : STD_LOGIC;
    signal odd_delay_Array_V_q0 : STD_LOGIC_VECTOR (255 downto 0);
    signal iqstream_blk_n : STD_LOGIC;
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal lanes_TDATA_blk_n : STD_LOGIC;
    signal tmp_V_reg_186 : STD_LOGIC_VECTOR (255 downto 0);
    signal tmp_V_reg_186_pp0_iter1_reg : STD_LOGIC_VECTOR (255 downto 0);
    signal p_Result_s_fu_72_p1 : STD_LOGIC_VECTOR (0 downto 0);
    signal p_Result_s_reg_194 : STD_LOGIC_VECTOR (0 downto 0);
    signal xor_ln29_fu_76_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal xor_ln29_reg_200 : STD_LOGIC_VECTOR (0 downto 0);
    signal odd_delay_iq_V_reg_205 : STD_LOGIC_VECTOR (255 downto 0);
    signal tmp_last_V_fu_91_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal tmp_last_V_reg_210 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_block_pp0_stage0_subdone : BOOLEAN;
    signal add_ln695_fu_97_p2 : STD_LOGIC_VECTOR (8 downto 0);
    signal or_ln47_fu_175_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal select_ln324_fu_163_p3 : STD_LOGIC_VECTOR (255 downto 0);
    signal ap_block_pp0_stage0_01001 : BOOLEAN;
    signal p_Result_3_fu_125_p3 : STD_LOGIC_VECTOR (511 downto 0);
    signal p_Result_4_fu_132_p3 : STD_LOGIC_VECTOR (511 downto 0);
    signal select_ln33_1_fu_147_p3 : STD_LOGIC_VECTOR (511 downto 0);
    signal select_ln33_fu_139_p3 : STD_LOGIC_VECTOR (511 downto 0);
    signal ap_NS_fsm : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_idle_pp0_0to2 : STD_LOGIC;
    signal ap_reset_idle_pp0 : STD_LOGIC;
    signal ap_enable_pp0 : STD_LOGIC;
    signal lanes_TDATA_int_regslice : STD_LOGIC_VECTOR (511 downto 0);
    signal lanes_TVALID_int_regslice : STD_LOGIC;
    signal lanes_TREADY_int_regslice : STD_LOGIC;
    signal regslice_both_lanes_V_data_V_U_vld_out : STD_LOGIC;
    signal regslice_both_lanes_V_last_V_U_apdone_blk : STD_LOGIC;
    signal regslice_both_lanes_V_last_V_U_ack_in_dummy : STD_LOGIC;
    signal regslice_both_lanes_V_last_V_U_vld_out : STD_LOGIC;

    component adc_to_opfb_process_lanes_even_delay_Array_V IS
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
    even_delay_Array_V_U : component adc_to_opfb_process_lanes_even_delay_Array_V
    generic map (
        DataWidth => 256,
        AddressRange => 128,
        AddressWidth => 7)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        address0 => ap_const_lv7_7F,
        ce0 => even_delay_Array_V_ce0,
        we0 => even_delay_Array_V_we0,
        d0 => tmp_V_reg_186_pp0_iter1_reg,
        q0 => even_delay_Array_V_q0);

    odd_delay_Array_V_U : component adc_to_opfb_process_lanes_even_delay_Array_V
    generic map (
        DataWidth => 256,
        AddressRange => 128,
        AddressWidth => 7)
    port map (
        clk => ap_clk,
        reset => ap_rst,
        address0 => ap_const_lv7_7F,
        ce0 => odd_delay_Array_V_ce0,
        we0 => odd_delay_Array_V_we0,
        d0 => tmp_V_reg_186,
        q0 => odd_delay_Array_V_q0);

    regslice_both_lanes_V_data_V_U : component regslice_both
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

    regslice_both_lanes_V_last_V_U : component regslice_both
    generic map (
        DataWidth => 1)
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        data_in => tmp_last_V_reg_210,
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
                elsif (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter3 = ap_const_logic_1))) then 
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


    ap_enable_reg_pp0_iter3_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter3 <= ap_const_logic_0;
            else
                if ((ap_const_boolean_0 = ap_block_pp0_stage0_subdone)) then 
                    ap_enable_reg_pp0_iter3 <= ap_enable_reg_pp0_iter2;
                end if; 
            end if;
        end if;
    end process;

    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                cycle <= add_ln695_fu_97_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1))) then
                even_lane_z1 <= select_ln324_fu_163_p3;
                primed <= or_ln47_fu_175_p2;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                odd_delay_iq_V_reg_205 <= odd_delay_Array_V_q0;
                p_Result_s_reg_194 <= p_Result_s_fu_72_p1;
                tmp_V_reg_186 <= iqstream_dout;
                tmp_V_reg_186_pp0_iter1_reg <= tmp_V_reg_186;
                tmp_last_V_reg_210 <= tmp_last_V_fu_91_p2;
                xor_ln29_reg_200 <= xor_ln29_fu_76_p2;
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
    add_ln695_fu_97_p2 <= std_logic_vector(unsigned(ap_const_lv9_1) + unsigned(cycle));
    ap_CS_fsm_pp0_stage0 <= ap_CS_fsm(0);
        ap_block_pp0_stage0 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_pp0_stage0_01001_assign_proc : process(ap_start, ap_done_reg, ap_enable_reg_pp0_iter3, iqstream_empty_n, regslice_both_lanes_V_data_V_U_apdone_blk)
    begin
                ap_block_pp0_stage0_01001 <= ((ap_done_reg = ap_const_logic_1) or ((regslice_both_lanes_V_data_V_U_apdone_blk = ap_const_logic_1) and (ap_enable_reg_pp0_iter3 = ap_const_logic_1)) or ((ap_start = ap_const_logic_1) and ((ap_start = ap_const_logic_0) or (iqstream_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))));
    end process;


    ap_block_pp0_stage0_11001_assign_proc : process(ap_start, ap_done_reg, ap_enable_reg_pp0_iter2, ap_enable_reg_pp0_iter3, iqstream_empty_n, regslice_both_lanes_V_data_V_U_apdone_blk, lanes_TREADY_int_regslice)
    begin
                ap_block_pp0_stage0_11001 <= ((ap_done_reg = ap_const_logic_1) or ((ap_enable_reg_pp0_iter3 = ap_const_logic_1) and ((regslice_both_lanes_V_data_V_U_apdone_blk = ap_const_logic_1) or (lanes_TREADY_int_regslice = ap_const_logic_0))) or ((ap_enable_reg_pp0_iter2 = ap_const_logic_1) and (lanes_TREADY_int_regslice = ap_const_logic_0)) or ((ap_start = ap_const_logic_1) and ((ap_start = ap_const_logic_0) or (iqstream_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))));
    end process;


    ap_block_pp0_stage0_subdone_assign_proc : process(ap_start, ap_done_reg, ap_enable_reg_pp0_iter2, ap_enable_reg_pp0_iter3, iqstream_empty_n, regslice_both_lanes_V_data_V_U_apdone_blk, lanes_TREADY_int_regslice)
    begin
                ap_block_pp0_stage0_subdone <= ((ap_done_reg = ap_const_logic_1) or ((ap_enable_reg_pp0_iter3 = ap_const_logic_1) and ((regslice_both_lanes_V_data_V_U_apdone_blk = ap_const_logic_1) or (lanes_TREADY_int_regslice = ap_const_logic_0))) or ((ap_enable_reg_pp0_iter2 = ap_const_logic_1) and (lanes_TREADY_int_regslice = ap_const_logic_0)) or ((ap_start = ap_const_logic_1) and ((ap_start = ap_const_logic_0) or (iqstream_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))));
    end process;


    ap_block_state1_pp0_stage0_iter0_assign_proc : process(ap_start, ap_done_reg, iqstream_empty_n)
    begin
                ap_block_state1_pp0_stage0_iter0 <= ((ap_start = ap_const_logic_0) or (iqstream_empty_n = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1));
    end process;

        ap_block_state2_pp0_stage0_iter1 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state3_pp0_stage0_iter2 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_block_state4_pp0_stage0_iter3_assign_proc : process(regslice_both_lanes_V_data_V_U_apdone_blk)
    begin
                ap_block_state4_pp0_stage0_iter3 <= (regslice_both_lanes_V_data_V_U_apdone_blk = ap_const_logic_1);
    end process;


    ap_done_assign_proc : process(ap_done_reg, ap_enable_reg_pp0_iter3, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter3 = ap_const_logic_1))) then 
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


    ap_idle_pp0_assign_proc : process(ap_enable_reg_pp0_iter0, ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter2, ap_enable_reg_pp0_iter3)
    begin
        if (((ap_enable_reg_pp0_iter3 = ap_const_logic_0) and (ap_enable_reg_pp0_iter2 = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_0))) then 
            ap_idle_pp0 <= ap_const_logic_1;
        else 
            ap_idle_pp0 <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_pp0_0to2_assign_proc : process(ap_enable_reg_pp0_iter0, ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter2)
    begin
        if (((ap_enable_reg_pp0_iter2 = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_0))) then 
            ap_idle_pp0_0to2 <= ap_const_logic_1;
        else 
            ap_idle_pp0_0to2 <= ap_const_logic_0;
        end if; 
    end process;


    ap_ready_assign_proc : process(ap_start, ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;


    ap_reset_idle_pp0_assign_proc : process(ap_start, ap_idle_pp0_0to2)
    begin
        if (((ap_start = ap_const_logic_0) and (ap_idle_pp0_0to2 = ap_const_logic_1))) then 
            ap_reset_idle_pp0 <= ap_const_logic_1;
        else 
            ap_reset_idle_pp0 <= ap_const_logic_0;
        end if; 
    end process;


    even_delay_Array_V_ce0_assign_proc : process(ap_enable_reg_pp0_iter2, ap_block_pp0_stage0_11001, xor_ln29_reg_200)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1))) then 
            even_delay_Array_V_ce0 <= xor_ln29_reg_200(0);
        else 
            even_delay_Array_V_ce0 <= ap_const_logic_0;
        end if; 
    end process;


    even_delay_Array_V_we0_assign_proc : process(ap_enable_reg_pp0_iter2, ap_block_pp0_stage0_11001, xor_ln29_reg_200)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1))) then 
            even_delay_Array_V_we0 <= xor_ln29_reg_200(0);
        else 
            even_delay_Array_V_we0 <= ap_const_logic_0;
        end if; 
    end process;


    iqstream_blk_n_assign_proc : process(ap_start, ap_done_reg, ap_CS_fsm_pp0_stage0, iqstream_empty_n, ap_block_pp0_stage0)
    begin
        if ((not(((ap_start = ap_const_logic_0) or (ap_done_reg = ap_const_logic_1))) and (ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            iqstream_blk_n <= iqstream_empty_n;
        else 
            iqstream_blk_n <= ap_const_logic_1;
        end if; 
    end process;


    iqstream_read_assign_proc : process(ap_start, ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_start = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            iqstream_read <= ap_const_logic_1;
        else 
            iqstream_read <= ap_const_logic_0;
        end if; 
    end process;


    lanes_TDATA_blk_n_assign_proc : process(ap_enable_reg_pp0_iter2, ap_enable_reg_pp0_iter3, ap_block_pp0_stage0, lanes_TREADY_int_regslice)
    begin
        if ((((ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_enable_reg_pp0_iter3 = ap_const_logic_1)) or ((ap_const_boolean_0 = ap_block_pp0_stage0) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1)))) then 
            lanes_TDATA_blk_n <= lanes_TREADY_int_regslice;
        else 
            lanes_TDATA_blk_n <= ap_const_logic_1;
        end if; 
    end process;

    lanes_TDATA_int_regslice <= 
        select_ln33_1_fu_147_p3 when (p_Result_s_reg_194(0) = '1') else 
        select_ln33_fu_139_p3;
    lanes_TVALID <= regslice_both_lanes_V_data_V_U_vld_out;

    lanes_TVALID_int_regslice_assign_proc : process(ap_enable_reg_pp0_iter2, ap_block_pp0_stage0_11001)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter2 = ap_const_logic_1))) then 
            lanes_TVALID_int_regslice <= ap_const_logic_1;
        else 
            lanes_TVALID_int_regslice <= ap_const_logic_0;
        end if; 
    end process;


    odd_delay_Array_V_ce0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0_11001, p_Result_s_fu_72_p1)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            odd_delay_Array_V_ce0 <= p_Result_s_fu_72_p1(0);
        else 
            odd_delay_Array_V_ce0 <= ap_const_logic_0;
        end if; 
    end process;


    odd_delay_Array_V_we0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0_11001, p_Result_s_fu_72_p1)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            odd_delay_Array_V_we0 <= p_Result_s_fu_72_p1(0);
        else 
            odd_delay_Array_V_we0 <= ap_const_logic_0;
        end if; 
    end process;

    or_ln47_fu_175_p2 <= (tmp_last_V_reg_210 or primed);
    p_Result_3_fu_125_p3 <= (odd_delay_iq_V_reg_205 & even_lane_z1);
    p_Result_4_fu_132_p3 <= (tmp_V_reg_186_pp0_iter1_reg & even_lane_z1);
    p_Result_s_fu_72_p1 <= cycle(1 - 1 downto 0);
    select_ln324_fu_163_p3 <= 
        even_delay_Array_V_q0 when (p_Result_s_reg_194(0) = '1') else 
        tmp_V_reg_186_pp0_iter1_reg;
    select_ln33_1_fu_147_p3 <= 
        p_Result_4_fu_132_p3 when (primed(0) = '1') else 
        ap_const_lv512_lc_1;
    select_ln33_fu_139_p3 <= 
        p_Result_3_fu_125_p3 when (primed(0) = '1') else 
        ap_const_lv512_lc_1;
    tmp_last_V_fu_91_p2 <= "1" when (cycle = ap_const_lv9_1FF) else "0";
    xor_ln29_fu_76_p2 <= (p_Result_s_fu_72_p1 xor ap_const_lv1_1);
end behav;