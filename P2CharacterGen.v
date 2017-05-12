module P2CharacterGen (
	input clk,
	input rst,
	input key_1,
	input key_3,
	input [2:0] state,
	output reg [6:0] p2LocationX,
	output reg [6:0] p2LocationY
);

parameter [2:0] MENU  = 3'b000;
parameter [2:0] GAME  = 3'b001;
parameter [2:0] P1WIN = 3'b010;
parameter [2:0] P2WIN = 3'b011;
parameter [2:0] TIE   = 3'b100;
parameter [2:0] PIONT = 3'b101;

parameter river = 60;
parameter ch_wide = 30;
parameter gap = 20;

reg [6:0] next_p2LocationX;
reg [6:0] next_p2LocationY;

always @(posedge clk, posedge rst) begin
	if (rst) begin
		p2LocationX <= 57;
		p2LocationY <= 34;
	end else begin
		p2LocationX <= next_p2LocationX;
		p2LocationY <= next_p2LocationY;
	end
end

always @(*) begin
	case (state)
		MENU: begin
			next_p2LocationX = 57;
			next_p2LocationY = 34;
		end 
		GAME:
			if (key_1) begin
				if (10*p2LocationX > 640/2+river/2) begin
					next_p2LocationX = p2LocationX - 1;
					next_p2LocationY = p2LocationY;
				end else begin
					next_p2LocationX = p2LocationX;
					next_p2LocationY = p2LocationY;
				end 
			end else if (key_3) begin
				if (10*p2LocationX+ch_wide < 640-gap) begin
					next_p2LocationX = p2LocationX + 1;
					next_p2LocationY = p2LocationY;
				end else begin 
					next_p2LocationX = p2LocationX;
					next_p2LocationY = p2LocationY;
				end 
			end else begin
				next_p2LocationX = p2LocationX;
				next_p2LocationY = p2LocationY;
			end
		P1WIN: begin
			next_p2LocationX = 57;
			next_p2LocationY = 34;
		end 
		P2WIN: begin
			next_p2LocationX = 57;
			next_p2LocationY = 34;
		end 
		TIE: begin
			next_p2LocationX = 57;
			next_p2LocationY = 34;
		end 
		PIONT: begin
			next_p2LocationX = 57;
			next_p2LocationY = 34;
		end 
		default: begin
			next_p2LocationX = p2LocationX;
			next_p2LocationY = p2LocationY;
		end 
	endcase
end

endmodule 