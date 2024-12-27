--- VHDL module定義方法二
--- 透過package跟record將信號綁在一起
library IEEE;
use IEEE.std_logic_1164.all;

package mcdf_pkg is 
type reg2arb_t is record
	slv0_prio : std_logic_vector(1 downto 0);
    slv1_prio : std_logic_vector(1 downto 0);
    slv2_prio : std_logic_vector(1 downto 0);
end record;
type reg2fmt_t is record
	slv0_len : std_logic_vector(2 downto 0);
	slv1_len : std_logic_vector(2 downto 0);
	slv2_len : std_logic_vector(2 downto 0);
end record;
end mcdf_pkg;
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
  reg2fmt_o : out reg2fmt_t;
  reg2arb_o : out reg2arb_t;
  slv0_en_o : out std_logic;
  slv1_en_o : out std_logic;
  slv2_en_o : out std_logic;
);
end ctrl_regs3;
