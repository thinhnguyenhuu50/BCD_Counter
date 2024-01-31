module dff (
  input d, clk, reset,
  output wire q
);
  wire w1, w2, w3, w4, q_bar;

  nand u1 (w1, w4, w2);
  nand u2 (w2, w1, clk, ~reset);
  nand u3 (w3, w2, clk, w4);
  nand u4 (w4, w3, d, ~reset);

  nand u5 (q, w2, q_bar);
  nand u6 (q_bar, q, w3, ~reset);

endmodule

module BCD_Up_Counter (
  input clk, reset,
  inout [3:0] q
);
  dff d0 (.d(~q[0]), .clk(clk),   .reset(reset), .q(q[0]));
  dff d1 (.d(~q[1]), .clk(~q[0]), .reset(reset), .q(q[1]));
  dff d2 (.d(~q[2]), .clk(~q[1]), .reset(reset), .q(q[2]));
  dff d3 (.d(~q[3]), .clk(~q[2]), .reset(reset), .q(q[3]));
endmodule