`timescale 1ns/100ps

`include "PLA.v"
`include "FlipFlopD.v"

module ControlUnit (
    input [5:0] Op,
    input Clock,
    input reset,

    output PCWrite,
    output PCWriteCond,
    output IorD,
    output MemRead,
    output MemWrite,
    output IRWrite,
    output MemtoReg,
    output PCSource1,
    output PCSource0,
    output ALUOp1,
    output ALUOp0,
    output ALUSrcB1,
    output ALUSrcB0,
    output ALUSrcBA,
    output RegWrite,
    output RegDst
);

    wire [3:0] CurrentState;
    reg [3:0] CurrentStateReg;

    wire [3:0] CurrentStateNegated;
    wire [3:0] NextState;

    PLA plaUnit (.Op (Op), .CurrentState (CurrentState), .PCWrite (PCWrite), .PCWriteCond (PCWriteCond), .IorD (IorD), .MemRead (MemRead), .MemWrite (MemWrite), .IRWrite (IRWrite), .MemtoReg (MemtoReg), .PCSource1 (PCSource1), .PCSource0 (PCSource0), .ALUOp1 (ALUOp1), .ALUOp0 (ALUOp0), .ALUSrcB1 (ALUSrcB1), .ALUSrcB0 (ALUSrcB0), .ALUSrcBA (ALUSrcBA), .RegWrite (RegWrite), .RegDst (RegDst), .NS3 (NextState[3]), .NS2 (NextState[2]), .NS1 (NextState[1]), .NS0 (NextState[0]));
    flipflopD ff3 (.D (NextState[3]), .clock (Clock), .reset (reset), .Q (CurrentState[3]), .Qbar (CurrentStateNegated[3]));
    flipflopD ff2 (.D (NextState[2]), .clock (Clock), .reset (reset), .Q (CurrentState[2]), .Qbar (CurrentStateNegated[2]));
    flipflopD ff1 (.D (NextState[1]), .clock (Clock), .reset (reset), .Q (CurrentState[1]), .Qbar (CurrentStateNegated[1]));
    flipflopD ff0 (.D (NextState[0]), .clock (Clock), .reset (reset), .Q (CurrentState[0]), .Qbar (CurrentStateNegated[0]));
    

endmodule
