module vote (clock, reset, mode, vv1, vv2, vv3, vv4, count1, count2, count3, count4);

input clock;
input reset;
input mode;
input vv1, vv2, vv3, vv4; //vv = valid vote 

output reg [7:0] count1 , count2, count3 , count4; //8 bit reg to store vote 

always @ (posedge clock)
begin 
if (reset)
begin 
    count1 <= 8'd0;
    count2 <= 8'd0;
    count3 <= 8'd0;
    count4 <= 8'd0;
end 

else 
begin 

if (vv1 && mode == 1'b0)
count1 <= count1 + 1;

else if (vv2 && mode == 1'b0)
count2 <= count2 + 1;

else if (vv3 && mode == 1'b0)
count3 <= count3 + 1;

else if (vv4 && mode == 1'b0)
count4 <= count4 + 1;

end 

end 
endmodule