module Register_file #(
    parameter Adress_width =5,
                Data_width = 32
) (
    input [4:0] A1,A2,A3,
    input [31:0] WD3,
    input CLK , WE3,reset,
    output [31:0] RD1,RD2

);
    reg [31:0] REG_FILE[0:31];  /*storage element*/
    integer i;

    always @(posedge CLK or negedge reset) begin
        if (reset==0) begin
            for (i=0  ; i<=31; i=i+1) begin
                REG_FILE[i]<=0;
            end
        end
        else if (WE3==1) begin
            REG_FILE[A3]<=WD3;
        end
    end
    always @(*) begin
        RD1=REG_FILE[A1];        
        RD2=REG_FILE[A2];        
    end
    
endmodule 
