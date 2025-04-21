module tb_SR_latch;

    // Declare the testbench signals
    reg R;
    reg S;
    wire Q;
    wire Qb;

    // Instantiate the SR_latch module
    SR_latch uut (
        .R(R),
        .S(S),
        .Q(Q),
        .Qb(Qb)
    );

    // Initialize the inputs and apply stimulus
    initial begin
        // Display the header
        $display("Time\tR\tS\tQ\tQb");

        // Initialize the values
        R = 0;
        S = 0;

        // Apply different combinations of R and S
        #10 R = 0; S = 0;  // Reset state
        #10 R = 1; S = 0;  // Set state
        #10 R = 0; S = 1;  // Reset state
        #10 R = 1; S = 1;  // Invalid state (both R and S are 1)

        // End simulation after applying stimulus
        #10 $finish;
    end

    // Monitor the values of R, S, Q, and Qb at each time step
    initial begin
        $monitor("%0t\t%b\t%b\t%b\t%b", $time, R, S, Q, Qb);
    end

endmodule
