// module定義方法二
// 在端口聲明的同時定義方向

module ctrl_regs2(
  input clk_i,
  input rstn_i,
  input [1:0]cmd_i,
  input [7:0]cmd_addr_i,
  input [31:0]cmd_data_i,
  output [31:0]cmd_data_o,
  input [7:0] slv0_avail_i,
  input [7:0] slv1_avail_i,
  input [7:0] slv2_avail_i,
  output [2:0] slv0_len_o,
  output [2:0] slv1_len_o,
  output [2:0] slv2_len_o,
  output [1:0] slv0_prio_o,
  output [1:0] slv1_prio_o,
  output [1:0] slv2_prio_o,
  output slv0_en_o,
  output slv1_en_o,
  output slv2_en_o
);
endmodule
