`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/05/2023 10:51:30 PM
// Design Name: 
// Module Name: Data_memory
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


module Data_memory #(
    parameter Data_Mem_width =32,
    parameter Data_Mem_length =64
)(
    input [Data_Mem_width-1:0] A,
    input [Data_Mem_width-1:0] WD,
    input WE,CLK,
    output reg [Data_Mem_width-1:0]RD

);
    reg[Data_Mem_width-1:0] Data_Mem[0:Data_Mem_length-1];
        always @(posedge CLK ) begin
            if(WE==1)
            Data_Mem[A[Data_Mem_width-1:2]]<=WD;

    end
    
    always @(*) begin
        RD=Data_Mem [A[Data_Mem_width-1:2]] ;
    end

endmodule

// NO need to else in comabainational always as it does not have enable signal

