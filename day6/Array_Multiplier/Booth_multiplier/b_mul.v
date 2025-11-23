module booth_multiplier(
    input  signed [3:0] M,   // Multiplicand
    input  signed [3:0] Q,   // Multiplier
    output reg signed [7:0] P // Product
);

    reg signed [7:0] A;  // +M shifted left
    reg signed [7:0] S;  // -M shifted left
    reg signed [8:0] ACC; // ACC | Q | Q-1   (9 bits)
    integer i;

    always @(*) begin

        // Extend M to 8-bit and shift left by 4 bits
        A = { M, 4'b0000 };

        // Negative M shifted left
        S = { -M, 4'b0000 };

        // Initial ACC = [0][Q][Q-1]
        ACC = { 4'b0000, Q, 1'b0 };

        // Booth loop (4 bits)
        for(i = 0; i < 4; i = i + 1) begin

            // Check the last two bits (Q0 and Q-1)
            case(ACC[1:0])
                2'b01:  ACC[8:1] = ACC[8:1] + A;  // 01 → ADD
                2'b10:  ACC[8:1] = ACC[8:1] + S;  // 10 → SUBTRACT
                default: ;                         // 11 or 00 → DO NOTHING
            endcase

            // Arithmetic Right Shift (sign preserved)
            ACC = { ACC[8], ACC[8:1] };

        end

        // Final product (drop Q-1)
        P = ACC[8:1];

    end

endmodule
