module self_check_tb ();
reg Ci; 
reg [3:0] A, B;

wire Co, PG, GG; 
wire [3:0] S;
CLA4 dut(A, B, Ci, S, Co, PG, GG);

initial begin
A = 4'b1111; B = 4'b1111; Ci = 1'b1; #10;
if (S !== 4'b1111 || Co !== 1'b1 || PG !== 1'b0 || GG !== 1'b1) $display("1111 + 1111 + 1 -> failed.");
else $display("1111 + 1111 + 1 -> success.");

A = 4'b1111; B = 4'b0000; Ci = 1'b1; #10;
if (S !== 4'b0000 || Co !== 1'b1 || PG !== 1'b1 || GG !== 1'b0) $display("1111 + 0000 + 1 -> failed.");
else $display("1111 + 0000 + 1 -> success.");

A = 4'b0110; B = 4'b0111; Ci = 1'b0; #10;
if (S !== 4'b1101 || Co !== 1'b0 || PG !== 1'b0 || GG !== 1'b0) $display("0110 + 0111 + 0 -> failed.");
else $display("0110 + 0111 + 0 -> success.");

A = 4'b1011; B = 4'b0111; Ci = 1'b1; #10;
if (S !== 4'b0011 || Co !== 1'b1 || PG !== 1'b0 || GG !== 1'b1) $display("1011 + 0111 + 1 -> failed.");
else $display("1011 + 0111 + 1 -> success.");

end
endmodule
