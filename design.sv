module weird #(parameter BITS = 4) (
    input  logic clk,
    input  logic n_rst,
    input  logic en,
     
    input  logic [BITS-1:0] foo,
    input  logic [BITS-1:0] bar,

    output logic [BITS-1:0] foo_and_bar,
    output logic [BITS-1:0] foo_or_bar,
    output logic [BITS-1:0] foo_xor_bar,
    output logic [BITS-1:0] foo_nand_bar
);
    // --- Registers --- //
    logic [BITS-1:0] nxt_foo_and_bar;
    logic [BITS-1:0] nxt_foo_or_bar;
    logic [BITS-1:0] nxt_foo_xor_bar;
    logic [BITS-1:0] nxt_foo_nand_bar;

    // --- Flip Flop --- //
    always_ff @(posedge clk, negedge n_rst) begin : FF
        if (!n_rst) begin
            foo_and_bar  <= '0;
            foo_or_bar   <= '0;
            foo_xor_bar  <= '0;
            foo_nand_bar <= '0;
        end else begin
            foo_and_bar  <= nxt_foo_and_bar;
            foo_or_bar   <= nxt_foo_or_bar;
            foo_xor_bar  <= nxt_foo_xor_bar;
            foo_nand_bar <= nxt_foo_nand_bar;
        end
    end

    // --- Comb Logic --- //
    always_comb begin : COMB
        nxt_foo_and_bar  = foo_and_bar;
        nxt_foo_or_bar   = foo_or_bar;
        nxt_foo_xor_bar  = foo_xor_bar;
        nxt_foo_nand_bar = foo_nand_bar;
    
        if (en) begin
            nxt_foo_and_bar  = foo & bar;
            nxt_foo_or_bar   = foo | bar;
            nxt_foo_xor_bar  = foo ^ bar;
            nxt_foo_nand_bar = ~(foo & bar);
        end
    end

endmodule