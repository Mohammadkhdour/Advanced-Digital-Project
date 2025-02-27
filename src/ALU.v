// Name:mohammad Khdour
//ID:1212517
module alu (opcode, a, b, result);
  input [5:0] opcode;
  input signed [31:0] a,b;
  output reg signed [31:0] result;
  always @(*) begin
    case (opcode)//my id:1212517:last digit is 7
      6'h4: result = a + b;
      6'hE: result = a - b;
      6'h8: if ( a < 0 ) result = -a; else result = a;
      6'hB: result = -a;
      6'hA: if (a > b ) result = a; else result = b;
      6'h1: if (a < b ) result = a; else result = b;
      6'hD: result = (a+b)/2 ;
      6'h6: result = ~a;
      6'h9: result = a | b;
      6'h5: result = a & b;
      6'h7: result = a ^ b;
      default: result = 0;
    endcase
  end
  
endmodule