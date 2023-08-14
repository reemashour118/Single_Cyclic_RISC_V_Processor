`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/08/2023 12:34:18 AM
// Design Name: 
// Module Name: IFU_TB
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module IFU_TB (
);
reg PCSrc_TB;
reg [1:0] ImmSrc_TB;
reg [31:7] Instr_TB;
reg areset_TB,clk_TB,load_TB;
wire [31:0] ImmExt_TB, PC_TB;
IFU DUT(
.PCSrc_IF(PCSrc_TB),.ImmSrc_IF(ImmSrc_TB),.Instr(Instr_TB),
.areset_IF(areset_TB),.clk_IF(clk_TB),.load_IF(load_TB),
.ImmExt_IF(ImmExt_TB),.PC_IF(PC_TB)
);

parameter CLK_period=10;

initial begin
    clk_TB=0;
    forever begin
        #(CLK_period/2);
        clk_TB=~clk_TB;  
    end
end


initial begin
    PCSrc_TB=0;
    Instr_TB =0;
    load_TB=0;
    ImmSrc_TB=2'b00;
    areset_TB=1;
    #1
    areset_TB=0;
    #1
    areset_TB=1;
    @(negedge clk_TB)
    load_TB=1;
    repeat(10) @(negedge clk_TB);
    PCSrc_TB=1;
    ImmSrc_TB=2;
    Instr_TB =10;
    @(negedge clk_TB)
    $finish;
end   
endmodule
