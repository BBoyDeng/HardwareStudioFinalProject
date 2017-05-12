module ButtonCtrl(
	output reg key_a,
	output reg key_s,
	output reg key_d,
	output reg key_1,
	output reg key_2,
	output reg key_3,
	output reg key_enter,
	inout PS2_DATA,
	inout PS2_CLK,
	input rst,
	input clk
);
	
	parameter [8:0] KEY_CODES [0:6] = {
		9'b0_0001_1100, // a => 1C
		9'b0_0001_1011, // s => 1B
		9'b0_0010_0011, // d => 23
		
		9'b0_0110_1001, // right_1 => 69
		9'b0_0111_0010, // right_2 => 72
		9'b0_0111_1010, // right_3 => 7A
		
		9'b0_0101_1010  // enter => 5A
	};
	
	reg [3:0] key_num;
	reg [9:0] last_key;

	wire [511:0] key_down;
	wire [8:0] last_change;
	wire been_ready;	
	
	KeyboardDecoder key_de (
		.key_down(key_down),
		.last_change(last_change),
		.key_valid(been_ready),
		.PS2_DATA(PS2_DATA),
		.PS2_CLK(PS2_CLK),
		.rst(rst),
		.clk(clk)
	);

	always @ (posedge clk or posedge rst) begin
		if (rst) begin
			key_a <= 0;
			key_s <= 0;
			key_d <= 0;
			key_1 <= 0;
			key_2 <= 0;
			key_3 <= 0;
			key_enter <= 0;
		end else begin
			key_a <= 0;
			key_s <= 0;
			key_d <= 0;
			key_1 <= 0;
			key_2 <= 0;
			key_3 <= 0;
			key_enter <= 0;
			if (been_ready && key_down[last_change] == 1'b1) begin
				if (key_num == 4'b0000) 
					key_a <= 1;
				else if (key_num == 4'b0001) 
					key_s <= 1;
				else if (key_num == 4'b0010) 
					key_d <= 1;
				else if (key_num == 4'b0011) 
					key_1 <= 1;
				else if (key_num == 4'b0100) 
					key_2 <= 1;
				else if (key_num == 4'b0101) 
					key_3 <= 1;
				else if (key_num == 4'b0110)
					key_enter <= 1;
			end
		end
	end
	
	always @ (*) begin
		case (last_change)
			KEY_CODES[00] : key_num = 4'b0000;
			KEY_CODES[01] : key_num = 4'b0001;
			KEY_CODES[02] : key_num = 4'b0010;
			KEY_CODES[03] : key_num = 4'b0011;
			KEY_CODES[04] : key_num = 4'b0100;
			KEY_CODES[05] : key_num = 4'b0101;
			KEY_CODES[06] : key_num = 4'b0110;
			default		  : key_num = 4'b1111;
		endcase
	end
	
endmodule
