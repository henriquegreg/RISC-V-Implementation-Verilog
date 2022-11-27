`timescale 1ns/100ps
module testbench () ;
    reg [5:0] Op ;
    reg [3:0] CurrentState;

    wire [19:0] out;
    PLA UUT ( .Op(Op), .CurrentState (CurrentState),  .PCWrite(PCWrite), .PCWriteCond(PCWriteCond), .IorD(IorD), .MemRead(MemRead), .MemWrite(MemWrite), .IRWrite(IRWrite), .MemtoReg(MemtoReg), .PCSource1(PCSource1), .PCSource0(PCSource0), .ALUOp1(ALUOp1), .ALUOp0(ALUOp0), .ALUSrcB1(ALUSrcB1), .ALUSrcB0(ALUSrcB0), .ALUSrcBA(ALUSrcBA), .RegWrite(RegWrite), .RegDst(RegDst), .NS3(NS3), .NS2(NS2), .NS1(NS1), .NS0(NS0));

    integer i, k, errors;
    task Check ;
        input [0:19] xpect;
        if ({PCWrite,
    PCWriteCond,
    IorD,
    MemRead,
    MemWrite,
    IRWrite,
    MemtoReg,
    PCSource1,
    PCSource0,
    ALUOp1,
    ALUOp0,
    ALUSrcB1,
    ALUSrcB0,
    ALUSrcBA,
    RegWrite,
    RegDst,
    NS3,
    NS2,
    NS1,
    NS0
    } != xpect) begin
                $display ("Error : Op = %b CurrentState= %b, expect %b, got %b, PCWrite = %b", Op, CurrentState, xpect , {PCWrite,
    PCWriteCond,
    IorD,
    MemRead,
    MemWrite,
    IRWrite,
    MemtoReg,
    PCSource1,
    PCSource0,
    ALUOp1,
    ALUOp0,
    ALUSrcB1,
    ALUSrcB0,
    ALUSrcBA,
    RegWrite,
    RegDst,
    NS3,
    NS2,
    NS1,
    NS0}, PCWrite);
                errors = errors + 1;
        end
    endtask


        initial begin
        errors = 0;

        Op = 6'b110111;

        CurrentState = 4'b0000;
        #10
        Check(20'b10010100000010000001);
        #10;

        CurrentState = 4'b0001;
        #10
        Check(20'b0000000000011000????);
        #10

        CurrentState = 4'b0010;
        #10
        Check(20'b0000000000010100????);
        #10

        CurrentState = 4'b0011;
        #10
        Check(20'b0011000000000000????);
        #10

        CurrentState = 4'b0100;
        #10
        Check(20'b0000001000000010????);
        #10

        CurrentState = 4'b0101;
        #10
        Check(20'b0010100000000000????);
        #10
        
        CurrentState = 4'b0110;
        #10
        Check(20'b0000000001000100????);
        #10

        CurrentState = 4'b0111;
        #10
        Check(20'b0000000000000011????);
        #10

        CurrentState = 4'b1000;
        #10
        Check(20'b0100000010100100????);
        #10

        CurrentState = 4'b1001;
        #10
        Check(20'b1000000100000000????);

        Op = 6'b010111;

        CurrentState = 4'b0000;
        #10
        Check(20'b10010100000010000001);
        #10;

        CurrentState = 4'b0001;
        #10
        Check(20'b00000000000110001001);
        #10

        CurrentState = 4'b0010;
        #10
        Check(20'b0000000000010100????);
        #10

        CurrentState = 4'b0011;
        #10
        Check(20'b00110000000000000100);
        #10

        CurrentState = 4'b0100;
        #10
        Check(20'b00000010000000100000);
        #10

        CurrentState = 4'b0101;
        #10
        Check(20'b00101000000000000000);
        #10
        
        CurrentState = 4'b0110;
        #10
        Check(20'b00000000010001000111);
        #10

        CurrentState = 4'b0111;
        #10
        Check(20'b00000000000000110000);
        #10

        CurrentState = 4'b1000;
        #10
        Check(20'b01000000101001000000);
        #10

        CurrentState = 4'b1001;
        #10
        Check(20'b10000001000000000000);

        Op = 6'b101111;

        CurrentState = 4'b0000;
        #10
        Check(20'b10010100000010000001);
        #10;

        CurrentState = 4'b0001;
        #10
        Check(20'b00000000000110001001);
        #10

        CurrentState = 4'b0010;
        #10
        Check(20'b0000000000010100????);
        #10

        CurrentState = 4'b0011;
        #10
        Check(20'b00110000000000000100);
        #10

        CurrentState = 4'b0100;
        #10
        Check(20'b00000010000000100000);
        #10

        CurrentState = 4'b0101;
        #10
        Check(20'b00101000000000000000);
        #10
        
        CurrentState = 4'b0110;
        #10
        Check(20'b00000000010001000111);
        #10

        CurrentState = 4'b0111;
        #10
        Check(20'b00000000000000110000);
        #10

        CurrentState = 4'b1000;
        #10
        Check(20'b01000000101001000000);
        #10

        CurrentState = 4'b1001;
        #10
        Check(20'b10000001000000000000);

        Op = 6'b100111;

        CurrentState = 4'b0000;
        #10
        Check(20'b10010100000010000001);
        #10;

        CurrentState = 4'b0001;
        #10
        Check(20'b0000000000011000????);
        #10

        CurrentState = 4'b0010;
        #10
        Check(20'b0000000000010100????);
        #10

        CurrentState = 4'b0011;
        #10
        Check(20'b0011000000000000????);
        #10

        CurrentState = 4'b0100;
        #10
        Check(20'b0000001000000010????);
        #10

        CurrentState = 4'b0101;
        #10
        Check(20'b0010100000000000????);
        #10
        
        CurrentState = 4'b0110;
        #10
        Check(20'b0000000001000100????);
        #10

        CurrentState = 4'b0111;
        #10
        Check(20'b0000000000000011????);
        #10

        CurrentState = 4'b1000;
        #10
        Check(20'b0100000010100100????);
        #10

        CurrentState = 4'b1001;
        #10
        Check(20'b1000000100000000????);
        
        Op = 6'b000011;

        CurrentState = 4'b0000;
        #10
        Check(20'b10010100000010000001);
        #10;

        CurrentState = 4'b0001;
        #10
        Check(20'b00000000000110000010);
        #10

        CurrentState = 4'b0010;
        #10
        Check(20'b00000000000101000011);
        #10

        CurrentState = 4'b0011;
        #10
        Check(20'b00110000000000000100);
        #10

        CurrentState = 4'b0100;
        #10
        Check(20'b00000010000000100000);
        #10

        CurrentState = 4'b0101;
        #10
        Check(20'b00101000000000000000);
        #10
        
        CurrentState = 4'b0110;
        #10
        Check(20'b00000000010001000111);
        #10

        CurrentState = 4'b0111;
        #10
        Check(20'b00000000000000110000);
        #10

        CurrentState = 4'b1000;
        #10
        Check(20'b01000000101001000000);
        #10

        CurrentState = 4'b1001;
        #10
        Check(20'b10000001000000000000);

        Op = 6'b100011;

        CurrentState = 4'b0000;
        #10
        Check(20'b10010100000010000001);
        #10;

        CurrentState = 4'b0001;
        #10
        Check(20'b00000000000110000010);
        #10

        CurrentState = 4'b0010;
        #10
        Check(20'b00000000000101000101);
        #10

        CurrentState = 4'b0011;
        #10
        Check(20'b00110000000000000100);
        #10

        CurrentState = 4'b0100;
        #10
        Check(20'b00000010000000100000);
        #10

        CurrentState = 4'b0101;
        #10
        Check(20'b00101000000000000000);
        #10
        
        CurrentState = 4'b0110;
        #10
        Check(20'b00000000010001000111);
        #10

        CurrentState = 4'b0111;
        #10
        Check(20'b00000000000000110000);
        #10

        CurrentState = 4'b1000;
        #10
        Check(20'b01000000101001000000);
        #10

        CurrentState = 4'b1001;
        #10
        Check(20'b10000001000000000000);

        Op = 6'b010011;

        CurrentState = 4'b0000;
        #10
        Check(20'b10010100000010000001);
        #10;

        CurrentState = 4'b0001;
        #10
        Check(20'b0000000000011000????);
        #10

        CurrentState = 4'b0010;
        #10
        Check(20'b0000000000010100????);
        #10

        CurrentState = 4'b0011;
        #10
        Check(20'b0011000000000000????);
        #10

        CurrentState = 4'b0100;
        #10
        Check(20'b0000001000000010????);
        #10

        CurrentState = 4'b0101;
        #10
        Check(20'b0010100000000000????);
        #10
        
        CurrentState = 4'b0110;
        #10
        Check(20'b0000000001000100????);
        #10

        CurrentState = 4'b0111;
        #10
        Check(20'b0000000000000011????);
        #10

        CurrentState = 4'b1000;
        #10
        Check(20'b0100000010100100????);
        #10

        CurrentState = 4'b1001;
        #10
        Check(20'b1000000100000000????);

        Op = 6'b110011;

        CurrentState = 4'b0000;
        #10
        Check(20'b10010100000010000001);
        #10;

        CurrentState = 4'b0001;
        #10
        Check(20'b00000000000110000110);
        #10

        CurrentState = 4'b0010;
        #10
        Check(20'b0000000000010100????);
        #10

        CurrentState = 4'b0011;
        #10
        Check(20'b00110000000000000100);
        #10

        CurrentState = 4'b0100;
        #10
        Check(20'b00000010000000100000);
        #10

        CurrentState = 4'b0101;
        #10
        Check(20'b00101000000000000000);
        #10
        
        CurrentState = 4'b0110;
        #10
        Check(20'b00000000010001000111);
        #10

        CurrentState = 4'b0111;
        #10
        Check(20'b00000000000000110000);
        #10

        CurrentState = 4'b1000;
        #10
        Check(20'b01000000101001000000);
        #10

        CurrentState = 4'b1001;
        #10
        Check(20'b10000001000000000000);

        Op = 6'b001111;

        CurrentState = 4'b0000;
        #10
        Check(20'b10010100000010000001);
        #10;

        CurrentState = 4'b0001;
        #10
        Check(20'b0000000000011000????);
        #10

        CurrentState = 4'b0010;
        #10
        Check(20'b0000000000010100????);
        #10

        CurrentState = 4'b0011;
        #10
        Check(20'b0011000000000000????);
        #10

        CurrentState = 4'b0100;
        #10
        Check(20'b0000001000000010????);
        #10

        CurrentState = 4'b0101;
        #10
        Check(20'b0010100000000000????);
        #10
        
        CurrentState = 4'b0110;
        #10
        Check(20'b0000000001000100????);
        #10

        CurrentState = 4'b0111;
        #10
        Check(20'b0000000000000011????);
        #10

        CurrentState = 4'b1000;
        #10
        Check(20'b0100000010100100????);
        #10

        CurrentState = 4'b1001;
        #10
        Check(20'b1000000100000000????);

        $display (" Test ended , %2d errors ", errors );
    end
endmodule