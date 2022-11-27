`timescale 1ns/100ps
module testbench () ;
    reg [5:0] Op;
    reg Clock;
    reg reset;

    wire [15:0] out;
    Control_Test UUT (.Op(Op), .Clock(Clock), .reset(reset), .PCWrite(PCWrite), .PCWriteCond(PCWriteCond), .IorD(IorD), .MemRead(MemRead), .MemWrite(MemWrite), .IRWrite(IRWrite), .MemtoReg(MemtoReg), .PCSource1(PCSource1), .PCSource0(PCSource0), .ALUOp1(ALUOp1), .ALUOp0(ALUOp0), .ALUSrcB1(ALUSrcB1), .ALUSrcB0(ALUSrcB0), .ALUSrcBA(ALUSrcBA), .RegWrite(RegWrite), .RegDst(RegDst));
    
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
                $display ("Error : op = %b, expect %b, got %b", Op, xpect , {PCWrite,
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
                });
                errors = errors + 1;
        end
    endtask
        
    
        
        initial begin
            Clock = 0;
            reset = 1'b1;
            #10
            reset = 1'b0;
        end

    always #10 Clock =~ Clock;

        



        initial begin
        errors = 0;
        Op = 6'b101011;
        #10
        Check(16'b1001010000001000);
        $display ("Error : op = %b got %b", Op, {PCWrite,PCWriteCond,
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
                });


        Op = 6'b110111;
        #10
        Check(20'b10010100000010000001);


        $display (" Test ended , %2d errors ", errors );
   
    end
endmodule