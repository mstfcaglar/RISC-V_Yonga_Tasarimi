`timescale 1ns / 1ps



module tb_riscv_32( );
	// Inputs  
	reg clk;  
	reg reset;  

	// Outputs  
	wire [31:0] pc_o;  
	wire [31:0] alu_sonuc;  

	// Instantiate the Unit Under Test (UUT)  
	riscv_32 uut (  
		 .clk(clk),   
		 .reset(reset),   
		 .pc_o(pc_o),   
		 .alu_sonuc(alu_sonuc)   
	);  

	initial begin  
		 clk = 0;  
		 forever #10 clk = ~clk;  
	end  

	initial begin  
		 reset = 1;   
		 #100;  
		reset = 0;   
	end 

    
endmodule
