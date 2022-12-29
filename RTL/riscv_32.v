`timescale 1ns / 1ps




module riscv_32( 
	input clk,reset,  
	output[31:0] pc_o, alu_sonuc 
	); 
	
	
	reg [31:0] pc_simdi;	
	wire [31:0] pc_gelecek;
	wire [6:0] funct7,opcode;
	wire [4:0] rs2,rs1,rd;
	wire [2:0] funct3,mux2_dnt;
	wire [3:0] alu_dnt;
	wire [16:0] denetim_giris;
	wire [1:0] esit_mi;
	wire [1:0] mux1_dnt,mux4_dnt;
	wire mux3_dnt,yazma_dnt,genisletici_dnt,bellege_yaz_dnt;
	wire [31:0] rd_veri,rs1_veri_o,rs2_veri_o;
	wire [31:0] alu_giris,sonuc;
	wire [31:0] veri_cikisi;
	wire [4:0] genisletici1_giris;
	wire [31:0] genisletici1_cikis;
	wire [31:0] genisletici2_cikis;
	wire [31:0] sign_genisletici1;
	wire [31:0] zero_genisletici1;
	wire [31:0] toplam_giris1;
	wire [31:0] pc_cikis;
	wire [31:0] mux6_cikis;
	wire [31:0] mux7_cikis;
	wire [31:0] veri_cikisi_halfword;
	wire [31:0] veri_cikisi_byte;
	wire [31:0] veri_cikisi_halfword_unsigned;
	wire [31:0] veri_cikisi_byte_unsigned;
	wire signed [31:0] veri_cikisi_signed;
	
// PC   
always @(posedge clk or posedge reset) begin   
    if(reset)   
    pc_simdi <= 32'd0;  
    else  
    pc_simdi <= pc_cikis;  
end 

//Buyruk Bellegi
Buyruk_Bellegi byrk_bllg(.Address(pc_simdi),.funct7_o(funct7),.rs2_o(rs2),.rs1_o(rs1),.funct3_o(funct3),.rd_o(rd),.opcode_o(opcode));

//Denetim Birimi
Denetim_Birimi dntm_brm(reset,denetim_giris,esit_mi,mux2_dnt,mux4_dnt,mux1_dnt,mux3_dnt,yazma_dnt,genisletici_dnt,bellege_yaz_dnt,alu_dnt,mux5_dnt,mux6_dnt,mux7_dnt);


//denetim_giris
assign denetim_giris = {funct7,funct3,opcode};

//multiplexer3  
assign genisletici1_giris = (mux3_dnt==1'b0) ? rd : rs2;    

//Registers
Registers rgstrs(.clk(clk),.reset(reset),.rd(rd),.rs1(rs1),.rs2(rs2),.rd_veri(rd_veri),.yazma_denetimi(yazma_dnt),.rs1_veri_o(rs1_veri_o),.rs2_veri_o(rs2_veri_o));

//genisletici1
assign sign_genisletici1 = {{20{funct7[6]}},funct7,genisletici1_giris};  
assign zero_genisletici1 = {{20{1'b0}},funct7,genisletici1_giris};  
assign genisletici1_cikis = (genisletici_dnt==1'b0) ? zero_genisletici1 : sign_genisletici1; 

//multiplexer1
assign alu_giris = (mux1_dnt==2'b00) ? rs2_veri_o : 
                   (mux1_dnt==2'b01) ? genisletici1_cikis:
				   {funct7,rs2,rs1,funct3};	
//ALU
ALU alu_unit(.a(mux6_cikis),.b(alu_giris),.alu_dnt(alu_dnt),.sonuc(sonuc),.esit_mi(esit_mi));


//Veri Belleği
Veri_Bellegi vr_bllg(.clk(clk),.adres(sonuc),.veri_girisi(mux7_cikis),.bellege_yaz(bellege_yaz_dnt),.veri_cikisi(veri_cikisi_unsigned));  


//genisletici2
assign genisletici2_cikis = {{12{1'b0}},funct7,rs2,rs1,funct3};


//multiplexer4
assign toplam_giris1 = (mux4_dnt==2'b00) ? (32'd4) : ((mux4_dnt==2'b01) ? (genisletici1_cikis) : (genisletici2_cikis));



//multiplexer5
assign pc_cikis = (mux5_dnt==1'b0) ? sonuc :
				  pc_gelecek;	



//multiplexer6
assign mux6_cikis = (mux6_dnt==1'b0) ? pc_simdi :
		            rs1_veri_o;
					
					
//multiplexer7
assign mux7_cikis = (mux7_dnt==1'b00) ? rs2_veri_o [31:0] :
					(mux7_dnt==1'b01) ? rs2_veri_o [15:0]:
		            rs2_veri_o [7:0];					





//pc gelecek
assign pc_gelecek = toplam_giris1 + pc_simdi;


//pc+4
assign pc_artidort = pc_simdi + 32'd4;

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//veri_cikisi_halfword      veri_cikisi_byte   veri_cikisi_halfword_unsigned      veri_cikisi_byte_unsigned
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

assign veri_cikisi_signed = veri_cikisi_unsigned;


assign veri_cikisi_halfword = veri_cikisi[15]==1 ? {{24{1'b1}}, veri_cikisi [15:0]}:
						                           {{24{1'b0}}, veri_cikisi [15:0]};


assign veri_cikisi_byte = veri_cikisi[7]==1 ? {{24{1'b1}}, veri_cikisi [7:0]}:
						                      {{24{1'b0}}, veri_cikisi [7:0]};	


assign veri_cikisi_halfword_unsigned = {{24{1'b0}}, veri_cikisi [15:0]};


assign veri_cikisi_byte_unsigned = {{24{1'b0}}, veri_cikisi [7:0]};

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

											  


assign rd_veri = (mux2_dnt==3'b000) ? (sonuc):
		 (mux2_dnt==3'b001) ? (veri_cikisi_signed):
		 (mux2_dnt==3'b010) ? (pc_artidort):
		 (mux2_dnt==3'b011) ? (veri_cikisi_halfword):
		 (mux2_dnt==3'b100) ? (veri_cikisi_byte):
		 (mux2_dnt==3'b101) ? (veri_cikisi_unsigned):
		 (mux2_dnt==3'b110) ? (veri_cikisi_halfword_unsigned):
		 (veri_cikisi_byte_unsigned);
				 







assign pc_o = pc_simdi;
assign alu_sonuc = sonuc;
endmodule
