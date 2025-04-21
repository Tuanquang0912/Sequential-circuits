module tb_DFF;

    // Declare signals
    reg r_CLK;        // Clock signal
    reg r_D;          // Data input signal
    reg r_RST_N;      // Reset active low signal
    reg [2:0] delay;  // Random delay value (3-bit wide for smaller values)

    wire r_q;         // Output from DFF module

    // Instantiate the DFF module
    DFF dut (
        .d(r_D),
        .clk(r_CLK),
        .rst_n(r_RST_N),
        .r_q(r_q)
    );

    // Clock generation (toggle every 10ns)
    always begin
        #5 r_CLK = ~r_CLK; // 10ns period for clock (adjust as needed)
    end

    integer i;  // Declare the loop variable outside of the for loop

    initial begin
        // Initialize signals
        r_CLK = 0;
        r_D = 0;
        r_RST_N = 0;
        delay = 3'b010; // Set an initial delay value

        // Apply initial reset and data
        #15 r_D = 1;          // Set data input to 1
        #10 r_RST_N = 1;      // Deassert reset (active low)
        
        // Apply random delays and data values
        for (i = 0; i < 5; i = i + 1) begin
            delay = 3'b001;  // Fixed delay for testing
            #delay r_D = i;  // Change data input 'r_D' to current value of 'i'
        end

        // Finish the simulation after a while
        #50 $finish;
    end

    // Display the waveform for the signals
    initial begin
        $dumpfile("tb_DFF.vcd");  // Write waveforms to a VCD file
        $dumpvars(0, tb_DFF);     // Dump all variables in the tb_DFF module
    end

endmodule
