`timescale 1ns/1ps

module tb_voting_machine;

reg clock;
reg reset;
reg mode;
reg button1;
reg button2;
reg button3;
reg button4;

wire [7:0] count1;
wire [7:0] count2;
wire [7:0] count3;
wire [7:0] count4;

// Instantiate top module
top dut (
    .clock(clock),
    .reset(reset),
    .mode(mode),
    .button1(button1),
    .button2(button2),
    .button3(button3),
    .button4(button4),
    .count1(count1),
    .count2(count2),
    .count3(count3),
    .count4(count4)
);

// Clock generation
initial begin
    clock = 0;
    forever #5 clock = ~clock;
end

// Stimulus
initial begin
    // Initial values
    reset   = 1;
    mode    = 0;
    button1 = 0;
    button2 = 0;
    button3 = 0;
    button4 = 0;

    // Apply reset
    #20;
    reset = 0;

    // Vote for candidate 1
    $display("Voting for Candidate 1");
    button1 = 1; #100; button1 = 0;
    #20;

    // Vote for candidate 2
    $display("Voting for Candidate 2");
    button2 = 1; #100; button2 = 0;
    #20;

    // Vote for candidate 3
    $display("Voting for Candidate 3");
    button3 = 1; #100; button3 = 0;
    #20;

    // Vote for candidate 4
    $display("Voting for Candidate 4");
    button4 = 1; #100; button4 = 0;
    #20;

    // Switch to result mode
    $display("Switching to RESULT MODE");
    mode = 1;

    // Try voting again (should not count)
    button1 = 1; #100; button1 = 0;
    #20;

    // Final results
    $display("FINAL COUNTS:");
    $display("C1=%0d C2=%0d C3=%0d C4=%0d",
              count1, count2, count3, count4);

    #20;
    $finish;
end

// Waveform dump
initial begin
    $dumpfile("voting_machine.vcd");
    $dumpvars(0, tb_voting_machine);
end

endmodule
