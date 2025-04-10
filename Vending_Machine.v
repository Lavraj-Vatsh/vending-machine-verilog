`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/10/2025 11:41:33 PM
// Design Name: 
// Module Name: Vending_Machine
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


module Vending_Machine( 
        input wire clk,                 // Clock signal  
        input wire reset,               // Reset signal  
        input wire [3:0] coin_in,      // Coins input (1-15)  
        input wire [1:0] item_sel,      // Item selection (00-11)  
        output reg dispense,            // Dispense item signal  
        output reg [3:0] balance,       // Current balance  
        output reg [3:0] refund         // Refund amount  
    );  
    
        // Define item prices  
        parameter ITEM_1_PRICE = 4'd10; // Price for item 1  
        parameter ITEM_2_PRICE = 4'd15; // Price for item 2          
        parameter ITEM_3_PRICE = 4'd17; // Price for item 3  
        parameter ITEM_4_PRICE = 4'd20; // Price for item 4  
    
        // Main logic for balance and dispensing  
        always @(posedge clk or posedge reset) begin  
            if (reset) begin  
                dispense <= 0;  
                balance <= 0;  
                refund <= 0;  // Initialize refund  
            end else begin  
                // Update the balance with inserted coins  
                balance <= balance + coin_in;   
                dispense <= 0;  // Default to no dispense  
                refund <= 0;     // Reset refund each cycle  
    
                // Check for item selection and enough balance  
                case (item_sel)  
                    2'b00: begin // Item 1  
                        if (balance >= ITEM_1_PRICE) begin  
                            dispense <= 1; // Dispense item 1  
                            balance <= balance - ITEM_1_PRICE; // Deduct item price  
                            refund <= balance; // Remaining balance is the refund amount  
                        end  
                    end  
                    2'b01: begin // Item 2  
                        if (balance >= ITEM_2_PRICE) begin  
                            dispense <= 1; // Dispense item 2  
                            balance <= balance - ITEM_2_PRICE; // Deduct item price  
                            refund <= balance; // Remaining balance is the refund amount  
                        end  
                    end  
                    2'b10: begin // Item 3  
                        if (balance >= ITEM_3_PRICE) begin  
                            dispense <= 1; // Dispense item 3  
                            balance <= balance - ITEM_3_PRICE; // Deduct item price  
                            refund <= balance; // Remaining balance is the refund amount  
                        end  
                    end  
                    2'b11: begin // Item 4  
                        if (balance >= ITEM_4_PRICE) begin  
                            dispense <= 1; // Dispense item 4  
                            balance <= balance - ITEM_4_PRICE; // Deduct item price  
                            refund <= balance; // Remaining balance is the refund amount  
                        end  
                    end  
                    default: begin  
                        dispense <= 0; // No dispense  
                        refund <= balance; // Default refund to current balance  
                    end  
                endcase  
            end  
        end  
    
   
    
    
endmodule
