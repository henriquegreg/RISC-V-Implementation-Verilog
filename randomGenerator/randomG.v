module randomG(
    input wire[13:0]semente,
    output wire[3:0]numero
);
    reg [3:0] uns;
    integer i; 
    always @ (semente) begin
    uns = 0;
    for (i = 0; i < 8; i = i + 1) begin
      uns = uns + semente[i];
    end
    end
  assign numero = uns;
endmodule




