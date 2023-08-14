module Register_file_TB (
);
    reg [4:0] A1_TB,A2_TB,A3_TB;
    reg [31:0] WD3_TB;
    reg CLK_TB,WE3_TB,reset_TB;
    wire [31:0] RD1_TB,RD2_TB;
    
    
    parameter CLK_PERIOD = 10;
    always begin
        #(CLK_PERIOD/2)
        CLK_TB=~CLK_TB;
    end
Register_file DUT (
    .A1(A1_TB),
    .A2(A2_TB),
    .A3(A3_TB),
    .WD3(WD3_TB),
    .CLK(CLK_TB),
    .WE3(WE3_TB),
    .reset(reset_TB),
    .RD1(RD1_TB),
    .RD2(RD2_TB)
);


    initial begin
        CLK_TB=0;
        A1_TB=0;
        A2_TB=0;
        A3_TB=0;
        WD3_TB=0;
        WE3_TB=0;
        reset_TB=1;
        #(CLK_PERIOD)
        reset_TB=0;
        #(CLK_PERIOD)
        reset_TB=1;
        @(negedge CLK_TB)
        
        /*read operation*/
        A1_TB=1;
        A2_TB=0;
        @(negedge CLK_TB)

        /* write operation*/
        A3_TB=0;
        WD3_TB=5;
        WE3_TB=1;
        @(negedge CLK_TB)
        A3_TB=1;
        WD3_TB=4;
        @(negedge CLK_TB)
        #20
        $finish;

    end
endmodule