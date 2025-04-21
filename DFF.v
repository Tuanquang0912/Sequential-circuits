module DFF 	( input d,
              input rstn,
              input clk,
              output reg q);

	always @ (posedge clk or negedge rstn) //for asynchronous reset
    //always @ (posedge clk) //for synchronous reset

       if (!rstn)
          q <= 0;
       else
          q <= d;
endmodule