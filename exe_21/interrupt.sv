module interrupt (
	input logic clk_i,
	input logic rst_ni,

	input logic p0_i,
	input logic p1_i, 
	input logic p2_i, 
	input logic p3_i, 

	output logic intr_o,
	output logic [1:0] x_o
);
	logic intr;
	logic [1:0] x;

	assign intr = (p3_i | p2_i | p1_i | p0_i);

	always_comb begin
		if (p3_i==1)begin
			x = 2'b11;
		end
		else if(p2_i==1)begin
			x = 2'b10;
		end
		else if(p1_i==1)begin
			x = 2'b01;
		end
		else begin
			x=2'b00;
		end
	end

	always_ff @(posedge clk_i or negedge rst_ni) begin
		if(!rst_ni) begin
			intr_o <= '0;
			x_o <= '0;
		end else begin
			intr_o <= intr;
			x_o    <= x;
		end
	end

endmodule