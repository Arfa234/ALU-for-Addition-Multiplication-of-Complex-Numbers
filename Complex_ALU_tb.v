module Complex_ALU_tb;
 reg signed [15:0] input1, input2, 
input3, input4; 
 reg clk, valid;
 wire signed [15:0] y_3, z_3, y_4, z_4, 
w, x;
 Complex_VLSI uut (
 .input1(input1),.input2(input2), 
.input3(input3), .input4(input4),
 .clk(clk),
 .valid(valid),
 .y_3(y_3), .z_3(z_3), .y_4(y_4), 
.z_4(z_4), .w(w), .x(x)
 );
 // Test vectors and expected results
 integer i, errors;
 always #5 clk = ~clk; // clock =10ns 
 initial begin
 clk = 0;
 valid = 0;
 errors = 0;
 for (i = 0; i < 50; i = i + 1) 
begin 
//using random func to generate values 
 input1 = $random % 32768; 
 input2 = $random % 32768;
 input3 = $random % 32768;
 input4 = $random % 32768;
 valid = 1;
 @(posedge clk);
 valid = 0;
if (y_3 !== y_4 || z_3 !== z_4) begin
$display("Test failed at vector %d:", i);
$display("Inputs: input1=%d, 
input2=%d, input3=%d, input4=%d", 
input1, input2, input3, input4);
$display("3 multiplier: y=%d, z=%d, 
w=%d, x=%d", y_3, z_3, w, 
x);$display("4 multiplier: y=%d, 
z=%d, w=%d, x=%d", y_4, z_4, w, x);
errors = errors + 1;
 end
 end
 if (errors == 0) begin
 $display("All tests passed 
successfully.");
 end 
else 
begin $display("Number of failed tests: 
%d", errors);
 end
$finish; end
 endmodule
