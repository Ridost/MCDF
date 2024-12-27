// module定義方法一
// 先聲明端口後再來定義input/output方向
module ctrl_regs1(clk_i,rstn_i,
                  cmd_i,cmd_addr,cmd_data_i,cmd_data_o,
                  slv0_len_o,slv1_len_o,slv2_len_o,
                  slv0_prio_o,slv1_prio_o,slv2_prio_o,
                  slv0_avail_i,slv1_avail_i,slv2_avail_i,
                  slv0_en_i,slv1_en_i,slv2_en_i);
  input clk_i,rstn_i;
  input [1:0] cmd_i;
  input [7:0] cmd_addr_i;
  input [31:0] cmd_data_i;
  output [31:0] cmd_data_o;
  input [7:0] slv0_avail_i,slv1_avail_i,slv2_avail_i;
  output [2:0] slv0_len_o,slv1_len_o,slv2_len_o
  output [1:0] slv0_prio_o,slv1_prio_o,slv2_prio_o;
  output slv0_en_o,slv1_en_o,slv2_en_o;
endmodule
