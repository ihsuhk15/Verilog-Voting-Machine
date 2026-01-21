module button_control (clock, button, reset, valid);

input clock;
input button;
input reset;

output reg valid;

reg [31:0] counter;

//counter block
always @ (posedge clock)
 begin 
    if (reset)
    counter <= 0;

    else 
    begin 
        if (button && counter < 11)
        counter <= counter + 1;

        else if (!button)
        counter <= 0;
    end
 end 

//valid block
always @ (posedge clock)

begin 
 if (reset) 
 valid <= 1'b0;

 else 
 begin 
    if (counter == 10)
    valid <= 1'b1;
    
    else 
    valid <= 1'b0;
 end

end 

endmodule