module flipflopD(clock, D, Q, Qbar, reset);
    input clock, D, reset;
    output reg Q;
    output reg Qbar;

    initial begin
        Q = 1'b0;
    end
    always @(posedge clock, posedge reset) begin
        if(reset == 1'b1) Q = 1'b0;
        else begin
            Q = D;
            Qbar = ~D;
        end
    end
endmodule
