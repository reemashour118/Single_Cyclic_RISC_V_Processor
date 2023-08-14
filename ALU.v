module ALU ( SrcA, SrcB, ALUControl, Zero, ALUResult, sign_flag);
    input [31:0] SrcA, SrcB;
    input [2:0]ALUControl;
    output reg Zero, sign_flag;
    output reg [31:0]ALUResult;
    
    always @(*) begin
        
        case (ALUControl)
            3'b000: ALUResult=SrcA+SrcB;
            3'b001: ALUResult=SrcA<<SrcB;
            3'b010: ALUResult=SrcA-SrcB;
            3'b100: ALUResult=SrcA^SrcB;
            3'b101: ALUResult=SrcA>>SrcB;
            3'b110: ALUResult=SrcA|SrcB;
            3'b111: ALUResult=SrcA&SrcB;
            default: ALUResult=0;
        endcase
        zero =~|ALUResult;
        sign_flag=ALUResult[31];

    end
    
endmodule