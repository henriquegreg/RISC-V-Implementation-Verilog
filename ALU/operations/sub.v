`include "borrowahead1b.v"

module sub (
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

    borrowAhead1b s0 (.D(result[0]),   .A(A[0]),   .B(B[0]),   .C(zero),   .Bout(C1));
    borrowAhead1b s1 (.D(result[1]),   .A(A[1]),   .B(B[1]),   .C(C1), .Bout(C2));
    borrowAhead1b s2 (.D(result[2]),   .A(A[2]),   .B(B[2]),   .C(C2), .Bout(C3));
    borrowAhead1b s3 (.D(result[3]),   .A(A[3]),   .B(B[3]),   .C(C3), .Bout(C4));
    borrowAhead1b s4 (.D(result[4]),   .A(A[4]),   .B(B[4]),   .C(C4), .Bout(C5));
    borrowAhead1b s5 (.D(result[5]),   .A(A[5]),   .B(B[5]),   .C(C5), .Bout(C6));
    borrowAhead1b s6 (.D(result[6]),   .A(A[6]),   .B(B[6]),   .C(C6), .Bout(C7));
    borrowAhead1b s7 (.D(result[7]),   .A(A[7]),   .B(B[7]),   .C(C7), .Bout(C8));
    borrowAhead1b s8 (.D(result[8]),   .A(A[8]),   .B(B[8]),   .C(C8), .Bout(C9));
    borrowAhead1b s9 (.D(result[9]),   .A(A[9]),   .B(B[9]),   .C(C9), .Bout(C10));
    borrowAhead1b s10 (.D(result[10]), .A(A[10]), .B(B[10]), .C(C10), .Bout(C11));
    borrowAhead1b s11 (.D(result[11]), .A(A[11]), .B(B[11]), .C(C11), .Bout(C12));
    borrowAhead1b s12 (.D(result[12]), .A(A[12]), .B(B[12]), .C(C12), .Bout(C13));
    borrowAhead1b s13 (.D(result[13]), .A(A[13]), .B(B[13]), .C(C13), .Bout(C14));
    borrowAhead1b s14 (.D(result[14]), .A(A[14]), .B(B[14]), .C(C14), .Bout(C15));
    borrowAhead1b s15 (.D(result[15]), .A(A[15]), .B(B[15]), .C(C15), .Bout(C16));
    borrowAhead1b s16 (.D(result[16]), .A(A[16]), .B(B[16]), .C(C16), .Bout(C17));
    borrowAhead1b s17 (.D(result[17]), .A(A[17]), .B(B[17]), .C(C17), .Bout(C18));
    borrowAhead1b s18 (.D(result[18]), .A(A[18]), .B(B[18]), .C(C18), .Bout(C19));
    borrowAhead1b s19 (.D(result[19]), .A(A[19]), .B(B[19]), .C(C19), .Bout(C20));
    borrowAhead1b s20 (.D(result[20]), .A(A[20]), .B(B[20]), .C(C20), .Bout(C21));
    borrowAhead1b s21 (.D(result[21]), .A(A[21]), .B(B[21]), .C(C21), .Bout(C22));
    borrowAhead1b s22 (.D(result[22]), .A(A[22]), .B(B[22]), .C(C22), .Bout(C23));
    borrowAhead1b s23 (.D(result[23]), .A(A[23]), .B(B[23]), .C(C23), .Bout(C24));
    borrowAhead1b s24 (.D(result[24]), .A(A[24]), .B(B[24]), .C(C24), .Bout(C25));
    borrowAhead1b s25 (.D(result[25]), .A(A[25]), .B(B[25]), .C(C25), .Bout(C26));
    borrowAhead1b s26 (.D(result[26]), .A(A[26]), .B(B[26]), .C(C26), .Bout(C27));
    borrowAhead1b s27 (.D(result[27]), .A(A[27]), .B(B[27]), .C(C27), .Bout(C28));
    borrowAhead1b s28 (.D(result[28]), .A(A[28]), .B(B[28]), .C(C28), .Bout(C29));
    borrowAhead1b s29 (.D(result[29]), .A(A[29]), .B(B[29]), .C(C29), .Bout(C30));
    borrowAhead1b s30 (.D(result[30]), .A(A[30]), .B(B[30]), .C(C30), .Bout(C31));
    borrowAhead1b s31 (.D(result[31]), .A(A[31]), .B(B[31]), .C(C31), .Bout(Cout));
endmodule
