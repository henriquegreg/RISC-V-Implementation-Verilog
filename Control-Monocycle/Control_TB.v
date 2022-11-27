`timescale 1ns/100ps

module testbench ();
    reg [6:0] Op;
    
    ControlUnit UUT (.Op(Op), .RegDst(RegDst), .ALUSrc(ALUSrc), .MemToReg(MemToReg), .RegWrite(RegWrite), .MemRead(MemRead), .MemWrite(MemWrite), .Branch(Branch), .ALUOp1(ALUOp1), .ALUOp0(ALUOp0));

    integer i, errors = 0;
    task Check ;
        input [8:0] expect;
        if ({RegDst, ALUSrc, MemToReg, RegWrite, MemRead, MemWrite, Branch, ALUOp1, ALUOp0} != expect) begin
                $display ("Error : Op: %b expect: %b got: %b", Op, expect, {RegDst, ALUSrc, MemToReg, RegWrite, MemRead, MemWrite, Branch, ALUOp1, ALUOp0});
                errors = errors + 1;
        end
    endtask

    initial begin
        
        Op = 7'b0110011;
        #100
        Check(9'b100100010);
        #100

        Op = 7'b0000011;
        #100
        Check(9'b011110000);
        #100
        
        
        Op = 7'b0100011;
        #100
        Check(9'b01?001000);
        #100

        Op = 7'b1100011;
        #100
        Check(9'b00?000101);

        $display("Test finished. Erros: %d", errors);
    end
endmodule