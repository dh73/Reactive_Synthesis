`default_nettype none
module clock_en
  (input wire clk, rstn,
   output logic tick_en);

   var logic [31:0] tmpreg;
   
   always_ff @(posedge clk)
     begin
	if (~rstn)
	  begin
	     tmpreg <= 0;
	     tick_en <= 0;
	  end
	else
	  begin
	     if (tmpreg == 6000000)
	       begin
		  tick_en <= ~tick_en;
		  tmpreg <= 0;
	       end
	     else
	       tmpreg <= tmpreg + 1'b1;
	  end // else: !if(~rstn)
     end // always_ff @ (posedge clk)
endmodule // clock_en
`default_nettype wire
