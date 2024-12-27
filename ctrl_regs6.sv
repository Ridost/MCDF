// module定義方法6
// 透過define來參數化

`define ADDR_WIDTH 6
`define DATA_WIDTH 32

module ctrl_regs6
  (
    input [`ADDR_WIDTH-1:0] cmd_addr_i,
    input [`DATA_WIDTH-1:0] cmd_data_i,
    output[`DATA_WIDTH:0] cnd_data_o
  );
endmodule
