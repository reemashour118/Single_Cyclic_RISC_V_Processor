module Instruction_memory
# (
    parameter   INSTR_WIDTH= 32,
                ADDRESS_WIDTH = 32,
                LENGTH =  64,
                PROGRAM = "factorial.txt"
)(
    input [ADDRESS_WIDTH-1:0]Adress,
    output [INSTR_WIDTH-1:0] instruction
);
 reg [INSTR_WIDTH-1:0]  memory  [0:LENGTH-1];  

assign instruction = memory[Adress[31:2]];

initial begin
        $readmemh(PROGRAM, memory);
    end

endmodule