module array_multiplier_4x4(
    input  [3:0] A,
    input  [3:0] B,
    output [7:0] P
);

    wire [3:0] pp0, pp1, pp2, pp3;          // partial products
    wire c1, c2, c3, c4, c5, c6;            // internal carries
    wire s1, s2, s3, s4, s5, s6;            // internal sums

    // ----------------------------
    // STEP 1: Partial product generation
    // ----------------------------
    assign pp0 = A & {4{B[0]}};
    assign pp1 = A & {4{B[1]}};
    assign pp2 = A & {4{B[2]}};
    assign pp3 = A & {4{B[3]}};

    // ----------------------------
    // STEP 2: Add partial products row by row
    // ----------------------------

    // First product bit
    assign P[0] = pp0[0];

    // Column 1
    full_adder fa1(pp0[1], pp1[0], 1'b0, s1, c1);
    assign P[1] = s1;

    // Column 2
    full_adder fa2(pp0[2], pp1[1], c1, s2, c2);
    half_adder ha1(s2, pp2[0], s3, c3);
    assign P[2] = s3;

    // Column 3
    full_adder fa3(pp0[3], pp1[2], c2, s4, c4);
    full_adder fa4(s4, pp2[1], c3, s5, c5);
    assign P[3] = s5;

    // Column 4
    full_adder fa5(pp1[3], pp2[2], c4, s6, c6);
    full_adder fa6(s6, pp3[1], c5, P[4], c1);

    // Column 5
    full_adder fa7(pp2[3], pp3[2], c6, P[5], c2);

    // Column 6
    half_adder ha2(pp3[3], c2, P[6], P[7]);

endmodule



// ---------------------------------------------------
// FULL ADDER
// ---------------------------------------------------
module full_adder(
    input a, b, cin,
    output sum, cout
);
    assign {cout, sum} = a + b + cin;
endmodule


// ---------------------------------------------------
// HALF ADDER
// ---------------------------------------------------
module half_adder(
    input a, b,
    output sum, cout
);
    assign sum  = a ^ b;
    assign cout = a & b;
endmodule
