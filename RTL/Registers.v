`timescale 1ns / 1ps


module Registers( 
	input clk,reset,
    input [4:0] rd,
	input [4:0] rs1,
	input [4:0] rs2,
    input [31:0] rd_veri,
	input  yazma_denetimi,
	
    output [31:0] rs1_veri_o,
    output [31:0] rs2_veri_o
   
 
    );

     
 



    (* RegistersMem_style = "block"*)
    reg [31:0] RegistersMem [0:31]; // 32 x 32 memory    



 
       


    always @ (posedge clk or posedge reset) begin
        if(reset) begin	
			RegistersMem[0] <= 32'd0;
			RegistersMem[1] <= 32'd4;
			RegistersMem[2] <= -32'd5;
			RegistersMem[3] <= 32'd2;
			RegistersMem[4] <= 32'd10;
			RegistersMem[5] <= 32'd12;
			RegistersMem[6] <= 32'd13;
			RegistersMem[7] <= 32'd14;
			RegistersMem[8] <= -32'd15;
			RegistersMem[9] <= 32'd2;
			RegistersMem[10] <= 32'd0;
			RegistersMem[11] <= 32'd0;
			RegistersMem[12] <= 32'd0;
			RegistersMem[13] <= 32'd40;
			RegistersMem[14] <= 32'b0;
			RegistersMem[15] <= 32'b0;
			RegistersMem[16] <= 32'd0;
			RegistersMem[17] <= 32'd0;
			RegistersMem[18] <= 32'd0;
			RegistersMem[19] <= 32'b0;
			RegistersMem[20] <= 32'd0;
			RegistersMem[21] <= 32'd0;
			RegistersMem[22] <= 32'd0;
			RegistersMem[23] <= 32'd0;
			RegistersMem[24] <= 32'd0;
			RegistersMem[25] <= 32'd0;
			RegistersMem[26] <= 32'd0;
			RegistersMem[27] <= 32'd0;
			RegistersMem[28] <= 32'd0;
			RegistersMem[29] <= 32'd0;
			RegistersMem[30] <= 32'b0;
			RegistersMem[31] <= 32'b0;
			
		end
		else begin
			if(yazma_denetimi) begin
				RegistersMem[rd] <= rd_veri;
			end
		end		
    end
             

	assign rs1_veri_o = (rs1 == 0) ? 32'b0 : RegistersMem[rs1]; 
	assign rs2_veri_o = (rs2 == 0) ? 32'b0 : RegistersMem[rs2]; //  0 ıncı register hep 0 oluyor

endmodule
