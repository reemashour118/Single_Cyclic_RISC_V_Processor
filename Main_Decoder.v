module Main_Decoder ( 
    input [6:0] Opcode,
    output reg RegWrite,ALUSrc,MemWrite,ResultSrc,Branch, load,
    output reg [1:0] ImmSrc,ALUOp
);
localparam Load =7'b000_0011 ,
           Store =7'b010_0011 ,
           R_Type =7'b011_0011 ,
           I_Type =7'b001_0011 ,
           Branch_if =7'b110_0011,
           halt = 7'b000_0000;


always @(*) begin
    RegWrite=0; 
    ImmSrc=2'b00; 
    ALUSrc=0;
    MemWrite=0;
    ResultSrc=0;
    Branch=0;
    ALUOp=2'b00;
    load = 1;
    case (Opcode)
        Load: 
        begin
            RegWrite=1; 
            ImmSrc=2'b00; 
            ALUSrc=1;
            MemWrite=0;
            ResultSrc=1;
            Branch=0;
            ALUOp=2'b00;
        end
        Store:
        begin
             RegWrite=0;
             ImmSrc=2'b01;
             ALUSrc=1;
             MemWrite=1;
             Branch=0;
             ALUOp=2'b00;
        end
        R_Type: 
        begin
            RegWrite=1;
            ALUSrc=0;
            MemWrite=0;
            ResultSrc=0;
            Branch=0;
            ALUOp=2'b10;
        end
        I_Type: 
        begin
            RegWrite=1;
            ImmSrc=2'b00;
            ALUSrc=1;
            MemWrite=0;
            ResultSrc=0;
            Branch=0;  
        ALUOp=2'b10;
        end
        Branch_if: 
        begin
            RegWrite=0;
            ImmSrc=2'b10;
            ALUSrc=0;
            MemWrite=0;
            Branch=1;
            ALUOp=2'b01;
        end
        halt:
        load=0;
        default:
        begin
            RegWrite=0;
            ImmSrc=2'b00;
            ALUSrc=0;
            MemWrite=0;
            ResultSrc=0;
            Branch=0;
            ALUOp=2'b00; 
        end
    endcase

end

endmodule