`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/10/2025 11:47:25 PM
// Design Name: 
// Module Name: Vending_Machine_tb
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


module Vending_Machine_tb();
     // Testbench signals  
        reg clk;  
        reg reset;  
        reg [3:0] coin_in;  
        reg [1:0] item_sel;  
        wire dispense;  
        wire [3:0] balance;  
        wire [3:0] refund;  
    
        // Instantiate the vending machine  
        Vending_Machine vm (  
            .clk(clk),  
            .reset(reset),  
            .coin_in(coin_in),  
            .item_sel(item_sel),  
            .dispense(dispense),  
            .balance(balance),  
            .refund(refund)  
        );  
    
        // Clock generation  
        initial clk = 0;  
        always #5 clk = ~clk; // Toggle clock every 5 time units  
    
        initial begin  
            // Initialize signals  
            reset = 1; coin_in = 0; item_sel = 0;  
            #10 reset = 0; // Release reset  
    
            // Test case 1: Select item 1 with enough coins  
            coin_in = 4'd10; item_sel = 2'b00; // Select item 1 (Price: 10)  
            #10; // Wait for one clock cycle  
    
            // Test case 2: Select item 2 with exact coins  
            coin_in = 4'd15; item_sel = 2'b01; // Select item 2 (Price: 15)  
            #10; // Wait for one clock cycle  
    
            // Test case 3: Select item 3 with excess coins  
            coin_in = 4'd5; item_sel = 2'b10; // Select item 3 (Price: 17)  
            #10; // Wait for one clock cycle  
    
            // Test case 4: Select item 4 with excess coins  
            coin_in = 4'd20; item_sel = 2'b11; // Select item 4 (Price: 20) - should not dispense  
            #10; // Wait for resetting balance  
    
            coin_in = 0; // No coins  
            #10; // Wait for one clock cycle  
    
            // Complete simulation  
            #10 $finish;  
        end  
    
        // Monitor output signals  
        initial begin  
            $monitor("Time: %t | coin_in: %d | item_sel: %b | dispense: %b | balance: %d | refund: %d",   
                     $time, coin_in, item_sel, dispense, balance, refund);  
        end  
    
       
    
endmodule
