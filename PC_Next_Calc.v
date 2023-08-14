module PC_Next (
    PCSrc,immExt,PC_next,PC
);
 input PCSrc;
 input [31:0]  immExt,PC;
 output [31:0] PC_next;
 always @(*) begin
    if (PCSrc==0) begin
        PC_next=PC+4;
    end else begin
        PC_next=PC+immExt;
    end
 end
endmodule