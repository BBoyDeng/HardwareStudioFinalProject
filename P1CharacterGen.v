module P1CharacterGen (
	input clk,
	input rst,
	input key_a,
	input key_d,
	input [2:0] state,
	output reg [6:0] p1LocationX,
	output reg [6:0] p1LocationY
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

reg [6:0] next_p1LocationX;
reg [6:0] next_p1LocationY;

always @(posedge clk, posedge rst) begin
	if (rst) begin
		p1LocationX <= 4;
		p1LocationY <= 34;
	end else begin
		p1LocationX <= next_p1LocationX;
		p1LocationY <= next_p1LocationY;
	end
end

always @(*) begin
	case (state)
		MENU: begin
			next_p1LocationX = 4;
			next_p1LocationY = 34;
		end 
		GAME:
			if (key_d) begin
				if (10*p1LocationX+ch_wide < 640/2-river/2) begin
					next_p1LocationX = p1LocationX + 1;
					next_p1LocationY = p1LocationY;
				end else begin
					next_p1LocationX = p1LocationX;
					next_p1LocationY = p1LocationY;
				end
			end else if (key_a) begin
				if (10*p1LocationX > gap) begin
					next_p1LocationX = p1LocationX - 1;
					next_p1LocationY = p1LocationY;
				end else begin 
					next_p1LocationX = p1LocationX;
					next_p1LocationY = p1LocationY;
				end
			end else begin
				next_p1LocationX = p1LocationX;
				next_p1LocationY = p1LocationY;
			end
		P1WIN: begin
			next_p1LocationX = 4;
			next_p1LocationY = 34;
		end 
		P2WIN: begin
			next_p1LocationX = 4;
			next_p1LocationY = 34;
		end 
		TIE: begin
			next_p1LocationX = 4;
			next_p1LocationY = 34;
		end 
		PIONT: begin
			next_p1LocationX = 4;
			next_p1LocationY = 34;
		end 
		default: begin
			next_p1LocationX = p1LocationX;
			next_p1LocationY = p1LocationY;
		end 
	endcase
end

endmodule 