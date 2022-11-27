`timescale 1ns/100ps

module testbench ();
    reg [31:0] PC;
    wire [31:0] instruction;

    InstructionMemory UUT (.PC(PC), .instruction(instruction));

    integer i, errors = 0, j;
    task Check ;
        input [31:0] expect;
        if (instruction != expect) begin
                $display ("Error : PC: %d expect: %b got: %b", PC, expect, instruction);
                errors = errors + 1;
        end
    endtask

    initial begin
        
        PC = 32'd0;
        #10
        Check(32'b01000000000000000000000000110011);
        #10

        PC = 32'd1;
        #10
        Check(32'b00000000000000000010000010000011);
        #10

        PC = 32'd2;
        #10
        Check(32'b00000000000000000000000001100011);
        #10

        // nao precisa testar tudo, demora demais, depois muda para as instrucoes do ep
        for (j = 32'd3; j < 32'b00000000000000000000000011111111; j = j + 32'd1) begin
            PC = j;
            #10
            Check(32'b00000000000000000000000000000000);
        end

        $display("Test finished. Erros: %d", errors);
    end
endmodule