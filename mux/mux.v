module mux (
    input wire [31:0] A,
    input wire [31:0] B,
    input wire select,
    output reg [31:0] result
);

always @(*) begin
    case(select)
        1'b1: result = A;
        default: result = B;
    endcase
end
endmodule