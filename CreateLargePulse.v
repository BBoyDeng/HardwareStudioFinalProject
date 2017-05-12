module CreateLargePulse ( 
	output large_pulse,
	input small_pulse,
	input rst,
	input clk 
	);
	
	parameter PULSE_SIZE = 16;
	
	reg done;
	reg [PULSE_SIZE:0] num;

	always @(posedge clk or posedge rst) begin
		if (rst) begin
			done <= 1'b0;
			num  <= 0;
		end else begin
			if (small_pulse && !done) begin
				done <= 1'b1;
			end else if (done) begin
				if (num[PULSE_SIZE]) begin
					done <= 1'b0;
					num  <= 0;
				end else begin	
					num  <= num + 1'b1;
				end
			end
		end
	end

	assign large_pulse = (done && !num[PULSE_SIZE]) ? 1'b1 : 1'b0 ;
	
endmodule