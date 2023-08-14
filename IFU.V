`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/08/2023 12:06:20 AM
// Design Name: 
// Module Name: IFU
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


module IFU (
    input PCSrc_IF,
    input [1:0] ImmSrc_IF,
    input [31:7] Instr,
    // input [31:0]immExt_IF,PC_IF,      //input????
    input areset_IF,clk_IF,load_IF,
    output [31:0]ImmExt_IF,PC_IF
);
  wire [31:0] PC_Next_IF; 
  

PC_Next U1(
.PCSrc(PCSrc_IF),
.immExt(ImmExt_IF),
.PC(PC_IF),
.PC_next(PC_Next_IF)
);

PC_Register U2(
.areset(areset_IF),
.clk(clk_IF),
.load(load_IF),
.PC_next(PC_Next_IF),
.PC(PC_IF)
);
Extender U3(
.ImmSrc(ImmSrc_IF),
.INPUT(Instr),
.ImmExt(ImmExt_IF)
);

endmodule
