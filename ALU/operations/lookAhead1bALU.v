module lookAhead1bALU (
    input A,
    input B,
    input C,
    output S,
    output Cout
);
    wire P;
    wire G;

    // um wire sem definicao
    wire noDef;

    xor (P, A, B);
    xor (S, P, C);

    and (G, A, B);
    and (noDef, P, C);

    or (Cout, G, noDef);
endmodule
