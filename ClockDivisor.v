module ClockDivisor (
	input clk,
	output clk1,
	output clk13,
	output clk16,
	output clk21,
	output reg clk_one_sec
);

reg [26:0] count;

always @ (posedge clk) begin
	if (count < 27'd99_999_999)
		count <= count + 1;
	else 
		count <= 0;
end 

always @ (posedge clk) begin
	if (count < 27'd50_000_000) 
		clk_one_sec <= 0;
	else 
		clk_one_sec <= 1;
end

assign clk1 = count[1];
assign clk13 = count[12];
assign clk16 = count[15];
assign clk21 = count[20];

endmodule