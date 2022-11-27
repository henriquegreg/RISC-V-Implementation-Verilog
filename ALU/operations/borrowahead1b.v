module borrowAhead1b (
    input A,
    input B,
    input C,
    output D,
    output Bout
);
    wire A1;
    wire A2;
    wire A3;

    xor (A1, A, B);
    and (A2, B, ~A);
    and (A3, ~A1, C);

    xor (D, A1, C);

    or (Bout, A2, A3);
endmodule