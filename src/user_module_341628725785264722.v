/* Automatically generated from https://wokwi.com/projects/341628725785264722 */

`default_nettype none

module user_module_341628725785264722(
  input [7:0] io_in,
  output [7:0] io_out
);

wire clk, rst_n;

assign clk = io_in[0];
assign rst_n = io_in[1];
  
reg [7 : 0] data;
assign io_out = data;

always @ (posedge clk or posedge rst_n) begin
  if (rst_n) begin
    data <= 'b0;
  end
  else begin
    data <= data + 1'b1;
  end
end    

endmodule
