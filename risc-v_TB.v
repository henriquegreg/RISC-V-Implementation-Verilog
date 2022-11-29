`timescale 1ns/100ps

/* esta testbench serve para rodar o risc-v resetando ele, ou seja, reiniciando */
module testbench();
    reg reset;
    riscv UUT (.reset(reset));
    initial begin
        reset = 1'b0;
        #1
        reset = 1'b1;
        #1
        reset = 1'b0;


        #100000
        $finish;
    end
endmodule
