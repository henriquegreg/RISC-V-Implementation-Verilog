`timescale 1ns/100ps

module ControlUnit (
    input [6:0] Op,
    output RegDst,
    output ALUSrc,
    output MemToReg,
    output RegWrite,
    output MemRead,
    output MemWrite,
    output Branch,
    output ALUOp1,
    output ALUOp0
);
    wire A;
    wire B;
    wire C;
    wire D;

    wire [6:0] OpNegated = ~Op;
    // 0
    and (A, OpNegated[6],Op[5], Op[4], OpNegated[3], OpNegated[2], Op[1], Op[0]);
    // 1
    and (B, OpNegated[6], OpNegated[5], OpNegated[4], OpNegated[3], OpNegated[2], Op[1], Op[0]);
    //0
    and (C, OpNegated[6], Op[5], OpNegated[4], OpNegated[3], OpNegated[2], Op[1], Op[0]);
    //0
    and (D, Op[6], Op[5], OpNegated[4], OpNegated[3], OpNegated[2], Op[1], Op[0]);

    assign RegDst = A;
    or (ALUSrc, B, C);
    assign MemToReg = B;
    or (RegWrite, A, B);
    assign MemRead = B;
    assign MemWrite = C;
    assign Branch = D;
    assign ALUOp1 = A;
    assign ALUOp0 = D;
endmodule