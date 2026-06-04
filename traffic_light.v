`timescale 1ns / 1ps

module traffic_light (
    input clk,
    input rst,
    output reg [2:0] north_south, // [2]=Red, [1]=Yellow, [0]=Green
    output reg [2:0] east_west    // [2]=Red, [1]=Yellow, [0]=Green
);

    // State Encoding
    parameter S_NS_GREEN  = 2'b00;
    parameter S_NS_YELLOW = 2'b01;
    parameter S_EW_GREEN  = 2'b10;
    parameter S_EW_YELLOW = 2'b11;

    reg [1:0] state, next_state;
    reg [3:0] counter; // Timer for state delays

    // State Transition & Timer Logic
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= S_NS_GREEN;
            counter <= 0;
        end else begin
            if (counter < 4'd10) begin // Delay logic for demonstration
                counter <= counter + 1;
            end else begin
                counter <= 0;
                state <= next_state;
            end
        end
    end

    // Next State Logic
    always @(*) begin
        case (state)
            S_NS_GREEN:  next_state = S_NS_YELLOW;
            S_NS_YELLOW: next_state = S_EW_GREEN;
            S_EW_GREEN:  next_state = S_EW_YELLOW;
            S_EW_YELLOW: next_state = S_NS_GREEN;
            default:     next_state = S_NS_GREEN;
        endcase
    end

    // Output Logic
    always @(*) begin
        // Default safe state (both Red)
        north_south = 3'b100;
        east_west   = 3'b100;

        case (state)
            S_NS_GREEN: begin
                north_south = 3'b001; // NS Green
                east_west   = 3'b100; // EW Red
            end
            S_NS_YELLOW: begin
                north_south = 3'b010; // NS Yellow
                east_west   = 3'b100; // EW Red
            end
            S_EW_GREEN: begin
                north_south = 3'b100; // NS Red
                east_west   = 3'b001; // EW Green
            end
            S_EW_YELLOW: begin
                north_south = 3'b100; // NS Red
                east_west   = 3'b010; // EW Yellow
            end
        endcase
    end

endmodule
