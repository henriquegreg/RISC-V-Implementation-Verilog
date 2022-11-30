`timescale 1ns/100ps
module randomG_tb () ;
reg [13:0] semente;
wire [3:0] numero;
    randomG UUT(.numero(numero), .semente(semente));
    initial semente = 14'b00000000000001;
    initial begin
        semente = 14'b10010001000101;
        #10 
        $display("NUMERO: %b", numero);
        semente = 14'b11111111111111;
        #10
        $display("NUMERO: %b", numero);
        semente = 14'b00100100010001;
        #10
        $display("NUMERO: %b", numero);
        semente = 14'b11100100010101;
    end
endmodule