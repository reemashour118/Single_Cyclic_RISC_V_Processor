module TOP_TB (
    
);
reg CLK_TOP,Reset_TOP;
TOP_module DUT (
.CLK_TOP(CLK_TOP),.Reset_TOP(Reset_TOP)

);
localparam CLK_Period = 10;

always begin
    #(CLK_Period/2)
CLK_TOP=~CLK_TOP;
end

task reset();
begin
    Reset_TOP=1;
   #1
    Reset_TOP =0;
   #1
    Reset_TOP =1;
   end
endtask

initial begin
   CLK_TOP=0;
   reset ();
end   
endmodule