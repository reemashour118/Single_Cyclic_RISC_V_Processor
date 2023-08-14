module Data_Memry_TB ( 
);
 parameter Data_Mem_width_TB =32;
 parameter Data_Mem_length_TB =64;
 reg [Data_Mem_width_TB-1:0] A_TB;
 reg [Data_Mem_width_TB-1:0] WD_TB;
 reg WE_TB;
 reg CLK_TB;
 wire [Data_Mem_width_TB-1:0]RD_TB;

Data_memory #(
    .Data_Mem_width(Data_Mem_width_TB),
    .Data_Mem_length(Data_Mem_length_TB)
)
DUT(
.A(A_TB), .WD(WD_TB),.WE(WE_TB),.CLK(CLK_TB),
.RD(RD_TB)
);
parameter CLK_period=10;
always  begin
    # (CLK_period/2)
    CLK_TB=~CLK_TB;

end
initial begin
CLK_TB=0;  
A_TB=0;
WD_TB=0;
WE_TB=0;
# (negedge CLK_TB)
A_TB= 4;
WE_TB=1;
WD_TB =22;
# (negedge CLK_TB)
A_TB=4;
WE_TB=0;
# (negedge CLK_TB)
$finish;
end
   
endmodule