class weird_sequence_item extends uvm_sequence_item;
  `uvm_object_utils(weird_sequence_item)

  // --- Instantiation --- //
  rand logic n_rst;
  rand logic en;
  
  randc logic [3:0] foo;
  randc logic [3:0] bar;
  
  logic [3:0] foo_and_bar;
  logic [3:0] foo_or_bar;
  logic [3:0] foo_xor_bar;
  logic [3:0] foo_nand_bar;
  
  // --- Constraints --- ///
  constraint ctrl_sig_dist {
    n_rst dist {0:/5, 1:/95};
    en    dist {0:/5, 1:/95};
  }

  // --- Constructor --- //
  function new(string name = "weird_sequence_item");
    super.new(name);
  endfunction: new

endclass: weird_sequence_item