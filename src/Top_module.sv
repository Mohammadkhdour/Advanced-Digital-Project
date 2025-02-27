//Name:Mohammad Khdour
//ID:1212517
`include "register_file.v"
`include "ALU.v"
`include "D_flipflop.v"
`include "Valied_opcode.v"

module mp_top (clk,instruction,result);
  input clk;
  input [31:0] instruction;
  output reg [31:0] result;
  wire valied_op;
  wire [5:0] opcode=instruction[5:0],opcode1;//opcode take first 6 bits from instruction  
  wire [4:0] address1 =instruction[10:6];//address1 for read take  second 5 bits from instruction 
  wire [4:0] address2 =instruction[15:11];//address2 for read take third 5 bits from instruction 
  wire [4:0] address3 =instruction[20:16];//address3 for write take fourth 5 bits from instruction
  wire [31:0] in,out1,out2;//in is the result come from alu, out1 and out2 the output from reg file
  
  valied_opcode check(opcode,valied_op);// check if opcode is valied 

  reg_file (clk,valied_op,address1,address2,address3,result,out1,out2);

  d_ff #(6) d1(clk,opcode,opcode1);

  alu (opcode1,out1,out2,result); 
  
endmodule