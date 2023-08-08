module SIMCOMP (clock,PC, IR, MBR, AC, MAR);
 input clock ;
 output PC, IR, MBR, AC, MAR;
 reg [15:0] IR, MBR, AC;
 reg [11:0] PC, MAR;
 reg [15:0] Memory [0;63];
 reg [2:0] state;
  
  
  parameter load = 4'b0011, store = 4'b1011, add= 4'b0111;
  
  initial begin 
  
     Memory [10] = 16'h3020;
     Memory [11] = 16'h7021;
     Memory [12] = 16'hB014;
      
     Memory [32] = 16'd7;
     Memory [33] = 16'd5;
     
      PC = 10;
      state = 0;
  end 
  
  always @ (posedge clock) begin 
  case (state)
  0: begin 
      MAR <= PC;
      state=1;
      end
      
   1: begin 
       IR <=Memory[MAR];
       PC + 1;
       state=2 ;
       end
       
    2:begin 
       MAR <= IR[11:0];
       state= 3;
       end 
       
    3:begin
       state=4;    
       case (IR[15:12])
          load : MBR <=Memory[MAR];
          add : MBR <=Memory[MAR];
          store : MBR<=AC;
        endcase
        end
        
     4:begin
         if(IR[15:12]==4'h7) begin 
            AC<= AC+MBR;
            state = 0;
          end
			 else if (IR[15:12] == 4'h3) begin
			 AC <= MBR;
			 state =0;
			 end
			 else if (IR[15:12] == 4'hB) begin
			Memory[MBR] <= MBR;
			 state =0;
			 end
         end
        endcase
        end
endmodule
