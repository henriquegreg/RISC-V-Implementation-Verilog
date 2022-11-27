`timescale 1ns/100ps
module testbench () ;
    reg [31:0] instruction;
    reg clock;
    reg reset;

    wire [15:0] out;
    ControlUnit UUT (.instruction(instruction), .reset(reset), .clock(clock), .PCWrite(PCWrite), .PCWriteCond(PCWriteCond), .IorD(IorD), .MemRead(MemRead), .MemWrite(MemWrite), .IRWrite(IRWrite), .MemtoReg(MemtoReg), .PCSource1(PCSource1), .PCSource0(PCSource0), .ALUOp1(ALUOp1), .ALUOp0(ALUOp0), .ALUSrcB1(ALUSrcB1), .ALUSrcB0(ALUSrcB0), .ALUSrcBA(ALUSrcBA), .RegWrite(RegWrite), .RegDst(RegDst), .curS3(curS3), .curS2(curS2), .curS1(curS1), .curS0(curS0), .curN3(curN3), .curN2(curN2), .curN1(curN1), .curN0(curN0));
    
    integer i, k, errors, j = 0;
    task Check ;
        input [0:15] xpect;
        if ({PCWrite,
    PCWriteCond,
    IorD,
    MemRead,
    MemWrite,
    IRWrite,
    MemtoReg,
    PCSource1,
    PCSource0,
    ALUOp1,
    ALUOp0,
    ALUSrcB1,
    ALUSrcB0,
    ALUSrcBA,
    RegWrite,
    RegDst
    } != xpect) begin
                $display ("Error : op = %b, instruction = %b, expect %b, got %b, PCWrite = %b, s3 = %b, s2 = %b, s1 = %b, s0 = %b, n3 = %b, n2 = %b, n1 = %b, n0 = %b",{instruction[5], instruction[4],
                    instruction[3], instruction[2],
                    instruction[1], instruction[0]}, instruction, xpect , {PCWrite,
    PCWriteCond,
    IorD,
    MemRead,
    MemWrite,
    IRWrite,
    MemtoReg,
    PCSource1,
    PCSource0,
    ALUOp1,
    ALUOp0,
    ALUSrcB1,
    ALUSrcB0,
    ALUSrcBA,
    RegWrite,
    RegDst
                }, PCWrite, curS3, curS2, curS1, curS0, curN3, curN2, curN1, curN0);
                errors = errors + 1;
        end
    endtask
        
    
        
        initial begin
            clock = 0;
            reset = 1'b1;
            #100
            reset = 1'b0;

            errors = 0;
            instruction = 32'b1110110000000000000000000000000;
            #10
            Check(20'b10010100101011000001);


            instruction = 32'b11011110000000000000000000110001;
            #10
            Check(20'b10010100101011000001);


            $display (" Test ended , %2d errors ", errors );
   
    end
    always #10 clock = ~clock;
endmodule