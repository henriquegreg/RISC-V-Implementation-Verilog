`timescale 1ns/100ps
module testbench () ;
    reg D;
    reg clock;
    reg reset;

    wire Q;
    wire Qbar;
    

    flipflopD UUT (.D(D), .clock(clock), .reset(reset), .Q(Q), .Qbar(Qbar));

    integer i, k, errors;
    task Check ;
        input xpect;
        if (Q != xpect) begin
                $display ("Error : D = %b, expect %b, got %b, reset = %b, Qbar = %b", D, D, Q, reset, Qbar);
                errors = errors + 1;
        end
    endtask

        initial clock = 0;
        always #10 clock =~ clock;


        initial begin
        errors = 0;
        reset = 0;
        
        D = 1'b1;
        #100
        Check(1'b1);
        $display ("Info: D = %b, expect %b, got %b, reset = %b, Qbar = %b", D, D, Q, reset, Qbar);


        D = 1'b0;
        $display ("Info: D = %b, expect %b, got %b, reset = %b, Qbar = %b", D, D, Q, reset, Qbar);

        D = 1'b1;
        #100
        Check(1'b1);
        $display ("Info: D = %b, expect %b, got %b, reset = %b, Qbar = %b", D, D, Q, reset, Qbar);



        D = 1'b0;
        #100
        Check(1'b0);
        $display ("Info: D = %b, expect %b, got %b, reset = %b, Qbar = %b", D, D, Q, reset, Qbar);


        $display (" Test ended , %2d errors ", errors );
    end
endmodule