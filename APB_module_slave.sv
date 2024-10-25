module APB_Module_Slave(PCLK,PRESET,PRDATA,PSEL,PENABLE,PADDR,PWRITE,PWDATA,PREADY);

  parameter STATE_IDLE = 2'b00, STATE_SETUP = 2'b01, STATE_ACCESS = 2'b10;

  input     PCLK,PRESET;
  input     PSEL,PENABLE,PWRITE;
  input     [7:0] PWDATA;
  input     [2:0] PADDR;
  output reg[7:0] PRDATA; 
  output reg PREADY;
  reg       [1:0] current_state, next_state;
  reg       [7:0] memory [7:0];

  always@ (posedge PCLK) begin
    if (PRESET == 1)
	   current_state <= STATE_IDLE;
	 else
	   current_state <= next_state; 
	end
 
  always@ (current_state) begin
   
   case (current_state)
	  STATE_IDLE:                              
          next_state = STATE_SETUP;	
      STATE_SETUP: begin
         if (PWRITE == 1)		  
           next_state =  STATE_ACCESS; 
		 else 
		   next_state = STATE_ACCESS;
       end
	  STATE_ACCESS:begin
			if (PWRITE == 0) begin
			  PRDATA = memory[PADDR];
			  PREADY = 1;
			  next_state = STATE_SETUP; 
			  end		        
		   else if (PWRITE == 1) begin
              memory[PADDR] = PWDATA;
			  PREADY = 1;
			  next_state = STATE_SETUP;
		     end 
		end
	endcase 

  end

endmodule
	