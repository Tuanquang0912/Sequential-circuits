module SRFF(
    input clk, rst_n,
    input s, r,
    output reg r_q,  // Register type, to allow assignment inside always block
    output qb        // Wire type, since it will just be the complement of r_q
    );
    always@(posedge clk)
    //always@(posedge clk or negedge rst_n) 
    begin
        if (!rst_n) 
            r_q <= 0;  // Reset r_q to 0 when rst_n is low
        else begin
            case ({s, r})
                2'b00: r_q <= r_q;    // No change
                2'b01: r_q <= 1'b0;   // Reset
                2'b10: r_q <= 1'b1;   // Set
                2'b11: r_q <= 1'bx;   // Invalid state (both set and reset active)
            endcase
        end
    end

    assign qb = ~r_q;  // Complement of r_q to drive the qb output
endmodule
