`timescale 1ns / 1ps



module Veri_Bellegi  
(  
     input clk,   
     input [31:0] adres,   
     input [31:0] veri_girisi,  
     input bellege_yaz,      
     output [31:0] veri_cikisi  
);  


     
	 (* ram_style = "block"*)
     reg [31:0] ram [255:0];  

	initial begin   
        $readmemb ("Veri_Bellegi.mem",ram,0,255); 
    end
	
	
     always @(posedge clk) begin  
          if (bellege_yaz)  
               ram[adres] <= veri_girisi;  
     end  

	assign veri_cikisi = ram[adres];

 
endmodule