interface weird_interface(input logic clk);

  logic n_rst;
  logic en;

  logic [3:0] foo;
  logic [3:0] bar;

  logic [3:0] foo_and_bar;
  logic [3:0] foo_or_bar;
  logic [3:0] foo_xor_bar;
  logic [3:0] foo_nand_bar;

endinterface: weird_interface