module tb_booth;

    reg  signed [3:0] A, B;
    wire signed [7:0] P;

    booth_multiplier DUT(A, B, P);

    initial begin
        $display(" A   B   PRODUCT");

        A =  3;  B =  2; #5;  $display("%d * %d = %d", A, B, P);
        A = -3;  B =  4; #5;  $display("%d * %d = %d", A, B, P);
        A =  5;  B = -2; #5;  $display("%d * %d = %d", A, B, P);
        A = -4;  B = -3; #5;  $display("%d * %d = %d", A, B, P);

        $finish;
    end

endmodule
