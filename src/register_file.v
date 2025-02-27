module reg_file (clk,valied_opcode,addr1,addr2,addr3,in,out1, out2);
  input clk;
  input valied_opcode;
  input [4:0] addr1,addr2,addr3;
  input [31:0] in;
  output reg [31:0] out1,out2;
  reg [31:0] memory [0:31];
  
  initial begin
    memory [0]= 32'h0000;
    memory [1]= 32'h2D8E;
    memory [2]= 32'h2D2A;
    memory [3]= 32'h3BE2;
    memory [4]= 32'h257A;
    memory [5]= 32'h399A;
    memory [6]= 32'h0CD8;
    memory [7]= 32'h172C;
    memory [8]= 32'h07BA;
    memory [9]= 32'h1330;
    memory [10]= 32'h094C;
    memory [11]= 32'h0786;
    memory [12]= 32'h31B6;
    memory [13]= 32'h00B0;
    memory [14]= 32'h20D8;
    memory [15]= 32'h20CA;
    memory [16]= 32'h3524;
    memory [17]= 32'h27EE;
    memory [18]= 32'h1C5E;
    memory [19]= 32'h27CE;
    memory [20]= 32'h221E;
    memory [21]= 32'h3090;
    memory [22]= 32'h2214;
    memory [23]= 32'h1524;
    memory [24]= 32'h2B4A;
    memory [25]= 32'h08A4;
    memory [26]= 32'h182C;
    memory [27]= 32'h1B90;
    memory [28]= 32'h0EA0;
    memory [29]= 32'h1686;
    memory [30]= 32'h0D54;
    memory [31]= 32'h0000;
  end
  
  always @(posedge clk) begin
    if (valied_opcode==1) begin//check if the opcode is valied
      memory [addr3] = in;
    out1= memory [addr1];
    out2= memory [addr2];
  end
  end
endmodule