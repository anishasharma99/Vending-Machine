`timescale 1ns / 1ps

module vending_machine(clk , rst , coin , out , change );
input wire clk , rst ;
input wire[1:0]coin;
output reg out , change;

parameter [1:0] S0 = 2'b00 ;
parameter [1:0] S5 = 2'b01 ;
parameter [1:0] S10 = 2'b11 ;
parameter [1:0] S15 = 2'b10 ;

reg[1:0] current_state;
reg[1:0] next_state;

always@(posedge clk )
    begin
        if(rst ==1)
            current_state <= S0;
        else
            current_state <= next_state;
    end
    
always@(coin ,current_state)
begin
case(current_state)
    S0 : begin
            if(coin == 2'b00)
            begin
                next_state <= S0 ;
                out<= 1'b0 ;
                change <= 1'b0 ;
                end
             else if (coin== 2'b10)
             begin
             next_state <= S5;
             out <= 1'b0;
             change <= 1'b0 ;
             end
              else if (coin== 2'b11)
              begin
                         next_state <= S10;
                         out <= 1'b0;
                         change <= 1'b0 ;
                         end 
                         end
  S5 : begin
                                    if(coin == 2'b00)
                                    begin
                                        next_state <= S5 ;
                                        out<= 1'b0 ;
                                        change <= 1'b0 ;
                                        end
                                     else if (coin== 2'b10)
                                     begin
                                     next_state <= S10;
                                     out <= 1'b0;
                                     change <= 1'b0 ;
                                     end
                                      else if (coin== 2'b11)
                                                 begin
                                                 next_state <= S15;
                                                 out <= 1'b1;
                                                 change <= 1'b0 ;
                                                 end 
                                                 end
 S10 : begin
 if(coin == 2'b00)
 begin
 next_state <= S10 ;
 out<= 1'b0 ;
 change <= 1'b0 ;
 end
 else if (coin== 2'b10)
 begin
 next_state <= S15 ;
 out <= 1'b1;
 change <= 1'b0 ;
 end
 else if (coin== 2'b11)
 begin
 next_state <= S15;
 out <= 1'b1;
 change <= 1'b1 ;
end 
end                                                           
                                                                         
S15 : begin
out <= 1'b1;
next_state <= S0 ;
end
endcase
end 
             
             
endmodule
