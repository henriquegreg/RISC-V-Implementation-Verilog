`include "lookAhead1bALU.v"

module sumALU (
    input [31:0] A,
    input [31:0] B,
    
    output [31:0] result,
    output Cout
);  

    wire zero;
    wire C1;
    wire C2;
    wire C3;
    wire C4;
    wire C5;
    wire C6;
    wire C7;
    wire C8;
    wire C9;
    wire C10;
    wire C11;
    wire C12;
    wire C13;
    wire C14;
    wire C15;
    wire C16;
    wire C17;
    wire C18;
    wire C19;
    wire C20;
    wire C21;
    wire C22;
    wire C23;
    wire C24;
    wire C25;
    wire C26;
    wire C27;
    wire C28;
    wire C29;
    wire C30;
    wire C31;

    and (zero, A[0], ~A[0]);
    
    /* usando varios lookAheads em serie, calcula-se o valor da soma entre A e B */
    lookAhead1bALU s0 (.S(result[0]),   .A(A[0]),   .B(B[0]),   .C(zero), .Cout(C1));
    lookAhead1bALU s1 (.S(result[1]),   .A(A[1]),   .B(B[1]),   .C(C1), .Cout(C2));
    lookAhead1bALU s2 (.S(result[2]),   .A(A[2]),   .B(B[2]),   .C(C2), .Cout(C3));
    lookAhead1bALU s3 (.S(result[3]),   .A(A[3]),   .B(B[3]),   .C(C3), .Cout(C4));
    lookAhead1bALU s4 (.S(result[4]),   .A(A[4]),   .B(B[4]),   .C(C4), .Cout(C5));
    lookAhead1bALU s5 (.S(result[5]),   .A(A[5]),   .B(B[5]),   .C(C5), .Cout(C6));
    lookAhead1bALU s6 (.S(result[6]),   .A(A[6]),   .B(B[6]),   .C(C6), .Cout(C7));
    lookAhead1bALU s7 (.S(result[7]),   .A(A[7]),   .B(B[7]),   .C(C7), .Cout(C8));
    lookAhead1bALU s8 (.S(result[8]),   .A(A[8]),   .B(B[8]),   .C(C8), .Cout(C9));
    lookAhead1bALU s9 (.S(result[9]),   .A(A[9]),   .B(B[9]),   .C(C9), .Cout(C10));
    lookAhead1bALU s10 (.S(result[10]), .A(A[10]), .B(B[10]), .C(C10), .Cout(C11));
    lookAhead1bALU s11 (.S(result[11]), .A(A[11]), .B(B[11]), .C(C11), .Cout(C12));
    lookAhead1bALU s12 (.S(result[12]), .A(A[12]), .B(B[12]), .C(C12), .Cout(C13));
    lookAhead1bALU s13 (.S(result[13]), .A(A[13]), .B(B[13]), .C(C13), .Cout(C14));
    lookAhead1bALU s14 (.S(result[14]), .A(A[14]), .B(B[14]), .C(C14), .Cout(C15));
    lookAhead1bALU s15 (.S(result[15]), .A(A[15]), .B(B[15]), .C(C15), .Cout(C16));
    lookAhead1bALU s16 (.S(result[16]), .A(A[16]), .B(B[16]), .C(C16), .Cout(C17));
    lookAhead1bALU s17 (.S(result[17]), .A(A[17]), .B(B[17]), .C(C17), .Cout(C18));
    lookAhead1bALU s18 (.S(result[18]), .A(A[18]), .B(B[18]), .C(C18), .Cout(C19));
    lookAhead1bALU s19 (.S(result[19]), .A(A[19]), .B(B[19]), .C(C19), .Cout(C20));
    lookAhead1bALU s20 (.S(result[20]), .A(A[20]), .B(B[20]), .C(C20), .Cout(C21));
    lookAhead1bALU s21 (.S(result[21]), .A(A[21]), .B(B[21]), .C(C21), .Cout(C22));
    lookAhead1bALU s22 (.S(result[22]), .A(A[22]), .B(B[22]), .C(C22), .Cout(C23));
    lookAhead1bALU s23 (.S(result[23]), .A(A[23]), .B(B[23]), .C(C23), .Cout(C24));
    lookAhead1bALU s24 (.S(result[24]), .A(A[24]), .B(B[24]), .C(C24), .Cout(C25));
    lookAhead1bALU s25 (.S(result[25]), .A(A[25]), .B(B[25]), .C(C25), .Cout(C26));
    lookAhead1bALU s26 (.S(result[26]), .A(A[26]), .B(B[26]), .C(C26), .Cout(C27));
    lookAhead1bALU s27 (.S(result[27]), .A(A[27]), .B(B[27]), .C(C27), .Cout(C28));
    lookAhead1bALU s28 (.S(result[28]), .A(A[28]), .B(B[28]), .C(C28), .Cout(C29));
    lookAhead1bALU s29 (.S(result[29]), .A(A[29]), .B(B[29]), .C(C29), .Cout(C30));
    lookAhead1bALU s30 (.S(result[30]), .A(A[30]), .B(B[30]), .C(C30), .Cout(C31));
    lookAhead1bALU s31 (.S(result[31]), .A(A[31]), .B(B[31]), .C(C31), .Cout(Cout));
endmodule
