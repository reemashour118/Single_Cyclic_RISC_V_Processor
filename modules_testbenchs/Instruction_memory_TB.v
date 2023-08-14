module Instruction_memory_TB();


    parameter INSTR_WIDTH_TB= 32;
    parameter ADDRESS_WIDTH_TB = 32;
    parameter LENGTH_TB=  64;
    parameter PROGRAM_TB = "factorial.txt";

    reg [ADDRESS_WIDTH_TB-1:0]Adress_TB;
    wire [INSTR_WIDTH_TB-1:0] instruction_TB;

   
    Instruction_Memory #( 
    .INSTR_WIDTH(INSTR_WIDTH_TB),
    .ADDRESS_WIDTH(INSTR_WIDTH_TB),
    .LENGTH(LENGTH_TB),
    .PROGRAM(PROGRAM_TB))
     DUT(
        .Adress(Adress_TB),
        .instruction(instruction_TB)
    );

    initial begin
        $readmemh(PROGRAM_TB, DUT.memory);
        // acess variable in module by (module name.variable)
        Adress_TB = 0;
        #5
        Adress_TB = 4;
        #5
        Adress_TB = 8;
        #5
        $finish;
    end
endmodule