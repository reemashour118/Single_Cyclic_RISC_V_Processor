module PC_Register (
    PC_next,areset,clk,load,PC
);
    input [31:0]PC_next;
    input areset,clk,load;
    output [31:0]PC;


    always @(posedge clk or negedge areset ) begin
        if (areset==0) begin
            PC<=0;
        end else begin
            if (load==1) begin
               PC<=PC_next;
            
            end
        end

    end
 


endmodule