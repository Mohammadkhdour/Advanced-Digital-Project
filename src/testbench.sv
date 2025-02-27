// Name: Mohammad Khdour
// ID:1212517
module testmp_top;
  reg clk;
  reg [31:0] instruction[0:20];
  reg signed[31:0] t1,t2;//output from register file t1 is a t2 is b
  reg signed [31:0] result;//the correct result 
  wire signed[31:0] res;//output from mp_top
  wire valied_op;//check if the opcode is valied or not
int i;//inex for instruction array
  
  valied_opcode (instruction[i][5:0],valied_op);
  reg_file reg_(clk,valied_op,instruction[i][10:6],instruction[i][15:11],instruction[i][20:16],res,t1,t2);
  
  mp_top TOP(clk, instruction [i], res);

  
//////////////////////////////////////////////////////////
  
  initial begin 
    instruction[0]=32'b10110000101000100;//a=399a			b=31b6
    instruction[1]=32'b100000101001001110;//a=1330			b=6b50
     instruction[2]=32'b0011000010001000;//a=ffffa7e0		b=0cd8
     instruction[3]=32'b1110110100011001101;//a=3be2		b=00b0
     instruction[4]=32'b0000100111001010;//a=1e49			b=6b50
     instruction[5]=32'b111110110001111000001;//a=20ca		b=31b6
     instruction[6]=32'b1111100111001101;//a=1e49			b=20ca
    instruction[7]=32'b1000000101000110;//a=399a			b=3524
    instruction[8]=32'b110010011101001001;//a=1686			b=257a
    instruction[9]=32'b0111100001000101;//a=6b50			b=20ca
    instruction[10]=32'b1010010011010111;//opcode not exist
    instruction[11]=32'b1010010011000111;//a=27ce			b=221e

    
  end
///////////////////////////////////////////  main block
initial begin
        $display ("Select		instruction					result");

  for (i=0 ; i<12 ; i= i+1 ) begin
    #20  $display("Time %0d  	in=%b 		result=%h		a=%h	b=%h", $time,instruction [i] ,res,t1,t2);

         specific_result (instruction [i],t1,t2,result); 
         check (res,result);
    if (valied_op ==0)
      $display ("opcode not exist\n");
  end
   if(res==result)
          $display ("=======>TEST PASS<=======");
end
//////////////////////////////////////////////
     
    initial begin
      clk=0;
      repeat (100) 
         #5 clk =~clk;  			         
           
    end
///////////////////////////////////////////////////  
 task specific_result;
    input [31:0] instruction;
    input signed [31:0] t1,t2;
    output reg [31:0] result;
          case (instruction [5:0])
            6'h4:begin result = t1 + t2; 
              $display ("%h + %h = %h\n",t1,t2,result);end

            6'hE:begin result = t1 - t2;
              $display ("%h - %h = %h\n",t1,t2,result);end
            
     	    6'h8:begin if ( t1 < 0 ) result = -t1; else result = t1;
              $display (" |%h| = %h\n",t1,result);end
            
            6'hB:begin result = -t1;
              $display ("- %h = %h\n",t1,result);end
            
            6'hA:begin if (t1 > t2 ) result = t1; else result = t2; 
              $display ("%h > %h = %h\n",t1,t2,result);end
            
     	    6'h1:begin if (t1 < t2 ) result = t1; else result = t2;  
              $display ("%h < %h = %h\n",t1,t2,result);end
            
            6'hD:begin result = (t1+t2)/2 ;
              $display ("(%h + %h)/2 = %h\n",t1,t2,result);end
            6'h6:begin result = ~t1;
              $display (" ~%h = %h\n",t1,result);end
            6'h9:begin result = t1 | t2;
              $display ("%h | %h = %h\n",t1,t2,result);end
            6'h5:begin result = t1 & t2;
              $display ("%h & %h = %h\n",t1,t2,result);end
            6'h7:begin result = t1 ^ t2;
              $display ("%h ^ %h = %h\n",t1,t2,result);end
      default: result = 0;
    endcase
  endtask
////////////////////////////////////////////////////////
  task check;
    input [31:0] result1,result2;
    
     if(res!=result) begin
             $error("=========>TEST FAIL<========\n=======>There is an error result from mp_top not equal to specific result<====== \n");
       $display ("Time %0d	the result from mp_top = %h and the result should be =%h",$time,res,result);
          $stop;
             end
  endtask    
  endmodule