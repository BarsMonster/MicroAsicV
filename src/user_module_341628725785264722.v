/* Automatically generated from https://wokwi.com/projects/341628725785264722 */

`default_nettype none

module user_module_341628725785264722(
  input [7:0] io_in,
  output [7:0] io_out
);

wire clk, rst_n, shift_clk, shift_dta;

assign clk = io_in[0];
assign rst_n = io_in[1];
assign shift_clk = io_in[2];
assign shift_dta = io_in[3];


/*Shift register chain, 128-bit*/
reg [127:0] shifter;

always @(posedge shift_clk)
begin
    shifter[127:1] <= shifter[126:0];
    shifter[0]   <= shift_dta;
end



  
reg [7 : 0] data;
assign io_out = data;
assign io_out[7] = shifter[127];

always @ (posedge clk or posedge rst_n) begin
  if (rst_n) begin
    data <= 'b0;
  end
  else begin
    data <= data + 1'b1;
  end
end
    

endmodule
