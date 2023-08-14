`timescale 1ns/1ps
module ALU_TB ();

reg [31:0]SrcA_TB, SrcB_TB;
reg [2:0]ALUControl_TB ;
wire [31:0]ALUResult_TB;
wire Zero_TB, sign_flag_TB;

ALU ALU_DUT(    .SrcA(SrcA_TB),
                .SrcB(SrcB_TB),
                .ALUControl(ALUControl_TB),
                .Zero(Zero_TB),
                .sign_flag(sign_flag_TB),
                .ALUResult(ALUResult_TB)
);


initial begin
    $monitor("ALUResult_TB = %d, Zero_TB = %d,  sign_flag_TB = %d, time = %d", ALUResult_TB, Zero_TB, sign_flag_TB, $time );

    SrcA_TB = 5;
    SrcB_TB = 15;
    ALUControl_TB = 0;
    #5  
    SrcA_TB = 5;
    SrcB_TB = 5;
    ALUControl_TB = 2;
#5  ALUControl_TB = 3;
    ALUControl_TB = 1;
    #20
    $finish;

end

endmodule