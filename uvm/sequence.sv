// --- Reset Packet --- //
class weird_base_sequence extends uvm_sequence;
  `uvm_object_utils(weird_base_sequence)
  
  weird_sequence_item reset_pkt;
  
  // --- Constructor --- //
  function new(string name= "weird_base_sequence");
    super.new(name);
    `uvm_info("BASE_SEQ", "Inside Constructor", UVM_HIGH)
  endfunction
  
  // --- Body Task --- //
  task body();
    `uvm_info("BASE_SEQ", "Inside body task", UVM_HIGH)
    
    // --- Randomize With Reset --- //
    reset_pkt = weird_sequence_item::type_id::create("reset_pkt");
    start_item(reset_pkt);
    reset_pkt.randomize() with {n_rst==0;};
    finish_item(reset_pkt);
        
  endtask: body
  
endclass: weird_base_sequence

// --- Normal Packet --- //
class weird_test_sequence extends weird_base_sequence;
  `uvm_object_utils(weird_test_sequence)
  
  weird_sequence_item item;
  
  // --- Constructor --- //
  function new(string name= "weird_test_sequence");
    super.new(name);
    `uvm_info("TEST_SEQ", "Inside Constructor", UVM_HIGH)
  endfunction
  
  // --- Body Task --- //
  task body();
    `uvm_info("TEST_SEQ", "Inside body task", UVM_HIGH)
    
    // --- Randomize --- //
    item = weird_sequence_item::type_id::create("item");
    start_item(item);
    item.randomize();
    finish_item(item);
        
  endtask: body
  
endclass: weird_test_sequence