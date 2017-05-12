module P2ArmsGen (
	input clk16,
	input clk21,
	input rst,
	input key_2,
	input [2:0] state,
	input [6:0] p1LocationX,
	input [6:0] p1LocationY,
	input [6:0] p2LocationX,
	input [6:0] p2LocationY,
	output reg [6:0] p2ArmsX,
	output reg [6:0] p2ArmsY,
	output reg [7:0] p1HP
);

parameter [2:0] MENU  = 3'b000;
parameter [2:0] GAME  = 3'b001;
parameter [2:0] P1WIN = 3'b010;
parameter [2:0] P2WIN = 3'b011;
parameter [2:0] TIE   = 3'b100;
parameter [2:0] PIONT = 3'b101;

parameter maxHeight = 180;
parameter ground = 80;
parameter grass = 10;
parameter ch_wide = 30;
parameter ch_height = 50;
parameter arms_side = 20;
parameter gap = 20;

parameter READY = 100;
parameter ATTACK_UP = 200;
parameter ATTACK_DOWN = 300;

reg [6:0] next_p2ArmsX, next_p2ArmsY;
reg [7:0] next_p1HP;
reg [9:0] armstate, next_armstate;

wire clk;

assign clk = (armstate == ATTACK_UP || armstate == ATTACK_DOWN) ? clk21 : clk16;

always @(posedge clk, posedge rst) begin
	if (rst) begin
		armstate <= READY;
		p2ArmsX <= p2LocationX;
		p2ArmsY <= p2LocationY;
		p1HP <= 100;
	end else begin
		armstate <= next_armstate;
		p2ArmsX <= next_p2ArmsX;
		p2ArmsY <= next_p2ArmsY;
		p1HP <= next_p1HP;
	end
end

always @(*) begin
	case (state)
		MENU: begin
			next_armstate = READY;
			next_p2ArmsX = p2LocationX;
			next_p2ArmsY = p2LocationY;
			next_p1HP = 100;
		end
		GAME: begin
			case (armstate) 
				READY:
					if (key_2) begin
						next_armstate = ATTACK_UP;
						next_p2ArmsX = p2ArmsX;
						next_p2ArmsY = p2ArmsY;
						next_p1HP = p1HP;
					end else begin 
						next_armstate = armstate;
						next_p2ArmsX = p2LocationX;
						next_p2ArmsY = p2LocationY;
						next_p1HP = p1HP;
					end
				ATTACK_UP: 
					if (10*p2ArmsY <= 480-ground-grass-maxHeight) begin
						next_armstate = ATTACK_DOWN;
						next_p2ArmsX = p2ArmsX - 1;
						next_p2ArmsY = p2ArmsY;
						next_p1HP = p1HP;
					end else begin
						next_armstate = armstate;
						next_p2ArmsX = p2ArmsX - 1;
						next_p2ArmsY = p2ArmsY - 1;
						next_p1HP = p1HP;
					end
				ATTACK_DOWN:
					if (10*p2ArmsY >= 10*p1LocationY-arms_side && 10*p2ArmsY <= 10*p1LocationY+ch_height-arms_side 
						&& 10*p2ArmsX >= 10*p1LocationX-arms_side+1 && 10*p2ArmsX <= 10*p1LocationX+ch_wide) begin
						if (p1HP > 0) begin
							next_armstate = READY;
							next_p2ArmsX = p2LocationX;
							next_p2ArmsY = p2LocationY;
							next_p1HP = p1HP - 10;
						end else begin
							next_armstate = READY;
							next_p2ArmsX = p2LocationX;
							next_p2ArmsY = p2LocationY;
							next_p1HP = p1HP;
						end
					end else if (10*p2ArmsX <= gap || 10*p2ArmsY >= 480-ground-grass) begin
						next_armstate = READY;
						next_p2ArmsX = p2LocationX;
						next_p2ArmsY = p2LocationY;
						next_p1HP = p1HP;
					end else begin
						next_armstate = armstate;
						next_p2ArmsX = p2ArmsX - 1;
						next_p2ArmsY = p2ArmsY + 1;
						next_p1HP = p1HP;
					end
				default: begin
					next_armstate = armstate;
					next_p2ArmsX = p2ArmsX;
					next_p2ArmsY = p2ArmsY;
					next_p1HP = p1HP;
				end 
			endcase
		end
		P1WIN: begin
			next_armstate = READY;
			next_p2ArmsX = p2LocationX;
			next_p2ArmsY = p2LocationY;
			next_p1HP = 100;
		end
		P2WIN: begin
			next_armstate = READY;
			next_p2ArmsX = p2LocationX;
			next_p2ArmsY = p2LocationY;
			next_p1HP = 100;
		end
		TIE: begin
			next_armstate = READY;
			next_p2ArmsX = p2LocationX;
			next_p2ArmsY = p2LocationY;
			next_p1HP = 100;
		end
		PIONT: begin
			next_armstate = READY;
			next_p2ArmsX = p2LocationX;
			next_p2ArmsY = p2LocationY;
			next_p1HP = 100;
		end
		default: begin
			next_armstate = READY;
			next_p2ArmsX = p2LocationX;
			next_p2ArmsY = p2LocationY;
			next_p1HP = 100;
		end
	endcase
end

endmodule