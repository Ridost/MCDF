// 在regs_cr_if接口中產生clock和rstn信號

interface regs_cr_if;
  logic clk;
  logic rstn;
  initial begin
    clk <= 0;
    forever begin
      #5ns clk <= !clk;
    end
  end
  
  initial begin
    #20ns
    rstn <= 1;
    #40ns
    rstn <= 0;
    #40ns
    rstn <= 1;
  end
endinterface: regs_cr_if
