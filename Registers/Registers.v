module Registers (
    input wire [4:0] readRegister1,
    input wire [4:0] readRegister2,
    input wire [4:0] writeRegister,
    input wire [31:0] writeData,
    input wire regWrite,
    input wire clk,
    output reg [31:0] readData1,
    output reg [31:0] readData2
);
    reg [31:0] register0;
    reg [31:0] register1;
    reg [31:0] register2;
    reg [31:0] register3;
    reg [31:0] register4;
    reg [31:0] register5;
    reg [31:0] register6;
    reg [31:0] register7;
    reg [31:0] register8;
    reg [31:0] register9;
    reg [31:0] register10;
    reg [31:0] register11;
    reg [31:0] register12;
    reg [31:0] register13;
    reg [31:0] register14;
    reg [31:0] register15;
    reg [31:0] register16;
    reg [31:0] register17;
    reg [31:0] register18;
    reg [31:0] register19;
    reg [31:0] register20;
    reg [31:0] register21;
    reg [31:0] register22;
    reg [31:0] register23;
    reg [31:0] register24;
    reg [31:0] register25;
    reg [31:0] register26;
    reg [31:0] register27;
    reg [31:0] register28;
    reg [31:0] register29;
    reg [31:0] register30;
    reg [31:0] register31;

    /* registrador que sempre vale zero na posicao zero, risc-v */
    initial begin
        register0  <=  32'd0;
        register1  <=  32'd0;
        register2  <=  32'd0;
        register3  <=  32'd0;
        register4  <=  32'd0;
        register5  <=  32'd0;
        register6  <=  32'd0;
        register7  <=  32'd0;
        register8  <=  32'd0;
        register9  <=  32'd0;
        register10 <= 32'd0;
        register11 <= 32'd0;
        register12 <= 32'd0;
        register13 <= 32'd0;
        register14 <= 32'd0;
        register15 <= 32'd0;
        register16 <= 32'd0;
        register17 <= 32'd0;
        register18 <= 32'd0;
        register19 <= 32'd0;
        register20 <= 32'd0;
        register21 <= 32'd0;
        register22 <= 32'd0;
        register23 <= 32'd0;
        register24 <= 32'd0;
        register25 <= 32'd0;
        register26 <= 32'd0;
        register27 <= 32'd0;
        register28 <= 32'd0;
        register29 <= 32'd0;
        register30 <= 32'd0;
        register31 <= 32'd0;
    end
    
    /* leitura assincrona */
    always @(readRegister1) begin
        case (readRegister1)
            5'b0 : readData1 <= register0;
            5'h1 : readData1 <= register1;
            5'h2 : readData1 <= register2;
            5'h3 : readData1 <= register3;
            5'h4 : readData1 <= register4;
            5'h5 : readData1 <= register5;
            5'h6 : readData1 <= register6;
            5'h7 : readData1 <= register7;
            5'h8 : readData1 <= register8;
            5'h9 : readData1 <= register9;
            5'hA : readData1 <= register10;
            5'hB : readData1 <= register11;
            5'hC : readData1 <= register12;
            5'hD : readData1 <= register13;
            5'hE : readData1 <= register14;
            5'hF : readData1 <= register15;
            5'h10: readData1 <= register16;
            5'h11: readData1 <= register17;
            5'h12: readData1 <= register18;
            5'h13: readData1 <= register19;
            5'h14: readData1 <= register20;
            5'h15: readData1 <= register21;
            5'h16: readData1 <= register22;
            5'h17: readData1 <= register23;
            5'h18: readData1 <= register24;
            5'h19: readData1 <= register25;
            5'h1A: readData1 <= register26;
            5'h1B: readData1 <= register27;
            5'h1C: readData1 <= register28;
            5'h1D: readData1 <= register29;
            5'h1E: readData1 <= register30;
            5'h1F: readData1 <= register31;
        endcase

        case (readRegister2)
            5'h0 : readData2 <= register0;
            5'h1 : readData2 <= register1;
            5'h2 : readData2 <= register2;
            5'h3 : readData2 <= register3;
            5'h4 : readData2 <= register4;
            5'h5 : readData2 <= register5;
            5'h6 : readData2 <= register6;
            5'h7 : readData2 <= register7;
            5'h8 : readData2 <= register8;
            5'h9 : readData2 <= register9;
            5'hA : readData2 <= register10;
            5'hB : readData2 <= register11;
            5'hC : readData2 <= register12;
            5'hD : readData2 <= register13;
            5'hE : readData2 <= register14;
            5'hF : readData2 <= register15;
            5'h10: readData2 <= register16;
            5'h11: readData2 <= register17;
            5'h12: readData2 <= register18;
            5'h13: readData2 <= register19;
            5'h14: readData2 <= register20;
            5'h15: readData2 <= register21;
            5'h16: readData2 <= register22;
            5'h17: readData2 <= register23;
            5'h18: readData2 <= register24;
            5'h19: readData2 <= register25;
            5'h1A: readData2 <= register26;
            5'h1B: readData2 <= register27;
            5'h1C: readData2 <= register28;
            5'h1D: readData2 <= register29;
            5'h1E: readData2 <= register30;
            5'h1F: readData2 <= register31;
        endcase
    end

    /* escrita sincrona */
    always @(posedge clk) begin
        if (regWrite == 1'b1) begin
           case (writeRegister)
            5'h0 : register0  <= writeData;
            5'h1 : register1  <= writeData;
            5'h2 : register2  <= writeData;
            5'h3 : register3  <= writeData;
            5'h4 : register4  <= writeData;
            5'h5 : register5  <= writeData;
            5'h6 : register6  <= writeData;
            5'h7 : register7  <= writeData;
            5'h8 : register8  <= writeData;
            5'h9 : register9  <= writeData;
            5'hA : register10 <= writeData;
            5'hB : register11 <= writeData;
            5'hC : register12 <= writeData;
            5'hD : register13 <= writeData;
            5'hE : register14 <= writeData;
            5'hF : register15 <= writeData;
            5'h10: register16 <= writeData;
            5'h11: register17 <= writeData;
            5'h12: register18 <= writeData;
            5'h13: register19 <= writeData;
            5'h14: register20 <= writeData;
            5'h15: register21 <= writeData;
            5'h16: register22 <= writeData;
            5'h17: register23 <= writeData;
            5'h18: register24 <= writeData;
            5'h19: register25 <= writeData;
            5'h1A: register26 <= writeData;
            5'h1B: register27 <= writeData;
            5'h1C: register28 <= writeData;
            5'h1D: register29 <= writeData;
            5'h1E: register30 <= writeData;
            5'h1F: register31 <= writeData;
           endcase
        end
    end
endmodule