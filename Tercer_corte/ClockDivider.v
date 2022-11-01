// ClockDivider
module ClockDivider(
    input wire clk_in,
    output reg clk_out,
	 output wire clk
);

    time counter;
	 
	 assign clk = clk_in;

    initial begin
        clk_out = 1;
        counter = 0;
    end

    always @(posedge clk_in) begin
        counter = counter + 1;
        if (counter >= 1042) begin
            clk_out <= ~clk_out;
            counter <= 0;
        end
    end
endmodule 