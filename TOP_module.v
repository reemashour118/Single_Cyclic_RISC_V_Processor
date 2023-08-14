module TOP_module (
    input CLK_TOP,Reset_TOP
);
wire [31:0] PC_TOP;
wire [31:0] instr_TOP;
wire [31:0] ALU_RESULT_TOP;
wire [31:0] WD_TOP;
wire WE_TOP;
wire [31:0] RD_TOP;
Instruction_Memory U0(
.Adress(PC_TOP),.instruction(instr_TOP)
);
Data_memory U1(
.CLK(CLK_TOP),.A(ALU_RESULT_TOP),
.WD(WD_TOP),.WE(WE_TOP),.RD(RD_TOP)
);
MIPS U2(
.instr(instr_TOP),.ReadData(RD_TOP),
.CLK_MIPS(CLK_TOP),.reset_MIPS(Reset_TOP),
.ALUResult_MIPS(ALU_RESULT_TOP),.PC_MIPS(PC_TOP),
.WriteData_MIPS(WD_TOP),.MemWrite_MIPS(WE_TOP)
);

























endmodule