// 建立control regs的驗證環境

// interface initialize
regs_cr_if cr_if();
regs_ini_if ini_if();
regs_rsp_if rsp_if();

// clk & rst signal
assign ini_if.clk = cr_if.clk;
assign ini_if.rstn = cr_if.rstn;
assign rsp_if.clk = cr_if.clk;
assign rsp_if.rstn = cr_if.rstn;

// ctrl_regs initialize
ctrl_regs regs(
  .clk_i (cr_if.clk),
  .rstn_i (cr_if.rstn),
  .cmd_i (ini_if.cmd),
  .cmd_addr (ini_if.cmd_addr),
  .cmd_data_i (ini_if.cmd_data_w),
  .cmd_data_o (ini_if.cmd_data_r),
  .slv0_avail_i (rsp_if.slv0_avail),
  .slv1_avail_i (rsp_if.slv1_avail),
  .slv2_avail_i (rsp_if.slv2_avail),
  .slv0_len_o (rsp_if.slv0_len),
  .slv1_len_o (rsp_if.slv1_len),
  .slv2_len_o (rsp_if.slv2_len),
  .slv0_prio_o (rsp_if.slv0_prio),
  .slv1_prio_o (rsp_if.slv1_prio),
  .slv2_prio_o (rsp_if.slv2_prio),
  .slv0_en (rsp_if.slv0_en),
  .slv1_en (rsp_if.slv1_en),
  .slv2_en (rsp_if.slv2_en)
);
