module valied_opcode (opcode,result);
  input [5:0] opcode;
  output reg result;
  
  always @(*) begin
    case (opcode)//my id:1212517:last digit is 7
      6'h4: result=1;
      6'hE: result=1;
      6'h8: result=1;
      6'hB: result=1;
      6'hA: result=1;
      6'h1: result=1;
      6'hD: result=1;
      6'h6: result=1;
      6'h9: result=1;
      6'h5: result=1;
      6'h7: result=1;
      default: result=0;
    endcase
  end
  
endmodule