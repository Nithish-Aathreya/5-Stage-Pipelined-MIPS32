`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.11.2024 18:33:47
// Design Name: 
// Module Name: verify
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module verify();
reg clk1,clk2;
integer k;
main mips(clk1,clk2);

initial
begin
clk1=1'b0;
clk2=1'b0;
repeat(20)
begin
#5 clk1=1'b1;#5 clk1=1'b0;
#5 clk2=1'b1;#5 clk2=1'b0;
end
end

initial
begin

for(k=0;k<32;k=k+1)
mips.registerbank[k]=k;

mips.mem[0]= 32'h00011000;

mips.halt=1'b0;
mips.pc=32'b0;
mips.taken_branch=1'b0;

#200
for(k=0;k<3;k=k+1)
$display("R%1d - R%h",k,mips.registerbank[k]);










end
endmodule
