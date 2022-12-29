`timescale 1ns / 1ps


module Buyruk_Bellegi( 
    input [31:0] Address,
    output wire [6:0] funct7_o,
    output wire [4:0] rs2_o,
    output wire [4:0] rs1_o,
    output wire [2:0] funct3_o,
    output wire [4:0] rd_o,
    output wire [6:0] opcode_o

    );

    reg [31:0] Data;

    reg [6:0] funct7;
    reg [4:0] rs2;
    reg [4:0] rs1;
    reg [2:0] funct3;
    reg [4:0] rd;
    reg [6:0] opcode;


	wire [29 : 0] BuyrukMem_Adres = Address[31 : 2];  


    (* BuyrukMem_style = "block"*)
    reg [31:0] BuyrukMem [0:15]; // 32 x 16 memory


    initial begin
        $readmemb ("BuyrukMem.mem",BuyrukMem,0,15); 
    end

    always @* begin
        Data = BuyrukMem[BuyrukMem_Adres]; // Read
    end 

    assign funct7_o = funct7;
    assign rs2_o = rs2;
    assign rs1_o = rs1;
    assign funct3_o = funct3;
    assign rd_o = rd;
    assign opcode_o = opcode;
	
	

    always @(Data)
        {funct7,rs2,rs1,funct3,rd,opcode} = Data;

endmodule
