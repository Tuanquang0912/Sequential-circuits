module tb_SRFF;
  reg r_CLK, r_RST_N;
  reg r_S, r_R;
  wire w_Q, w_QB;
  
  // Instantiate the SR flip-flop (SRFF)
  SRFF dut(
    .clk(r_CLK), 
    .rst_n(r_RST_N),
    .s(r_S), 
    .r(r_R),
    .r_q(w_Q),  // Connect r_q to w_Q
    .qb(w_QB)   // Connect qb to w_QB
  );
  
  // Clock generation
  always #2 r_CLK = ~r_CLK;

  initial begin
    r_CLK = 0; r_RST_N = 0;
    $display("Reset=%b --> w_Q=%b, w_QB=%b", r_RST_N, w_Q, w_QB);
    #3 r_RST_N = 1;  // Wait for 3 time units before deasserting reset
    $display("Reset=%b --> w_Q=%b, w_QB=%b", r_RST_N, w_Q, w_QB);
    
    // Test the various combinations of inputs for the SR flip-flop
    drive(2'b00);  // No change
    drive(2'b01);  // Reset
    drive(2'b10);  // Set
    drive(2'b11);  // Invalid state
    #5;  // Additional time to observe results before finish
    $finish;
  end
  
  // Task to drive inputs and display output values
  task drive(input [1:0] ip);
    begin  // Wrap statements in 'begin' and 'end' to avoid the error
      @(posedge r_CLK);  // Wait for the next rising edge of the clock
      {r_S, r_R} = ip;  // Set the inputs based on the passed 2-bit value
      #1;  // Small delay to allow time for the flip-flop to process the inputs
      $display("s=%b, r=%b --> q=%b, q_bar=%b", r_S, r_R, w_Q, w_QB);
    end
  endtask
  
  // Dump waveform to file
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);  // Dump all signals at level 1 (for the whole module)
  end
endmodule
