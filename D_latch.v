`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/25/2025 01:32:27 PM
// Design Name: 
// Module Name: D_latch
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module D_latch(
    input E,
    input D,
    output Q,
    output Qb
    );
    
    wire out_and1;
    wire out_and2;


    assign out_and1 = ~D & E;
    assign out_and2 = D & E;
    assign Q = ~(out_and1 | Qb);
    assign Qb = ~(out_and2 | Q); 
endmodule
