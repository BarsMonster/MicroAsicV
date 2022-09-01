/* Automatically generated from https://wokwi.com/projects/341628725785264722 */

`default_nettype none

module div4 ( clk ,rst, out_clk );
    output out_clk;
    input clk ;
    input rst;

    reg [1:0] data;
    assign out_clk = data[1];

    always @(posedge clk)
    begin
    if (rst)
         data <= 2'b0;
    else
         data <= data+1;	
    end
endmodule

module user_module_341628725785264722(
  input [7:0] io_in,
  output [7:0] io_out
);

wire clk, rst_n, shift_clk, shift_dta;
wire [2:0] clk_source;

assign clk = io_in[0];
assign rst_n = io_in[1];
assign shift_clk = io_in[2];
assign shift_dta = io_in[3];
assign clk_source[0] = io_in[4];
assign clk_source[1] = io_in[5];
assign clk_source[2] = io_in[6];


/*Shift register chain, 16-bit*/
reg [15:0] shifter;

always @(posedge shift_clk)
begin
    shifter[15:1] <= shifter[14:0];
    shifter[0]   <= shift_dta;
end

/*Clock sources*/
//0
wire c0_1 = clk;
wire c0_output;
div4 tmp0(c0_1, rst_n, c0_output);

//1
wire c1_1, c1_2, c1_3, c1_output;
assign c1_1 = c1_3 ^ shifter[0];
assign c1_2 = c1_1 ^ shifter[1];
assign c1_3 = c1_2 ^ shifter[2];
div4 tmp1(c1_3, rst_n, c1_output);

//2
wire c2_1, c2_2, c2_3, c2_4, c2_5, c2_output;
assign c2_1 = c2_5 ^ shifter[0];
assign c2_2 = c2_1 ^ shifter[1];
assign c2_3 = c2_2 ^ shifter[2];
assign c2_4 = c2_3 ^ shifter[3];
assign c2_5 = c2_4 ^ shifter[4];
div4 tmp2(c2_5, rst_n, c2_output);

/*Clock selector*/
reg selected_clock;
always @ (*) begin
    case (clk_source)
        3'b000 : selected_clock = c0_output;  
        3'b001 : selected_clock = c1_output;  
        3'b010 : selected_clock = c2_output;  
        3'b011 : selected_clock = clk;  
/*        3'b100 : selected_clock = c4_output;*/
        default: selected_clock = c0_output;
    endcase
end
  
reg [31 : 0] data;
assign io_out[0] = data[7];
assign io_out[1] = data[11];
assign io_out[2] = data[15];
assign io_out[3] = data[19];
assign io_out[4] = data[23];
assign io_out[5] = data[27];
assign io_out[6] = data[31];
assign io_out[7] = shifter[15];
//div4 tmp1(clk, rst_n, io_out[6]);

always @ (posedge selected_clock or posedge rst_n) begin
  if (rst_n) begin
    data <= 'b0;
  end
  else begin
    data <= data + 1'b1;
  end
end

endmodule
