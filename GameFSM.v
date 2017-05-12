module GameFSM (
	input clk16,
	input clk_one_sec,
	input rst,
	input key_enter,
	input [7:0] p1HP,
	input [7:0] p2HP,
	input [3:0] BCD0,
	input [3:0] BCD1,
	output reg [1:0] p1win,
	output reg [1:0] p2win,
	output reg [2:0] state
);

parameter [2:0] MENU  = 3'b000;
parameter [2:0] GAME  = 3'b001;
parameter [2:0] P1WIN = 3'b010;
parameter [2:0] P2WIN = 3'b011;
parameter [2:0] TIE   = 3'b100;
parameter [2:0] PIONT = 3'b101;

reg [2:0] next_state;
reg [2:0] count, next_count;
reg [1:0] next_p1win, next_p2win;

wire clk;

assign clk = (state == P1WIN || state == P2WIN || state == TIE) ? clk_one_sec : clk16;

always @(posedge clk, posedge rst) begin
	if (rst) begin
		state <= MENU;
		count <= 0;
		p1win <= 0;
		p2win <= 0;
	end else begin
		state <= next_state;
		count <= next_count;
		p1win <= next_p1win;
		p2win <= next_p2win;
	end
end

always @(*) begin
	case (state)
		MENU:
			if (key_enter) begin
				next_state = GAME;
				next_count = count;
				next_p1win = p1win;
				next_p2win = p2win;
			end else begin
				next_state = state;
				next_count = 0;
				next_p1win = 0;
				next_p2win = 0;
			end
		GAME:
			if (p1HP <= 0) begin
				next_state = P2WIN;
				next_count = count;
				next_p1win = p1win;
				next_p2win = p2win + 1;
			end else if (p2HP <= 0) begin
				next_state = P1WIN;
				next_count = count;
				next_p1win = p1win + 1;
				next_p2win = p2win;
			end else if (BCD0 == 0 && BCD1 == 0) begin
				next_state = TIE;
				next_count = count;
				next_p1win = p1win;
				next_p2win = p2win;
			end else begin
				next_state = state;
				next_count = count;
				next_p1win = p1win;
				next_p2win = p2win;
			end 
		P1WIN:
			if (count == 5) begin
				if (p1win == 2) begin
					next_state = PIONT;
					next_count = count;
					next_p1win = p1win;
					next_p2win = p2win;
				end else begin
					next_state = GAME;
					next_count = 0;
					next_p1win = p1win;
					next_p2win = p2win;
				end
			end else begin
				next_state = state;
				next_count = count + 1;
				next_p1win = p1win;
				next_p2win = p2win;
			end
		P2WIN:
			if (count == 5) begin
				if (p2win == 2) begin
					next_state = PIONT;
					next_count = count;
					next_p1win = p1win;
					next_p2win = p2win;
				end else begin
					next_state = GAME;
					next_count = 0;
					next_p1win = p1win;
					next_p2win = p2win;
				end
			end else begin
				next_state = state;
				next_count = count + 1;
				next_p1win = p1win;
				next_p2win = p2win;
			end
		TIE:
			if (count == 5) begin
				next_state = GAME;
				next_count = 0;
				next_p1win = p1win;
				next_p2win = p2win;
			end else begin
				next_state = state;
				next_count = count + 1;
				next_p1win = p1win;
				next_p2win = p2win;
			end
		PIONT:
			if (key_enter) begin
				next_state = MENU;
				next_count = 0;
				next_p1win = 0;
				next_p2win = 0;
			end else begin
				next_state = state;
				next_count = count;
				next_p1win = p1win;
				next_p2win = p2win;
			end
		default: begin
			next_state = state;
			next_count = count;
			next_p1win = p1win;
			next_p2win = p2win;
		end
	endcase
end

endmodule