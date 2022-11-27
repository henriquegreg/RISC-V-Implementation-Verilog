`timescale 1ns/100ps

module testbench ();
    reg [31:0] A;
    reg [31:0] B;
    reg select;
    wire [31:0] result;

    mux UUT (.A(A), .B(B), .select(select), .result(result));

    integer errors = 0;

    task Check;
        input [31:0] expect;
        
        if (result != expect) begin
                $display ("Error : select: %d expect: %b got: %b", select, expect, result);
                errors = errors + 1;
        end
    endtask

    initial begin
        A = 32'd100;
        B = 32'd10;
        select = 1'b1;
        #10
        Check(32'd100);
        select = 1'b0;
        #10
        Check(32'd10);

        $display("Test finished. Erros: %d", errors);
    end

    
endmodule