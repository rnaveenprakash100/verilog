module SIPO_LS_register(input clk,rst,preset,s_in,output reg [3:0] p_out);
  reg [3:0]shift_reg;
  reg [2:0]count;
  always@(posedge clk) begin
    
    if(rst) begin
      shift_reg<=4'b0000;
      count<=0;
      p_out<=0;
    end
    
    else if (preset) begin
    shift_reg<=4'b1111;
    count<=0;
    p_out<=0;
    end
    
    else   begin
      shift_reg<={shift_reg[3:1],s_in};
      count<=count+1;
      if(count==3)
         p_out<={shift_reg[3:1],s_in};
    end
  end
endmodule
