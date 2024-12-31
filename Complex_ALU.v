module Complex_ALU (
input signed [15:0] input1, input2, 
input3, input4, // a,b,c,d respectively
input clk, input valid,
output reg signed [15:0] y_3, z_3, y_4, 
z_4, w, x
);
 // 4-multiplier configuration
 reg signed [31:0] m1, m2, m3, m4;
 // 3-multiplier configuration
 reg signed [31:0] m1_opt, m2_opt, 
m3_opt;
//Addition
always @(posedge clk) begin
 if (valid) begin
 w <= input1 + input3; // real part 
 x <= input2 + input4; // imaginary part
 end
 end
 // Multiplication with 4 multipliers
 always @(posedge clk) begin
 if (valid) begin
 m1 <= input1 * input3; // ac
 m2 <= input2 * input4; // bd
 m3 <= input1 * input4; // ad
 m4 <= input2 * input3; // bc
 y_4 <= m1 - m2; // real part 
 z_4 <= m3 + m4; //imaginary 
part 
 end
 end
 // Multiplication with 3 multipliers 
(Optimized)
 always @(posedge clk) begin
 if (valid) begin
 m1_opt <= input1 * input3; 
 m2_opt <= input2 * input4; 
 m3_opt <= (input1 + input2) * 
(input3 + input4); //(a+b)(c+d)
 y_3 <= m1_opt - m2_opt; 
 z_3 <= m3_opt - m1_opt -
m2_opt;
 end
 end
endmodule
