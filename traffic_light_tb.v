`timescale 1ns / 1ps

module traffic_light_tb;

    // Inputs
    reg clk;
    reg rst;

    // Outputs
    wire [2:0] north_south;
    wire [2:0] east_west;

    // Instantiate the Unit Under Test (UUT)
    traffic_light uut (
        .clk(clk), 
        .rst(rst), 
        .north_south(north_south), 
        .east_west(east_west)
    );

    // Clock Generation
    always #5 clk = ~clk; // 10ns clock period

    initial begin
        // Initialize Inputs
        clk = 0;
        rst = 1;

        // Display header for the terminal output
        $display("Time\t rst\t NS_Light(RYG)\t EW_Light(RYG)");
        $monitor("%0t\t  %b\t     %b\t\t     %b", $time, rst, north_south, east_west);

        // Wait 20 ns for global reset to finish
        #20;
        rst = 0; // Release reset

        // Run simulation for enough time to see all state transitions
        #600;

        // End simulation
        $finish;
    end
      
endmodule
