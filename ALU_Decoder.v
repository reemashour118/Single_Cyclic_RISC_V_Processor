
module ALU_Decoder (
    input [1:0] ALUOP, 
    input [2:0]Funct3, 
    input Op5,
    input Funct7,
    output reg [2:0] ALUcontrol
);
 wire [6:0]sel={ALUOP,Funct3,Op5,Funct7};

 localparam [2:0]   ADD = 3'b000,
                    SUB = 3'b010,
                    SHL = 3'b001,
                    XOR = 3'b100,
                    SHR = 3'b101,
                    OR = 3'b110,
                    AND = 3'b111,
                    Default = 3'b000;
                    
 always @(*) begin
casex (sel)
    7'b00_???_??, 7'b10_000_00, 7'b10_000_01, 7'b10_000_10: ALUcontrol =ADD;
    7'b01_000_??, 7'b01_001_??, 7'b01_100_??, 7'b10_000_11: ALUcontrol =SUB;
    7'b10_001_??: ALUcontrol =SHL;
    7'b10_101_??: ALUcontrol =SHR;
    7'b10_100_??: ALUcontrol =XOR;
    7'b10_110_??: ALUcontrol =OR;
    7'b10_111_??: ALUcontrol =AND;
    default: ALUcontrol =Default;
endcase
 end
endmodule