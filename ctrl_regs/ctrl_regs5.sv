// module定義方法五
// 透過parameter來參數化定義

module ctrl_regs5
  #(parameter int addr_width = 8,
    parameter int data_width = 32)
  (
    input [addr_width-1:0] cmd_addr_i,
    input [data_width-1:0] cmd_data_i,
    output [data_width-1:0] cmd_data_o,
  );
endmodule
