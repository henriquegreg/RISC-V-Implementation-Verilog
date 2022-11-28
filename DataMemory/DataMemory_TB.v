`timescale 1ns/100ps

module testbench ();
    reg clk;
    reg mem_read;
    reg mem_write;
    reg [31:0] endereco;
    reg [31:0] write_data;
    wire [31:0] read_data;

    data_memory UUT (.clk(clk), .mem_read(mem_read), .mem_write(mem_write), .endereco(endereco), .write_data(write_data), .read_data(read_data));

    integer i, errors = 0;

    // quando da write, ele ve se deu certo usando o read em seguida
    task Check;
        input [31:0] expect;
        
        if (read_data != expect) begin
                $display ("Error : endereco: %d expect: %b got: %b", endereco, expect, read_data);
                errors = errors + 1;
        end
    endtask

    initial clk = 0;
    always #10 clk =~ clk;

    initial begin
        //testa read sozinho
        mem_read = 1'b1;
        mem_write = 1'b0;
        endereco = 32'd0;
        #10
        Check(32'b00000000000000000000111111111111);
        endereco = 32'd1;
        #10
        Check(32'b00000000000000000000000000000000);

        //testa write
        mem_read = 1'b0;
        mem_write = 1'b1;
        endereco = 32'd1;
        write_data = 32'd111;

        // clk de 10ns, coloca 11 para dar tempo de mudar o output
        // testa se o write foi certo dando read
        #11
        mem_read = 1'b1;
        mem_write = 1'b0;
        endereco = 32'd1;
        #10
        Check(32'd111);


        $display("Test finished. Erros: %d", errors);
    end

    
endmodule