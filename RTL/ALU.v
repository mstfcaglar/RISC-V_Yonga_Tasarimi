`timescale 1ns / 1ps



module ALU(       
    input signed [31:0] a,              //src1  
    input signed [31:0] b,              //src2  
    input [3:0] alu_dnt,     //function sel  
    output reg signed [31:0] sonuc,    //result       
    output [1:0] esit_mi  
 );  
 

 wire [31:0] au;
 wire [31:0] bu;
 
assign au = (a[31]==1'b0) ? (a):   
		    (a[31]==1'b1) ? (-a):  //unsigned a
			1'b0;
assign bu = (b[31]==1'b0) ? (b):
		    (b[31]==1'b1) ? (-b):  // unsigned b
			1'b0;			  


			  
 

always @(*)  
    begin   
        case(alu_dnt)  
            4'b0000: sonuc = a + b; // add  
            4'b0001: sonuc = a - b; // sub  
            4'b0010: sonuc = a & b; // and  
            4'b0011: sonuc = a ^ b; // xor  
            4'b0100: begin if (a<b) sonuc = 32'd1;  
                        else sonuc = 32'd0;  
                        end 
			4'b0101: begin if (a>=b) sonuc = 32'd1;  
                        else sonuc = 32'd0;  
                        end 
			4'b0110: begin if (au>=bu) sonuc = 32'd1;  
                        else sonuc = 32'd0;  
                        end
			4'b0111: begin if (au<bu) sonuc = 32'd1;  
                        else sonuc = 32'd0;  
                        end	
			4'b1000: sonuc = b<<12;
			4'b1001: sonuc = (a+b)<<12;
			4'b1010: sonuc = a|b;
			4'b1011: sonuc = a<<b;
			4'b1100: sonuc = a>>b;	
			4'b1101: sonuc = a>>>b;
                        							
            default:sonuc = a + b; // add  
        endcase  
    end  


assign esit_mi = (sonuc==32'd0) ? (2'b00):
				 (sonuc!=32'd0) ? (2'b01):
				 2'b00;

endmodule
