module MIPS (
    input[31:0] instr, ReadData,
    input CLK_MIPS,reset_MIPS,
    output [31:0] ALUResult_MIPS,PC_MIPS,
    output [31:0] WriteData_MIPS
    output MemWrite_MIPS;
);
wire ResultSrc_MIPS,ALUSrc_MIPS,RegWrite_MIPS,load_MIPS,PCSrc_MIPS;
wire [31:0] ImmExt_MIPS;
wire [1:0] ImmSrc_MIPS;
wire [2:0] ALUControl_MIPS;
reg [31:0]Result;
wire Zero_MIPS,sign_flag_MIPS;
Control_unit U1(
.Zero(Zero_MIPS),
.Sign_Flag(sign_flag_MIPS),
.funct7(instr[30]),
.OP(instr[6:0]),
.funct3(instr[14:12]),
.ResultSrc(ResultSrc_MIPS),
.MemWrite(MemWrite_MIPS),
.ALUSrc(ALUSrc_MIPS),
.RegWrite(RegWrite_MIPS),
.load(load_MIPS),
.ImmSrc(ImmSrc_MIPS),
.ALUControl(ALUControl_MIPS),
.PCSrc(PCSrc_MIPS)
);
IFU U2(
.areset_IF(reset_MIPS),
.clk_IF(CLK_MIPS),
.load_IF(load_MIPS),
.PCSrc_IF(PCSrc_MIPS),
.ImmSrc_IF(ImmSrc_MIPS),
.Instr(instr[31:7]),
.ImmExt_IF(ImmExt_MIPS),
.PC_IF(PC_MIPS)
);

Data_Path U3(
.A1_DP(instr[19:15]),
.A2_DP(instr[24:20]),
.A3_DP(instr [11:7]),
.WD3_DP(Result),
.ImmExt_DP(ImmExt_MIPS),
.ALUControl_DP(ALUControl_MIPS),
.CLK_DP(CLK_MIPS),
.WE3_DP(RegWrite_MIPS),
.reset_DP(reset_MIPS),
.ALUSrc(ALUSrc_MIPS),
.Zero_DP(Zero_MIPS),
.sign_flag_DP(sign_flag_MIPS),
.ALUResult_DP(ALUResult_MIPS),
.RD2_DP(WriteData_MIPS)
);
always @(*) begin
  if (ResultSrc_MIPS)
Result =ReadData;
else
Result =ALUResult_MIPS;  
end
endmodule