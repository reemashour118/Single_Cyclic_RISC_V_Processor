module Control_unit (
    input Zero, funct7,Sign_Flag,
    input [6:0] OP,
    input [2:0]  funct3,
    output ResultSrc,MemWrite,ALUSrc,RegWrite, load,
    output [1:0] ImmSrc,
    output [2:0] ALUControl,
    output reg PCSrc
);
wire Branch;
wire [1:0] ALUOp;
ALU_Decoder U1 (
.Op5(OP[5]),.Funct3(funct3),.Funct7(funct7),
.ALUOP(ALUOp),.ALUcontrol(ALUControl)
);
Main_Decoder U2(
    .Opcode(OP),.RegWrite(RegWrite),.ALUSrc(LUSrc),
    .MemWrite(MemWrite),.ResultSrc(ResultSrc),
    .Branch(Branch),.ImmSrc(ImmSrc),.ALUOp(ALUOp),.load(load)
);
reg beq,bnq,blt;
always @(*) begin
    beq=Zero&Branch;
    bnq=~Zero&Branch;
    blt=Sign_Flag&Branch;
    case (funct3)
       3'b000 : PCSrc=beq;
       3'b001 : PCSrc=bnq;
       3'b100 : PCSrc=blt;
        default: PCSrc=0;
    endcase

end

endmodule