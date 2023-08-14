module Data_Path (
    input [4:0] A1_DP,A2_DP,A3_DP,
    input [31:0]WD3_DP,ImmExt_DP,
    input [2:0]ALUControl_DP,
    input CLK_DP,WE3_DP,reset_DP,ALUSrc,
    output Zero_DP, sign_flag_DP,
    output [31:0] ALUResult_DP,RD2_DP
);
wire [31:0]RD1_DP;
reg [31:0]SrcB_DP;


ALU U1(
.SrcA(RD1_DP),.SrcB(SrcB_DP),.ALUControl(ALUControl_DP),
.Zero(Zero_DP),.sign_flag(sign_flag_DP),
.ALUResult(ALUResult_DP)
);


Register_file U2 (
.A1(A1_DP),.A2(A2_DP),.A3(A3_DP),
.WD3(WD3_DP),.CLK(CLK_DP),.WE3(WE3_DP),.reset(reset_DP),
.RD1(RD1_DP),.RD2(RD2_DP)
);


always @(*) begin
    
if (ALUSrc) begin
    SrcB_DP=ImmExt_DP;
end else begin
   SrcB_DP=RD2_DP; 
end
end
endmodule