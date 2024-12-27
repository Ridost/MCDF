// 定義initiator來負責產生control register的控制信號
// 這個interface需要和DUT/stimulator/monitor連接，而每一種的信號輸入方向不一樣 因此使用modport來做進一步的聲明

interface regs_ini_if;
 #(parameter int addr_width =8,
    parameter int data_width =32);
  logic clk
  logic rstn;
  logic [1:0] cmd;
  logic [addr_width-1:0] cmd_addr;
  logic [data_width-1:0] cmd_data_w;
  logic [data_width-1:0] cmd_data_r;
// 定義給control register連接用的modport
  modport dut(
    input cmd, cmd_addr, cmd_data_w,
    output cmd_data_r
  );
// 定義給stimulator連接用的modport
  modport stim(
    input cmd_data_r,
    output cmd, cmd_addr, cmd_data_w,
  );
// 定義給monitor連接用的modport
  modport mon(
    input cmd, cmd_addr, cmd_data_w,cmd_data_r
  );
  
endinterface: regs_ini_if
