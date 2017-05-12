module OnePulse (
	input clk,
	input pb_debounced,
	output reg pb_single_pulse
);

reg pb_debounced_delay;
	
always @(posedge clk) begin
	if (pb_debounced==1'b1 & pb_debounced_delay==1'b0) begin
		pb_single_pulse <= 1'b1;
	end else begin
		pb_single_pulse <= 1'b0;
	end
	pb_debounced_delay <= pb_debounced;
end
	
endmodule