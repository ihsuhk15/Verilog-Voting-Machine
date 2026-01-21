module top (clock, reset, mode, count1, count2, count3, count4, button1, button2, button3, button4);

input clock;
input reset;
input mode;
input button1;
input button2;
input button3;
input button4;
output [7:0] count1;
output [7:0] count2;
output [7:0] count3;
output [7:0] count4;

wire vv1, vv2, vv3, vv4;

button_control bc1 (
        .clock(clock),
        .reset(reset),
        .button(button1),
        .valid (vv1)
);

button_control bc2 (
        .clock(clock),
        .reset(reset),
        .button(button2),
        .valid (vv2)
);

button_control bc3 (
        .clock(clock),
        .reset(reset),
        .button(button3),
        .valid (vv3)
);

button_control bc4 (
        .clock(clock),
        .reset(reset),
        .button(button4),
        .valid (vv4)
);

vote vote_unit (
        .clock(clock),
        .reset(reset),
        .mode(mode),
        .vv1(vv1),
        .vv2(vv2),
        .vv3(vv3),
        .vv4(vv4),
        .count1(count1),
        .count2(count2),
        .count3(count3),
        .count4(count4)
);

//button → button_control → vv → vote → count

endmodule