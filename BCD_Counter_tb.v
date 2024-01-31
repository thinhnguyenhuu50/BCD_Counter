`timescale 1ns/1ns  // Define the simulation timescale
`include "BCD_Up_Counter.v"

module BCD_Up_Counter_tb;
    reg clk, reset;
    wire [3:0] q;

    BCD_Up_Counter uut (.clk(clk), .q(q), .reset(reset));

    initial begin
        $dumpfile( "BCD_Up_Counter.vcd" ); 
        $dumpvars( 0, BCD_Up_Counter_tb); 
        reset = 1;
        #1 reset = 0;
        #200 $finish;
    end;

    initial begin
        clk = 1;
        forever #5 clk = ~clk;
    end;

endmodule