--- VHDL module定義方法一
--- 定義同時給定方向
library IEEE;
use IEEE.std_logic_1164.all;

entity ctrl_regs3 is
port(
  clk_i:in std_logic;
  rst_n : in std_logic;
  cmd_i	: in std_logic_vector(1 downto 0);
  cmd_addr_i : in std_logic_vector(7 downto 0);
  cmd_data_i : in std_logic_vector(31 downto 0);
  cmd_data_o : out std_logic_vector(31 downto 0);
  slv0_avail_i : in std_logic_vector(7 downto 0);
  slv1_avail_i : in std_logic_vector(7 downto 0);
  slv2_avail_i : in std_logic_vector(7 downto 0);
  slv0_len_o : out std_logic_vector(2 downto 0);
  slv1_len_o : out std_logic_vector(2 downto 0);
  slv2_len_o : out std_logic_vector(2 downto 0);
  slv0_prio_o : out std_logic_vector(1 downto 0);
  slv1_prio_o : out std_logic_vector(1 downto 0);
  slv2_prio_o : out std_logic_vector(1 downto 0);
  slv0_en_o : out std_logic;
  slv1_en_o : out std_logic;
  slv2_en_o : out std_logic;
);
end ctrl_regs3;
