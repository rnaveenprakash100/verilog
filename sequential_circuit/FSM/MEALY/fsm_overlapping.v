module fsm_1001_mealy(input clk,rst,x,output reg y);
localparam S0=2'b00,S1=2'b01,S2=2'b10,S3=2'b11;
reg[1:0]state,next_state;

always@(posedge clk or posedge rst)begin
 if(rst)
  state<=S0;
 else
  state<=next_state;
end

always@(*)begin
 y=0;
 case(state)
  S0:begin
   if(x)
    next_state=S1;
   else
    next_state=S0;
  end

  S1:begin
   if(x)
    next_state=S1;
   else
    next_state=S2;
  end

  S2:begin
   if(x)
    next_state=S1;
   else
    next_state=S3;
  end

  S3:begin
   if(x)begin
    next_state=S1;
    y=1;
   end
   else
    next_state=S0;
  end
  default:next_state=S0;
 endcase
end

endmodule
