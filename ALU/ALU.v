`include "./operations/and.v"
`include "./operations/sub.v"
`include "./operations/sum.v"
`include "./operations/or.v"

module ALU (
    input [31:0] A,
    input [31:0] B,
    input [3:0] ALUOp,
    output [31:0] result,
    output zero
);
    wire [31:0] resAdd;
    wire overflowAdd;
    wire [31:0] resSub;
    wire overflowSub;
    wire [31:0] resAnd;
    wire [31:0] resOr;

    wire [3:0] and0;
    wire [3:0] and1;
    wire [3:0] and2;
    wire [3:0] and3;
    wire [3:0] and4;
    wire [3:0] and5;
    wire [3:0] and6;
    wire [3:0] and7;
    wire [3:0] and8;
    wire [3:0] and9;
    wire [3:0] and10;
    wire [3:0] and11;
    wire [3:0] and12;
    wire [3:0] and13;
    wire [3:0] and14;
    wire [3:0] and15;
    wire [3:0] and16;
    wire [3:0] and17;
    wire [3:0] and18;
    wire [3:0] and19;
    wire [3:0] and20;
    wire [3:0] and21;
    wire [3:0] and22;
    wire [3:0] and23;
    wire [3:0] and24;
    wire [3:0] and25;
    wire [3:0] and26;
    wire [3:0] and27;
    wire [3:0] and28;
    wire [3:0] and29;
    wire [3:0] and30;
    wire [3:0] and31;

    
    /* Aqui sao calculados a soma, a subtracao, o and e o or bitwise */
    sumALU adder (.A(A), .B(B), .result(resAdd), .Cout(overflowAdd));
    sub subtract (.A(A), .B(B), .result(resSub), .Cout(overflowSub));
    andModule andmod (.A(A), .B(B), .result(resAnd));
    orModule ormod (.A(A), .B(B), .result(resOr));
    
    /* De acordo com o ALUOp, e selecionado o resultado entre os 4 anteriores em um mux.
       Esse mux foi feito na forma estrutural
    */
    and (and0[0], resAdd[0], ~ALUOp[3], ~ALUOp[2], ALUOp[1], ~ALUOp[0]);
    and (and0[1], resSub[0], ~ALUOp[3], ALUOp[2], ALUOp[1], ~ALUOp[0]);
    and (and0[2], resAnd[0], ~ALUOp[3], ~ALUOp[2], ~ALUOp[1], ~ALUOp[0]);
    and (and0[3], resOr[0], ~ALUOp[3], ~ALUOp[2], ~ALUOp[1], ALUOp[0]);

    and (and1[0], resAdd[1], ~ALUOp[3], ~ALUOp[2], ALUOp[1], ~ALUOp[0]);
    and (and1[1], resSub[1], ~ALUOp[3], ALUOp[2], ALUOp[1], ~ALUOp[0]);
    and (and1[2], resAnd[1], ~ALUOp[3], ~ALUOp[2], ~ALUOp[1], ~ALUOp[0]);
    and (and1[3], resOr[1], ~ALUOp[3], ~ALUOp[2], ~ALUOp[1], ALUOp[0]);
    
    and (and2[0], resAdd[2], ~ALUOp[3], ~ALUOp[2], ALUOp[1], ~ALUOp[0]);
    and (and2[1], resSub[2], ~ALUOp[3], ALUOp[2], ALUOp[1], ~ALUOp[0]);
    and (and2[2], resAnd[2], ~ALUOp[3], ~ALUOp[2], ~ALUOp[1], ~ALUOp[0]);
    and (and2[3], resOr[2], ~ALUOp[3], ~ALUOp[2], ~ALUOp[1], ALUOp[0]);

    and (and3[0], resAdd[3], ~ALUOp[3], ~ALUOp[2], ALUOp[1], ~ALUOp[0]);
    and (and3[1], resSub[3], ~ALUOp[3], ALUOp[2], ALUOp[1], ~ALUOp[0]);
    and (and3[2], resAnd[3], ~ALUOp[3], ~ALUOp[2], ~ALUOp[1], ~ALUOp[0]);
    and (and3[3], resOr[3], ~ALUOp[3], ~ALUOp[2], ~ALUOp[1], ALUOp[0]);

    and (and4[0], resAdd[4], ~ALUOp[3], ~ALUOp[2], ALUOp[1], ~ALUOp[0]);
    and (and4[1], resSub[4], ~ALUOp[3], ALUOp[2], ALUOp[1], ~ALUOp[0]);
    and (and4[2], resAnd[4], ~ALUOp[3], ~ALUOp[2], ~ALUOp[1], ~ALUOp[0]);
    and (and4[3], resOr[4], ~ALUOp[3], ~ALUOp[2], ~ALUOp[1], ALUOp[0]);

    and (and5[0], resAdd[5], ~ALUOp[3], ~ALUOp[2], ALUOp[1], ~ALUOp[0]);
    and (and5[1], resSub[5], ~ALUOp[3], ALUOp[2], ALUOp[1], ~ALUOp[0]);
    and (and5[2], resAnd[5], ~ALUOp[3], ~ALUOp[2], ~ALUOp[1], ~ALUOp[0]);
    and (and5[3], resOr[5], ~ALUOp[3], ~ALUOp[2], ~ALUOp[1], ALUOp[0]);

    and (and6[0], resAdd[6], ~ALUOp[3], ~ALUOp[2], ALUOp[1], ~ALUOp[0]);
    and (and6[1], resSub[6], ~ALUOp[3], ALUOp[2], ALUOp[1], ~ALUOp[0]);
    and (and6[2], resAnd[6], ~ALUOp[3], ~ALUOp[2], ~ALUOp[1], ~ALUOp[0]);
    and (and6[3], resOr[6], ~ALUOp[3], ~ALUOp[2], ~ALUOp[1], ALUOp[0]);

    and (and7[0], resAdd[7], ~ALUOp[3], ~ALUOp[2], ALUOp[1], ~ALUOp[0]);
    and (and7[1], resSub[7], ~ALUOp[3], ALUOp[2], ALUOp[1], ~ALUOp[0]);
    and (and7[2], resAnd[7], ~ALUOp[3], ~ALUOp[2], ~ALUOp[1], ~ALUOp[0]);
    and (and7[3], resOr[7], ~ALUOp[3], ~ALUOp[2], ~ALUOp[1], ALUOp[0]);


    and (and8[0], resAdd[8], ~ALUOp[3], ~ALUOp[2], ALUOp[1], ~ALUOp[0]);
    and (and8[1], resSub[8], ~ALUOp[3], ALUOp[2], ALUOp[1], ~ALUOp[0]);
    and (and8[2], resAnd[8], ~ALUOp[3], ~ALUOp[2], ~ALUOp[1], ~ALUOp[0]);
    and (and8[3], resOr[8], ~ALUOp[3], ~ALUOp[2], ~ALUOp[1], ALUOp[0]);

    and (and9[0], resAdd[9], ~ALUOp[3], ~ALUOp[2], ALUOp[1], ~ALUOp[0]);
    and (and9[1], resSub[9], ~ALUOp[3], ALUOp[2], ALUOp[1], ~ALUOp[0]);
    and (and9[2], resAnd[9], ~ALUOp[3], ~ALUOp[2], ~ALUOp[1], ~ALUOp[0]);
    and (and9[3], resOr[9], ~ALUOp[3], ~ALUOp[2], ~ALUOp[1], ALUOp[0]);

    and (and10[0], resAdd[10], ~ALUOp[3], ~ALUOp[2], ALUOp[1], ~ALUOp[0]);
    and (and10[1], resSub[10], ~ALUOp[3], ALUOp[2], ALUOp[1], ~ALUOp[0]);
    and (and10[2], resAnd[10], ~ALUOp[3], ~ALUOp[2], ~ALUOp[1], ~ALUOp[0]);
    and (and10[3], resOr[10], ~ALUOp[3], ~ALUOp[2], ~ALUOp[1], ALUOp[0]);

    and (and11[0], resAdd[11], ~ALUOp[3], ~ALUOp[2], ALUOp[1], ~ALUOp[0]);
    and (and11[1], resSub[11], ~ALUOp[3], ALUOp[2], ALUOp[1], ~ALUOp[0]);
    and (and11[2], resAnd[11], ~ALUOp[3], ~ALUOp[2], ~ALUOp[1], ~ALUOp[0]);
    and (and11[3], resOr[11], ~ALUOp[3], ~ALUOp[2], ~ALUOp[1], ALUOp[0]);

    and (and12[0], resAdd[12], ~ALUOp[3], ~ALUOp[2], ALUOp[1], ~ALUOp[0]);
    and (and12[1], resSub[12], ~ALUOp[3], ALUOp[2], ALUOp[1], ~ALUOp[0]);
    and (and12[2], resAnd[12], ~ALUOp[3], ~ALUOp[2], ~ALUOp[1], ~ALUOp[0]);
    and (and12[3], resOr[12], ~ALUOp[3], ~ALUOp[2], ~ALUOp[1], ALUOp[0]);

    and (and13[0], resAdd[13], ~ALUOp[3], ~ALUOp[2], ALUOp[1], ~ALUOp[0]);
    and (and13[1], resSub[13], ~ALUOp[3], ALUOp[2], ALUOp[1], ~ALUOp[0]);
    and (and13[2], resAnd[13], ~ALUOp[3], ~ALUOp[2], ~ALUOp[1], ~ALUOp[0]);
    and (and13[3], resOr[13], ~ALUOp[3], ~ALUOp[2], ~ALUOp[1], ALUOp[0]);

    and (and14[0], resAdd[14], ~ALUOp[3], ~ALUOp[2], ALUOp[1], ~ALUOp[0]);
    and (and14[1], resSub[14], ~ALUOp[3], ALUOp[2], ALUOp[1], ~ALUOp[0]);
    and (and14[2], resAnd[14], ~ALUOp[3], ~ALUOp[2], ~ALUOp[1], ~ALUOp[0]);
    and (and14[3], resOr[14], ~ALUOp[3], ~ALUOp[2], ~ALUOp[1], ALUOp[0]);

    and (and15[0], resAdd[15], ~ALUOp[3], ~ALUOp[2], ALUOp[1], ~ALUOp[0]);
    and (and15[1], resSub[15], ~ALUOp[3], ALUOp[2], ALUOp[1], ~ALUOp[0]);
    and (and15[2], resAnd[15], ~ALUOp[3], ~ALUOp[2], ~ALUOp[1], ~ALUOp[0]);
    and (and15[3], resOr[15], ~ALUOp[3], ~ALUOp[2], ~ALUOp[1], ALUOp[0]);

    and (and16[0], resAdd[16], ~ALUOp[3], ~ALUOp[2], ALUOp[1], ~ALUOp[0]);
    and (and16[1], resSub[16], ~ALUOp[3], ALUOp[2], ALUOp[1], ~ALUOp[0]);
    and (and16[2], resAnd[16], ~ALUOp[3], ~ALUOp[2], ~ALUOp[1], ~ALUOp[0]);
    and (and16[3], resOr[16], ~ALUOp[3], ~ALUOp[2], ~ALUOp[1], ALUOp[0]);

    and (and17[0], resAdd[17], ~ALUOp[3], ~ALUOp[2], ALUOp[1], ~ALUOp[0]);
    and (and17[1], resSub[17], ~ALUOp[3], ALUOp[2], ALUOp[1], ~ALUOp[0]);
    and (and17[2], resAnd[17], ~ALUOp[3], ~ALUOp[2], ~ALUOp[1], ~ALUOp[0]);
    and (and17[3], resOr[17], ~ALUOp[3], ~ALUOp[2], ~ALUOp[1], ALUOp[0]);

    and (and18[0], resAdd[18], ~ALUOp[3], ~ALUOp[2], ALUOp[1], ~ALUOp[0]);
    and (and18[1], resSub[18], ~ALUOp[3], ALUOp[2], ALUOp[1], ~ALUOp[0]);
    and (and18[2], resAnd[18], ~ALUOp[3], ~ALUOp[2], ~ALUOp[1], ~ALUOp[0]);
    and (and18[3], resOr[18], ~ALUOp[3], ~ALUOp[2], ~ALUOp[1], ALUOp[0]);

    and (and19[0], resAdd[19], ~ALUOp[3], ~ALUOp[2], ALUOp[1], ~ALUOp[0]);
    and (and19[1], resSub[19], ~ALUOp[3], ALUOp[2], ALUOp[1], ~ALUOp[0]);
    and (and19[2], resAnd[19], ~ALUOp[3], ~ALUOp[2], ~ALUOp[1], ~ALUOp[0]);
    and (and19[3], resOr[19], ~ALUOp[3], ~ALUOp[2], ~ALUOp[1], ALUOp[0]);

    and (and20[0], resAdd[20], ~ALUOp[3], ~ALUOp[2], ALUOp[1], ~ALUOp[0]);
    and (and20[1], resSub[20], ~ALUOp[3], ALUOp[2], ALUOp[1], ~ALUOp[0]);
    and (and20[2], resAnd[20], ~ALUOp[3], ~ALUOp[2], ~ALUOp[1], ~ALUOp[0]);
    and (and20[3], resOr[20], ~ALUOp[3], ~ALUOp[2], ~ALUOp[1], ALUOp[0]);

    and (and21[0], resAdd[21], ~ALUOp[3], ~ALUOp[2], ALUOp[1], ~ALUOp[0]);
    and (and21[1], resSub[21], ~ALUOp[3], ALUOp[2], ALUOp[1], ~ALUOp[0]);
    and (and21[2], resAnd[21], ~ALUOp[3], ~ALUOp[2], ~ALUOp[1], ~ALUOp[0]);
    and (and21[3], resOr[21], ~ALUOp[3], ~ALUOp[2], ~ALUOp[1], ALUOp[0]);

    and (and22[0], resAdd[22], ~ALUOp[3], ~ALUOp[2], ALUOp[1], ~ALUOp[0]);
    and (and22[1], resSub[22], ~ALUOp[3], ALUOp[2], ALUOp[1], ~ALUOp[0]);
    and (and22[2], resAnd[22], ~ALUOp[3], ~ALUOp[2], ~ALUOp[1], ~ALUOp[0]);
    and (and22[3], resOr[22], ~ALUOp[3], ~ALUOp[2], ~ALUOp[1], ALUOp[0]);

    and (and23[0], resAdd[23], ~ALUOp[3], ~ALUOp[2], ALUOp[1], ~ALUOp[0]);
    and (and23[1], resSub[23], ~ALUOp[3], ALUOp[2], ALUOp[1], ~ALUOp[0]);
    and (and23[2], resAnd[23], ~ALUOp[3], ~ALUOp[2], ~ALUOp[1], ~ALUOp[0]);
    and (and23[3], resOr[23], ~ALUOp[3], ~ALUOp[2], ~ALUOp[1], ALUOp[0]);

    and (and24[0], resAdd[24], ~ALUOp[3], ~ALUOp[2], ALUOp[1], ~ALUOp[0]);
    and (and24[1], resSub[24], ~ALUOp[3], ALUOp[2], ALUOp[1], ~ALUOp[0]);
    and (and24[2], resAnd[24], ~ALUOp[3], ~ALUOp[2], ~ALUOp[1], ~ALUOp[0]);
    and (and24[3], resOr[24], ~ALUOp[3], ~ALUOp[2], ~ALUOp[1], ALUOp[0]);

    and (and25[0], resAdd[25], ~ALUOp[3], ~ALUOp[2], ALUOp[1], ~ALUOp[0]);
    and (and25[1], resSub[25], ~ALUOp[3], ALUOp[2], ALUOp[1], ~ALUOp[0]);
    and (and25[2], resAnd[25], ~ALUOp[3], ~ALUOp[2], ~ALUOp[1], ~ALUOp[0]);
    and (and25[3], resOr[25], ~ALUOp[3], ~ALUOp[2], ~ALUOp[1], ALUOp[0]);

    and (and26[0], resAdd[26], ~ALUOp[3], ~ALUOp[2], ALUOp[1], ~ALUOp[0]);
    and (and26[1], resSub[26], ~ALUOp[3], ALUOp[2], ALUOp[1], ~ALUOp[0]);
    and (and26[2], resAnd[26], ~ALUOp[3], ~ALUOp[2], ~ALUOp[1], ~ALUOp[0]);
    and (and26[3], resOr[26], ~ALUOp[3], ~ALUOp[2], ~ALUOp[1], ALUOp[0]);

    and (and27[0], resAdd[27], ~ALUOp[3], ~ALUOp[2], ALUOp[1], ~ALUOp[0]);
    and (and27[1], resSub[27], ~ALUOp[3], ALUOp[2], ALUOp[1], ~ALUOp[0]);
    and (and27[2], resAnd[27], ~ALUOp[3], ~ALUOp[2], ~ALUOp[1], ~ALUOp[0]);
    and (and27[3], resOr[27], ~ALUOp[3], ~ALUOp[2], ~ALUOp[1], ALUOp[0]);

    and (and28[0], resAdd[28], ~ALUOp[3], ~ALUOp[2], ALUOp[1], ~ALUOp[0]);
    and (and28[1], resSub[28], ~ALUOp[3], ALUOp[2], ALUOp[1], ~ALUOp[0]);
    and (and28[2], resAnd[28], ~ALUOp[3], ~ALUOp[2], ~ALUOp[1], ~ALUOp[0]);
    and (and28[3], resOr[28], ~ALUOp[3], ~ALUOp[2], ~ALUOp[1], ALUOp[0]);

    and (and29[0], resAdd[29], ~ALUOp[3], ~ALUOp[2], ALUOp[1], ~ALUOp[0]);
    and (and29[1], resSub[29], ~ALUOp[3], ALUOp[2], ALUOp[1], ~ALUOp[0]);
    and (and29[2], resAnd[29], ~ALUOp[3], ~ALUOp[2], ~ALUOp[1], ~ALUOp[0]);
    and (and29[3], resOr[29], ~ALUOp[3], ~ALUOp[2], ~ALUOp[1], ALUOp[0]);

    and (and30[0], resAdd[30], ~ALUOp[3], ~ALUOp[2], ALUOp[1], ~ALUOp[0]);
    and (and30[1], resSub[30], ~ALUOp[3], ALUOp[2], ALUOp[1], ~ALUOp[0]);
    and (and30[2], resAnd[30], ~ALUOp[3], ~ALUOp[2], ~ALUOp[1], ~ALUOp[0]);
    and (and30[3], resOr[30], ~ALUOp[3], ~ALUOp[2], ~ALUOp[1], ALUOp[0]);

    and (and31[0], resAdd[31], ~ALUOp[3], ~ALUOp[2], ALUOp[1], ~ALUOp[0]);
    and (and31[1], resSub[31], ~ALUOp[3], ALUOp[2], ALUOp[1], ~ALUOp[0]);
    and (and31[2], resAnd[31], ~ALUOp[3], ~ALUOp[2], ~ALUOp[1], ~ALUOp[0]);
    and (and31[3], resOr[31], ~ALUOp[3], ~ALUOp[2], ~ALUOp[1], ALUOp[0]);

    or (result[0], and0[0], and0[1], and0[2], and0[3]);
    or (result[1], and1[0], and1[1], and1[2], and1[3]);
    or (result[2], and2[0], and2[1], and2[2], and2[3]);
    or (result[3], and3[0], and3[1], and3[2], and3[3]);
    or (result[4], and4[0], and4[1], and4[2], and4[3]);
    or (result[5], and5[0], and5[1], and5[2], and5[3]);
    or (result[6], and6[0], and6[1], and6[2], and6[3]);
    or (result[7], and7[0], and7[1], and7[2], and7[3]);
    or (result[8], and8[0], and8[1], and8[2], and8[3]);
    or (result[9], and9[0], and9[1], and9[2], and9[3]);
    or (result[10], and10[0], and10[1], and10[2], and10[3]);
    or (result[11], and11[0], and11[1], and11[2], and11[3]);
    or (result[12], and12[0], and12[1], and12[2], and12[3]);
    or (result[13], and13[0], and13[1], and13[2], and13[3]);
    or (result[14], and14[0], and14[1], and14[2], and14[3]);
    or (result[15], and15[0], and15[1], and15[2], and15[3]);
    or (result[16], and16[0], and16[1], and16[2], and16[3]);
    or (result[17], and17[0], and17[1], and17[2], and17[3]);
    or (result[18], and18[0], and18[1], and18[2], and18[3]);
    or (result[19], and19[0], and19[1], and19[2], and19[3]);
    or (result[20], and20[0], and20[1], and20[2], and20[3]);
    or (result[21], and21[0], and21[1], and21[2], and21[3]);
    or (result[22], and22[0], and22[1], and22[2], and22[3]);
    or (result[23], and23[0], and23[1], and23[2], and23[3]);
    or (result[24], and24[0], and24[1], and24[2], and24[3]);
    or (result[25], and25[0], and25[1], and25[2], and25[3]);
    or (result[26], and26[0], and26[1], and26[2], and26[3]);
    or (result[27], and27[0], and27[1], and27[2], and27[3]);
    or (result[28], and28[0], and28[1], and28[2], and28[3]);
    or (result[29], and29[0], and29[1], and29[2], and29[3]);
    or (result[30], and30[0], and30[1], and30[2], and30[3]);
    or (result[31], and31[0], and31[1], and31[2], and31[3]);

    /* Por ultimo, calcula-se se o resultado vale zero por meio de um nor com todos os bits do resultado.
       Esse valor e utilizado para a branch na instrucao beq */
    nor (zero,
    result[0],
    result[1],
    result[2],
    result[3],
    result[4],
    result[5],
    result[6],
    result[7],
    result[8],
    result[9],
    result[10],
    result[11],
    result[12],
    result[13],
    result[14],
    result[15],
    result[16],
    result[17],
    result[18],
    result[19],
    result[20],
    result[21],
    result[22],
    result[23],
    result[24],
    result[25],
    result[26],
    result[27],
    result[28],
    result[29],
    result[30],
    result[31]
    );
endmodule
