`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/08/2023 12:10:57 AM
// Design Name: 
// Module Name: Extender
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


module Extender (
    input [1:0]ImmSrc,
    input [31:7]INPUT,
    output reg [31:0] ImmExt
);
localparam I_Type =2'b00,
           S_Type =2'b01,
           B_Type =2'b10;
 always @(*) begin
    case (ImmSrc)
        I_Type:ImmExt={{ 20{INPUT[31] }},INPUT[31:20]};
        S_Type:ImmExt={{ 20{INPUT[31] }},INPUT[31:25],INPUT[11:7]};
        B_Type:ImmExt={{ 20{INPUT[31] }},INPUT[7],INPUT[30:25],INPUT[11:8],1'b0};
         default: ImmExt=0;
       
    endcase
 end   
endmodule