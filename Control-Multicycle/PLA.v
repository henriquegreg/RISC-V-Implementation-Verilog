module PLA (
    input [5:0] Op,
    input [3:0] CurrentState,

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
    output RegDst,
    output NS3,
    output NS2,
    output NS1,
    output NS0
);
    wire [5:0] OpNegated = ~Op;
    wire [3:0] CurrentStateNegated = ~CurrentState;

    // wires verticais
    wire A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q;

    and (A, CurrentStateNegated[3], CurrentStateNegated[2], CurrentStateNegated[1], CurrentStateNegated[0]);
    and (B, CurrentStateNegated[3], CurrentStateNegated[2], CurrentStateNegated[1], CurrentState[0]);
    and (C, CurrentStateNegated[3], CurrentStateNegated[2], CurrentState[1], CurrentStateNegated[0]);
    and (D, CurrentStateNegated[3], CurrentStateNegated[2], CurrentState[1], CurrentState[0]);
    and (E, CurrentStateNegated[3], CurrentState[2], CurrentStateNegated[1], CurrentStateNegated[0]);
    and (F, CurrentStateNegated[3], CurrentState[2], CurrentStateNegated[1], CurrentState[0]);
    and (G, CurrentStateNegated[3], CurrentState[2], CurrentState[1], CurrentStateNegated[0]);
    and (H, CurrentStateNegated[3], CurrentState[2], CurrentState[1], CurrentState[0]);
    and (I, CurrentState[3], CurrentStateNegated[2], CurrentStateNegated[1], CurrentStateNegated[0]);
    and (J, CurrentState[3], CurrentStateNegated[2], CurrentStateNegated[1], CurrentState[0]);
    // and (K, B, OpNegated[5], OpNegated[4], OpNegated[3], OpNegated[2], Op[1], OpNegated[0]);
    // and (L, B, OpNegated[5], OpNegated[4], OpNegated[3], Op[2], OpNegated[1], OpNegated[0]);
    // and (M, B, OpNegated[5], OpNegated[4], OpNegated[3], OpNegated[2], OpNegated[1], OpNegated[0]);
    // and (N, C, Op[5], OpNegated[4], Op[3], OpNegated[2], Op[1], Op[0]);
    // and (O, B, Op[5], OpNegated[4], OpNegated[3], OpNegated[2], Op[1], Op[0]);
    // and (P, B, Op[5], OpNegated[4], Op[3], OpNegated[2], Op[1], Op[0]);
    and (Q, C, Op[5], OpNegated[4], OpNegated[3], OpNegated[2], Op[1], Op[0]);
    
    
    
    
    and (R, B, OpNegated[5], Op[4], OpNegated[3], Op[2], Op[1], Op[0]);
    and (S, B, Op[5], OpNegated[4], Op[3], Op[2], Op[1], Op[0]);
    and (T, C, Op[5], OpNegated[4], OpNegated[3], OpNegated[2], Op[1], Op[0]);
    and (U, B, Op[5], Op[4], OpNegated[3], OpNegated[2], Op[1], Op[0]);
    and (V, B, OpNegated[5], OpNegated[4], OpNegated[3], OpNegated[2], Op[1], Op[0]);
    and (W, C, OpNegated[5], OpNegated[4], OpNegated[3], OpNegated[2], Op[1], Op[0]);
    and (Xa, B, Op[5], Op[4], OpNegated[3], OpNegated[2], Op[1], Op[0]);
    and (Y, B, OpNegated[5], Op[4], OpNegated[3], Op[2], Op[1], Op[0]);
    and (Za, B, Op[5], OpNegated[4], Op[3], Op[2], Op[1], Op[0]);
    and (A1, C, OpNegated[5], OpNegated[4], OpNegated[3], OpNegated[2], Op[1], Op[0]);

    or (PCWrite, A, J);
    assign PCWriteCond = I;
    or (IorD, D, F);
    or (MemRead, A, D);
    or (MemWrite, F);
    or (IRWrite, A);
    assign MemtoReg = E;
    or (PCSource1, J);
    or (PCSource0, I);
    or (ALUOp1, G);
    or (ALUOp0, I);
    or (ALUSrcB1, B, C);
    or (ALUSrcB0, A, B);
    or (ALUSrcBA, C, G, I);
    or (RegWrite, E, H);
    or (RegDst, H);
    or (NS3, R, S);
    or (NS2, D, G, T, U);
    or (NS1, G, O, V, W, X);
    or (NS0, A, G, Q, Y, Z, A1);
endmodule