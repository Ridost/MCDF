// 建立control register的測試環境
// 依照不同功能切分為以下三個interface
// regs_cr_if控制clock和reset
// regs_init_if作為initiator負責給register下讀寫命令
// regs_rsp_if作為responder來給予register回應

interface regs_cr_if;
  logic clk;
  logic rstn;
endinterface: regs_cr_if

interface regs_init_if;
  #(parameter int addr_width =8,
    parameter int data_width =32);
  logic clk
  logic rstn;
  logic [1:0] cmd;
  logic [addr_width-1:0] cmd_addr;
  logic [data_width-1:0] cmd_data_w;
  logic [data_width-1:0] cmd_data_r;
endinterface: regs_init_if

interface regs_rsp_if;
  logic clk;
  logic rstn;
  logic [7:0] slv0_avail;
  logic [7:0] slv1_avail;
  logic [7:0] slv2_avail;
  logic [2:0] slv0_len;
  logic [2:0] slv1_len;
  logic [2:0] slv2_len;
  logic [1:0] slv0_prio;
  logic [1:0] slv1_prio;
  logic [1:0] slv2_prio;
  logic slv0_en;
  logic slv1_en;
  logic slv2_en;
endinterface: regs_rsp_if

  
  
  
  
