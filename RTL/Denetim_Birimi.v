module Denetim_Birimi( 
	input reset,
	input[16:0] denetim_giris,  //funct7,funct3/opcode
	input [1:0] esit_mi,
	output reg[2:0] mux2_dnt,
	output reg[1:0] mux4_dnt,mux1_dnt,   
	output reg mux3_dnt,yazma_dnt,genisletici_dnt,bellege_yaz_dnt, 
	output reg [3:0] alu_dnt,
	output reg mux5_dnt,
	output reg mux6_dnt,
	output reg [1:0] mux7_dnt	
);  


always @ (*) begin
	if(reset == 1'b1) begin	
		mux1_dnt = 1'b0;
		mux2_dnt = 3'b000;
		mux3_dnt = 1'b0;
		mux4_dnt = 2'b00;
		yazma_dnt = 1'b0;
		genisletici_dnt = 1'b0;
		bellege_yaz_dnt = 1'b0;
		alu_dnt = 4'b0000;
		mux5_dnt = 1'b1;
		mux6_dnt = 1'b1;
		mux7_dnt = 2'b00;
	end
	

	
		
	else begin
		mux1_dnt = 2'b00;
		mux2_dnt = 3'b000;
		mux3_dnt = 1'b0;
		mux4_dnt = 2'b00;
		mux5_dnt = 1'b1;
		mux6_dnt = 1'b1;
		mux7_dnt = 2'b00;
		yazma_dnt = 1'b0;
		genisletici_dnt = 1'b0;
		bellege_yaz_dnt = 1'b0;
		alu_dnt = 4'b0000;
		
		
		
		
		if(denetim_giris[6:0] == 7'b0110011)begin //R-Tip
			case(denetim_giris[9:7])
			
				3'b000: begin  
					if(denetim_giris[16:10] == 7'b0000000) begin //add 
						mux1_dnt = 2'b00;
						mux2_dnt = 3'b000;
						mux3_dnt = 1'b0;
						mux4_dnt = 2'b00;
						mux5_dnt = 1'b1;
						mux6_dnt = 1'b1;
						mux7_dnt = 2'b00;
						yazma_dnt = 1'b1;
						genisletici_dnt = 1'b0;
						bellege_yaz_dnt = 1'b0;
						alu_dnt = 4'b0000;
						
					end	
					else if(denetim_giris[16:10] == 7'b0100000) begin //sub
						mux1_dnt = 2'b00;
						mux2_dnt = 3'b000;
						mux3_dnt = 1'b0;
						mux4_dnt = 2'b00;
						mux5_dnt = 1'b1;
						mux6_dnt = 1'b1;
						mux7_dnt = 2'b00;
						yazma_dnt = 1'b1;
						genisletici_dnt = 1'b0;
						bellege_yaz_dnt = 1'b0;
						alu_dnt = 4'b0001;
					end
				end
				
				3'b001: begin				
					if(denetim_giris[16:10] == 7'b0000000) begin //sll
						mux1_dnt = 2'b00;
						mux2_dnt = 3'b000;
						mux3_dnt = 1'b0;
						mux4_dnt = 2'b00;						
						mux5_dnt = 1'b1;
						mux6_dnt = 1'b1;
						mux7_dnt = 2'b00;
						yazma_dnt = 1'b1;
						genisletici_dnt = 1'b0;
						bellege_yaz_dnt = 1'b0;
						alu_dnt = 4'b1011;
					end
				end
				
				3'b010: begin				
					if(denetim_giris[16:10] == 7'b0000000) begin //slt
						mux1_dnt = 2'b00;
						mux4_dnt = 2'b00;
						mux3_dnt = 1'b0;
						mux5_dnt = 1'b1;
						mux6_dnt = 1'b1;
						mux7_dnt = 2'b00;
						yazma_dnt = 1'b1;
						genisletici_dnt = 1'b0;
						bellege_yaz_dnt = 1'b0;
						alu_dnt = 4'b0100;
						mux2_dnt = 3'b000;
					end
				end	
				
				3'b011: begin				
					if(denetim_giris[16:10] == 7'b0000000) begin //sltu
						mux1_dnt = 2'b00;
						mux2_dnt = 3'b000;
						mux3_dnt = 1'b0;
						mux4_dnt = 2'b00;						
						mux5_dnt = 1'b1;
						mux6_dnt = 1'b1;
						mux7_dnt = 2'b00;
						yazma_dnt = 1'b1;
						genisletici_dnt = 1'b0;
						bellege_yaz_dnt = 1'b0;
						alu_dnt = 4'b0111;
						
					end
				end	
				
				3'b101: begin				
					if(denetim_giris[16:10] == 7'b0000000) begin //srl
						mux1_dnt = 2'b00;
						mux2_dnt = 3'b000;
						mux3_dnt = 1'b0;
						mux4_dnt = 2'b00;						
						mux5_dnt = 1'b1;
						mux6_dnt = 1'b1;
						mux7_dnt = 2'b00;
						yazma_dnt = 1'b1;
						genisletici_dnt = 1'b0;
						bellege_yaz_dnt = 1'b0;
						alu_dnt = 4'b1100;
					end
					else if(denetim_giris[16:10] == 7'b0100000) begin //sra
						mux1_dnt = 2'b00;
						mux2_dnt = 3'b000;
						mux3_dnt = 1'b0;
						mux4_dnt = 2'b00;						
						mux5_dnt = 1'b1;
						mux6_dnt = 1'b1;
						mux7_dnt = 2'b00;
						yazma_dnt = 1'b1;
						genisletici_dnt = 1'b0;
						bellege_yaz_dnt = 1'b0;
						alu_dnt = 4'b1101;
					end
				end
				
				3'b110: begin				
					if(denetim_giris[16:10] == 7'b0000000) begin //or
						mux1_dnt = 2'b00;
						mux4_dnt = 2'b00;
						mux3_dnt = 1'b0;
						mux5_dnt = 1'b1;
						mux6_dnt = 1'b1;
						mux7_dnt = 2'b00;
						yazma_dnt = 1'b1;
						genisletici_dnt = 1'b0;
						bellege_yaz_dnt = 1'b0;
						alu_dnt = 4'b1010;
						mux2_dnt = 3'b000;
					end
				end	
				
				3'b111: begin				
					if(denetim_giris[16:10] == 7'b0000000) begin //and
						mux1_dnt = 2'b00;
						mux2_dnt = 3'b000;
						mux3_dnt = 1'b0;
						mux4_dnt = 2'b00;
						mux5_dnt = 1'b1;
						mux6_dnt = 1'b1;
						mux7_dnt = 2'b00;
						yazma_dnt = 1'b1;
						genisletici_dnt = 1'b0;
						bellege_yaz_dnt = 1'b0;
						alu_dnt = 4'b0010;	
					end
				end	
				
				3'b100: begin
					if(denetim_giris[16:10] == 7'b0000000) begin //xor
						mux1_dnt = 2'b00;
						mux2_dnt = 3'b000;
						mux3_dnt = 1'b0;
						mux4_dnt = 2'b00;
						mux5_dnt = 1'b1;
						mux6_dnt = 1'b1;
						mux7_dnt = 2'b00;
						yazma_dnt = 1'b1;
						genisletici_dnt = 1'b0;
						bellege_yaz_dnt = 1'b0;
						alu_dnt = 4'b0011;	
					end
				end	
				default: begin	
					mux1_dnt = 2'b00;
					mux2_dnt = 3'b000;
					mux3_dnt = 1'b0;
					mux4_dnt = 2'b00;
					mux5_dnt = 1'b1;
					mux6_dnt = 1'b1;
					mux7_dnt = 2'b00;
					yazma_dnt = 1'b1;
					genisletici_dnt = 1'b0;
					bellege_yaz_dnt = 1'b0;
					alu_dnt = 4'b0000;					
				end			
			endcase
		end	
			
			
				
		else if(denetim_giris[6:0] == 7'b0010011)begin //R-Tip		
			case(denetim_giris[9:7])	
				3'b000: begin            //addi
					mux1_dnt = 2'b01;
					mux2_dnt = 3'b000;
					mux3_dnt = 1'b1;
					mux4_dnt = 2'b00;
					mux5_dnt = 1'b1;
					mux6_dnt = 1'b1;
					mux7_dnt = 2'b00;
					yazma_dnt = 1'b1;
					genisletici_dnt = 1'b0;
					bellege_yaz_dnt = 1'b0;
					alu_dnt = 4'b0000;
				end	
				3'b001: begin				
					if(denetim_giris[16:10] == 7'b0000000) begin //slli
						mux1_dnt = 2'b01;
						mux2_dnt = 3'b000;
						mux3_dnt = 1'b1;
						mux4_dnt = 2'b00;						
						mux5_dnt = 1'b1;
						mux6_dnt = 1'b1;
						mux7_dnt = 2'b00;
						yazma_dnt = 1'b1;
						genisletici_dnt = 1'b0;
						bellege_yaz_dnt = 1'b0;
						alu_dnt = 4'b1011;
					end
				end	
				3'b010: begin            //slti
					mux1_dnt = 2'b01;
					mux2_dnt = 3'b000;
					mux3_dnt = 1'b1;
					mux4_dnt = 2'b00;
					mux5_dnt = 1'b1;
					mux6_dnt = 1'b1;
					mux7_dnt = 2'b00;
					yazma_dnt = 1'b1;
					genisletici_dnt = 1'b1;
					bellege_yaz_dnt = 1'b0;
					alu_dnt = 4'b0100;
				end	
				3'b011: begin            //sltiu
					mux1_dnt = 2'b01;
					mux2_dnt = 3'b000;
					mux3_dnt = 1'b1;
					mux4_dnt = 2'b00;
					mux5_dnt = 1'b1;
					mux6_dnt = 1'b1;
					mux7_dnt = 2'b00;
					yazma_dnt = 1'b1;
					genisletici_dnt = 1'b0;
					bellege_yaz_dnt = 1'b0;
					alu_dnt = 4'b0111;
				end
				3'b100: begin            //xori
					mux1_dnt = 2'b01;
					mux2_dnt = 3'b000;
					mux3_dnt = 1'b1;
					mux4_dnt = 2'b00;
					mux5_dnt = 1'b1;
					mux6_dnt = 1'b1;
					mux7_dnt = 2'b00;
					yazma_dnt = 1'b1;
					genisletici_dnt = 1'b0;
					bellege_yaz_dnt = 1'b0;
					alu_dnt = 4'b0011;
				end
				3'b101: begin				
					if(denetim_giris[16:10] == 7'b0000000) begin //srli
						mux1_dnt = 2'b01;
						mux2_dnt = 3'b000;
						mux3_dnt = 1'b1;
						mux4_dnt = 2'b00;						
						mux5_dnt = 1'b1;
						mux6_dnt = 1'b1;
						mux7_dnt = 2'b00;
						yazma_dnt = 1'b1;
						genisletici_dnt = 1'b0;
						bellege_yaz_dnt = 1'b0;
						alu_dnt = 4'b1100;
					end
					else if(denetim_giris[16:10] == 7'b0100000) begin //srai
						mux1_dnt = 2'b01;
						mux2_dnt = 3'b000;
						mux3_dnt = 1'b1;
						mux4_dnt = 2'b00;						
						mux5_dnt = 1'b1;
						mux6_dnt = 1'b1;
						mux7_dnt = 2'b00;
						yazma_dnt = 1'b1;
						genisletici_dnt = 1'b0;
						bellege_yaz_dnt = 1'b0;
						alu_dnt = 4'b1101;
					end
				end
				3'b110: begin            //ori
					mux1_dnt = 2'b01;
					mux2_dnt = 3'b000;
					mux3_dnt = 1'b1;
					mux4_dnt = 2'b00;
					mux5_dnt = 1'b1;
					mux6_dnt = 1'b1;
					mux7_dnt = 2'b00;
					yazma_dnt = 1'b1;
					genisletici_dnt = 1'b0;
					bellege_yaz_dnt = 1'b0;
					alu_dnt = 4'b1010;
				end		
				3'b111: begin            //andi
					mux1_dnt = 2'b01;
					mux2_dnt = 3'b000;
					mux3_dnt = 1'b1;
					mux4_dnt = 2'b00;
					mux5_dnt = 1'b1;
					mux6_dnt = 1'b1;
					mux7_dnt = 2'b00;
					yazma_dnt = 1'b1;
					genisletici_dnt = 1'b0;
					bellege_yaz_dnt = 1'b0;
					alu_dnt = 4'b0010;
				end	
				default: begin	
					mux1_dnt = 2'b00;
					mux2_dnt = 3'b000;
					mux3_dnt = 1'b0;
					mux4_dnt = 2'b00;
					mux5_dnt = 1'b1;
					mux6_dnt = 1'b1;
					mux7_dnt = 2'b00;
					yazma_dnt = 1'b1;
					genisletici_dnt = 1'b0;
					bellege_yaz_dnt = 1'b0;
					alu_dnt = 4'b0000;					
				end	
			endcase	
		end	


		else if(denetim_giris[6:0] == 7'b0000011)begin //I-Tip		
			case(denetim_giris[9:7])
				3'b000: begin            //lb
					mux1_dnt = 2'b01;
					mux2_dnt = 3'b100;
					mux3_dnt = 1'b1;
					mux4_dnt = 2'b00;
					mux5_dnt = 1'b1;
					mux6_dnt = 1'b1;
					mux7_dnt = 2'b00;
					yazma_dnt = 1'b1;
					genisletici_dnt = 1'b0;
					bellege_yaz_dnt = 1'b0;
					alu_dnt = 4'b0000;
				end
				3'b001: begin            //lh
					mux1_dnt = 2'b01;
					mux2_dnt = 3'b011;
					mux3_dnt = 1'b1;
					mux4_dnt = 2'b00;
					mux5_dnt = 1'b1;
					mux6_dnt = 1'b1;
					mux7_dnt = 2'b00;
					yazma_dnt = 1'b1;
					genisletici_dnt = 1'b0;
					bellege_yaz_dnt = 1'b0;
					alu_dnt = 4'b0000;
				end	
				3'b010: begin            //lw
					mux1_dnt = 2'b01;
					mux2_dnt = 3'b001;
					mux3_dnt = 1'b1;
					mux4_dnt = 2'b00;
					mux5_dnt = 1'b1;
					mux6_dnt = 1'b1;
					mux7_dnt = 2'b00;
					yazma_dnt = 1'b1;
					genisletici_dnt = 1'b0;
					bellege_yaz_dnt = 1'b0;
					alu_dnt = 4'b0000;
				end
				3'b100: begin            //lbu
					mux1_dnt = 2'b01;
					mux2_dnt = 3'b111;
					mux3_dnt = 1'b1;
					mux4_dnt = 2'b00;
					mux5_dnt = 1'b1;
					mux6_dnt = 1'b1;
					mux7_dnt = 2'b00;
					yazma_dnt = 1'b1;
					genisletici_dnt = 1'b0;
					bellege_yaz_dnt = 1'b0;
					alu_dnt = 4'b0000;
				end
				3'b101: begin            //lhu
					mux1_dnt = 2'b01;
					mux2_dnt = 3'b110;
					mux3_dnt = 1'b1;
					mux4_dnt = 2'b00;
					mux5_dnt = 1'b1;
					mux6_dnt = 1'b1;
					mux7_dnt = 2'b00;
					yazma_dnt = 1'b1;
					genisletici_dnt = 1'b0;
					bellege_yaz_dnt = 1'b0;
					alu_dnt = 4'b0000;
				end	
				3'b110: begin            //lwu
					mux1_dnt = 2'b01;
					mux2_dnt = 3'b101;
					mux3_dnt = 1'b1;
					mux4_dnt = 2'b00;
					mux5_dnt = 1'b1;
					mux6_dnt = 1'b1;
					mux7_dnt = 2'b00;
					yazma_dnt = 1'b1;
					genisletici_dnt = 1'b0;
					bellege_yaz_dnt = 1'b0;
					alu_dnt = 4'b0000;
				end	
				default: begin	
					mux1_dnt = 2'b00;
					mux2_dnt = 3'b000;
					mux3_dnt = 1'b0;
					mux4_dnt = 2'b00;
					mux5_dnt = 1'b1;
					mux6_dnt = 1'b1;
					mux7_dnt = 2'b00;
					yazma_dnt = 1'b1;
					genisletici_dnt = 1'b0;
					bellege_yaz_dnt = 1'b0;
					alu_dnt = 4'b0000;					
				end	
			endcase	
		end	
		
		
		else if(denetim_giris[6:0] == 7'b0100011)begin //S-Tip		
			case(denetim_giris[9:7])
				3'b000: begin            //sb
					mux1_dnt = 2'b01;
					mux2_dnt = 3'b001;
					mux3_dnt = 1'b1;
					mux4_dnt = 2'b00;
					mux5_dnt = 1'b1;
					mux6_dnt = 1'b1;
					mux7_dnt = 1'b10;
					yazma_dnt = 1'b0;
					genisletici_dnt = 1'b0;
					bellege_yaz_dnt = 1'b1;
					alu_dnt = 4'b0000;
				end	
				3'b001: begin            //sh
					mux1_dnt = 2'b01;
					mux2_dnt = 3'b001;
					mux3_dnt = 1'b1;
					mux4_dnt = 2'b00;
					mux5_dnt = 1'b1;
					mux6_dnt = 1'b1;
					mux7_dnt = 1'b01;
					yazma_dnt = 1'b0;
					genisletici_dnt = 1'b0;
					bellege_yaz_dnt = 1'b1;
					alu_dnt = 4'b0000;
				end
				3'b010: begin            //sw
					mux1_dnt = 2'b01;
					mux2_dnt = 3'b001;
					mux3_dnt = 1'b0;
					mux4_dnt = 2'b00;
					mux5_dnt = 1'b1;
					mux6_dnt = 1'b1;
					mux7_dnt = 1'b00;
					yazma_dnt = 1'b1;
					genisletici_dnt = 1'b0;
					bellege_yaz_dnt = 1'b1;
					alu_dnt = 4'b0000;
				end
				
				default: begin	
					mux1_dnt = 2'b00;
					mux2_dnt = 3'b000;
					mux3_dnt = 1'b0;
					mux4_dnt = 2'b00;
					mux5_dnt = 1'b1;
					mux6_dnt = 1'b1;
					mux7_dnt = 2'b00;
					yazma_dnt = 1'b1;
					genisletici_dnt = 1'b0;
					bellege_yaz_dnt = 1'b0;
					alu_dnt = 4'b0000;					
				end	
			endcase	
		end	
			

		else if(denetim_giris[6:0] == 7'b1100011)begin //SB-Tip		
			case(denetim_giris[9:7])	
				3'b000: begin            //beq
					mux1_dnt = 2'b00;
					mux2_dnt = 3'b000;
					mux3_dnt = 1'b0;
					mux5_dnt = 1'b1;
					mux6_dnt = 1'b1;
					mux7_dnt = 2'b00;
					yazma_dnt = 1'b0;
					genisletici_dnt = 1'b0;
					bellege_yaz_dnt = 1'b0;
					alu_dnt = 4'b0001;
					if (esit_mi==2'b00) begin
						mux4_dnt = 2'b01;	
					end	
					else begin
						mux4_dnt = 2'b00;
					end
				end	
				3'b001: begin            //bne
					mux1_dnt = 2'b00;
					mux2_dnt = 3'b000;
					mux3_dnt = 1'b0;
					mux5_dnt = 1'b1;
					mux6_dnt = 1'b1;
					mux7_dnt = 2'b00;
					yazma_dnt = 1'b0;
					genisletici_dnt = 1'b0;
					bellege_yaz_dnt = 1'b0;
					alu_dnt = 4'b0001;
					if (esit_mi==2'b01) begin  //branching koşuluna uygunsa
						mux4_dnt = 2'b01;	
					end	
					else begin                  //branching koşuluna uygun değilse
						mux4_dnt = 2'b00;
					end
				end
				3'b100: begin            //blt
					mux1_dnt = 2'b00;
					mux2_dnt = 3'b000;
					mux3_dnt = 1'b0;
					mux5_dnt = 1'b1;
					mux6_dnt = 1'b1;
					mux7_dnt = 2'b00;
					yazma_dnt = 1'b0;
					genisletici_dnt = 1'b0;
					bellege_yaz_dnt = 1'b0;
					alu_dnt = 4'b0100;
					if (esit_mi==2'b01) begin  //branching koşuluna uygunsa
						mux4_dnt = 2'b01;	
					end	
					else begin                  //branching koşuluna uygun değilse
						mux4_dnt = 2'b00;
					end
				end	
				3'b110: begin            //bltu
					mux1_dnt = 2'b00;
					mux2_dnt = 3'b000;
					mux3_dnt = 1'b0;
					mux5_dnt = 1'b1;
					mux6_dnt = 1'b1;
					mux7_dnt = 2'b00;
					yazma_dnt = 1'b0;
					genisletici_dnt = 1'b0;
					bellege_yaz_dnt = 1'b0;
					alu_dnt = 4'b0111;
					if (esit_mi==2'b01) begin  //branching koşuluna uygunsa
						mux4_dnt = 2'b01;	
					end	
					else begin                  //branching koşuluna uygun değilse
						mux4_dnt = 2'b00;
					end
				end
				3'b101: begin            //bge
					mux1_dnt = 2'b00;
					mux2_dnt = 3'b000;
					mux3_dnt = 1'b0;
					mux5_dnt = 1'b1;
					mux6_dnt = 1'b1;
					mux7_dnt = 2'b00;
					yazma_dnt = 1'b0;
					genisletici_dnt = 1'b0;
					bellege_yaz_dnt = 1'b0;
					alu_dnt = 4'b0101;
					if (esit_mi==2'b01) begin  //branching koşuluna uygunsa
						mux4_dnt = 2'b01;	
					end	
					else begin                  //branching koşuluna uygun değilse
						mux4_dnt = 2'b00;
					end
				end	
				3'b111: begin            //bgeu
					mux1_dnt = 2'b00;
					mux2_dnt = 3'b000;
					mux3_dnt = 1'b0;
					mux5_dnt = 1'b1;
					mux6_dnt = 1'b1;
					mux7_dnt = 2'b00;
					yazma_dnt = 1'b0;
					genisletici_dnt = 1'b0;
					bellege_yaz_dnt = 1'b0;
					alu_dnt = 4'b0110;
					if (esit_mi==2'b01) begin  //branching koşuluna uygunsa
						mux4_dnt = 2'b01;	
					end	
					else begin                  //branching koşuluna uygun değilse
						mux4_dnt = 2'b00;
					end
				end
				default: begin	             
					mux1_dnt = 2'b00;
					mux2_dnt = 3'b000;
					mux3_dnt = 1'b0;
					mux4_dnt = 2'b00;
					mux5_dnt = 1'b1;
					mux6_dnt = 1'b1;
					mux7_dnt = 2'b00;
					yazma_dnt = 1'b1;
					genisletici_dnt = 1'b0;
					bellege_yaz_dnt = 1'b0;
					alu_dnt = 4'b0000;					
				end	
			endcase	
		end	


		else if(denetim_giris[6:0] == 7'b1101111) begin //UJ-Tip		
					mux1_dnt = 2'b00;      //jal
					mux2_dnt = 3'b010;
					mux3_dnt = 1'b0;
					mux4_dnt = 2'b10;
					mux5_dnt = 1'b1;
					mux6_dnt = 1'b1;
					mux7_dnt = 2'b00;
					yazma_dnt = 1'b1;
					genisletici_dnt = 1'b0;
					bellege_yaz_dnt = 1'b0;
					alu_dnt = 4'b0000;			
		end	
		
		else if(denetim_giris[6:0] == 7'b1100111) begin //		
					mux1_dnt = 2'b01;      //jalr
					mux2_dnt = 3'b010;
					mux3_dnt = 1'b1;
					mux4_dnt = 2'b10;
					mux5_dnt = 1'b0;
					mux6_dnt = 1'b1;
					mux7_dnt = 2'b00;
					yazma_dnt = 1'b1;
					genisletici_dnt = 1'b0;
					bellege_yaz_dnt = 1'b0;
					alu_dnt = 4'b0000;			
		end	

		else if(denetim_giris[6:0] == 7'b0110111) begin //		
					mux1_dnt = 2'b10;      //lui
					mux2_dnt = 3'b000;
					mux3_dnt = 1'b1;
					mux4_dnt = 2'b00;
					mux5_dnt = 1'b1;
					mux6_dnt = 1'b1;
					mux7_dnt = 2'b00;
					yazma_dnt = 1'b1;
					genisletici_dnt = 1'b0;
					bellege_yaz_dnt = 1'b0;
					alu_dnt = 4'b1000;			
		end	

		else if(denetim_giris[6:0] == 7'b0010111) begin //		
					mux1_dnt = 2'b10;      //auip
					mux2_dnt = 3'b000;
					mux3_dnt = 1'b1;
					mux4_dnt = 2'b00;
					mux5_dnt = 1'b1;
					mux6_dnt = 1'b0;
					mux7_dnt = 2'b00;
					yazma_dnt = 1'b1;
					genisletici_dnt = 1'b0;
					bellege_yaz_dnt = 1'b0;
					alu_dnt = 4'b1001;			
		end		
				
	end			
				
				
end				



endmodule	