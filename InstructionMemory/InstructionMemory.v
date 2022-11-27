`timescale 1ns/100ps

module InstructionMemory(
    input [31:0] PC,
    output [31:0] instruction
);
    reg [31:0] Memory [64:0];

    integer i;

    initial begin
        /* seta posição 0x5 (registrador) como 0xC (memória) */
        Memory[0] = 32'b00000000110000000010001010000011;
        /* seta register 0x1 como o número aleatório gerado (0x0 da memória) */
        Memory
        for (i = 0; i < 32; i = i + 1) begin
            Memory[i] = 32'b0;
        end
    end
    
    assign instruction = Memory[PC];
endmodule