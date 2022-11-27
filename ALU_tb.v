`timescale 1ns/100ps

module testbench ();
    reg [31:0] A;
    reg [31:0] B;
    reg [3:0] ALUOp;

    wire [31:0] result;
    
    ALU UUT (.A(A), .B(B), .ALUOp(ALUOp), .result(result), .zero(zero));

    integer i, errors = 0;
    task Check ;
        input [31:0] expect;
        if (result != expect) begin
                $display ("Error : A: %b B: %b expect: %b got: %b", A, B, expect, result);
                errors = errors + 1;
        end
    endtask

    initial begin
        
        A = 32'd10;
        B = 32'd10;
        ALUOp = 4'b0010;
        #100
        Check(32'd20);

        A = 32'd30;
        B = 32'd10;
        ALUOp = 4'b0010;
        #100
        Check(32'd40);

        A = 32'd30;
        B = 32'd10;
        ALUOp = 4'b0110;
        #100
        Check(32'd20);

        A = 32'b0000000000111111111100;
        B = 32'b0000000000000000000111;
        ALUOp = 4'b0000;
        #100
        Check(32'b0000000000000000000100);

        A = 32'b0000000000111111111100;
        B = 32'b0000000000000000000111;
        ALUOp = 4'b0001;
        #100
        Check(32'b0000000000111111111111);

        $display("Test finished. Erros: %d", errors);
    end
endmodule