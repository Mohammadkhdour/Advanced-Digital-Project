module d_ff(clk,D,Q);
  parameter n=32;
  input clk;
  input [n-1:0] D;
  output reg [n-1:0] Q;
  always @(posedge clk)
  
    Q<=D;
  
endmodule