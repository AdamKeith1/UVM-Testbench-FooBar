

class weird_scoreboard extends uvm_test;
  `uvm_component_utils(weird_scoreboard)
  
  uvm_analysis_imp #(weird_sequence_item, weird_scoreboard) scoreboard_port;
  
  weird_sequence_item transactions[$];
  
  
  // --- Constructor --- //
  function new(string name = "weird_scoreboard", uvm_component parent);
    super.new(name, parent);
    `uvm_info("SCB_CLASS", "Inside Constructor!", UVM_HIGH)
  endfunction: new
  
  // --- Build Phase --- //
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("SCB_CLASS", "Build Phase!", UVM_HIGH)
   
    scoreboard_port = new("scoreboard_port", this);
    
  endfunction: build_phase
  
  // --- Connect Phase --- //
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("SCB_CLASS", "Connect Phase!", UVM_HIGH)
   
  endfunction: connect_phase
  
  // --- Write Method --- //
  function void write(weird_sequence_item item);
    transactions.push_back(item);
  endfunction: write 
  
  // --- Run Phase --- //
  task run_phase (uvm_phase phase);
    super.run_phase(phase);
    `uvm_info("SCB_CLASS", "Run Phase!", UVM_HIGH)
   
    forever begin
      weird_sequence_item curr_trans;
      wait((transactions.size() != 0));
      curr_trans = transactions.pop_front();
      compare(curr_trans);
    end
    
  endtask: run_phase
  
  
  // --- Compare --- //
  task compare(weird_sequence_item curr_trans);
    
    logic [3:0] act_foo_and_bar, exp_foo_and_bar;
    logic [3:0] act_foo_or_bar, exp_foo_or_bar;
    logic [3:0] act_foo_xor_bar, exp_foo_xor_bar;
    logic [3:0] act_foo_nand_bar, exp_foo_nand_bar;

    exp_foo_and_bar  = curr_trans.foo & curr_trans.bar;
    exp_foo_or_bar   = curr_trans.foo | curr_trans.bar;
    exp_foo_xor_bar  = curr_trans.foo ^ curr_trans.bar;
    exp_foo_nand_bar = ~(curr_trans.foo & curr_trans.bar);

    act_foo_and_bar  = curr_trans.foo_and_bar;
    act_foo_or_bar   = curr_trans.foo_or_bar;
    act_foo_xor_bar  = curr_trans.foo_xor_bar;
    act_foo_nand_bar = curr_trans.foo_nand_bar;

    // --- Comparisons --- ///    
    if(act_foo_and_bar != exp_foo_and_bar) begin
      `uvm_error("COMPARE", $sformatf("Transaction failed! ACT=%d, EXP=%d", act_foo_and_bar, exp_foo_and_bar))
    end
    else begin
      `uvm_info("COMPARE", $sformatf("Transaction Passed! ACT=%d, EXP=%d", act_foo_and_bar, exp_foo_and_bar), UVM_LOW)
    end

    if(act_foo_or_bar != exp_foo_or_bar) begin
      `uvm_error("COMPARE", $sformatf("Transaction failed! ACT=%d, EXP=%d", act_foo_or_bar, exp_foo_or_bar))
    end
    else begin
      `uvm_info("COMPARE", $sformatf("Transaction Passed! ACT=%d, EXP=%d", act_foo_or_bar, exp_foo_or_bar), UVM_LOW)
    end

    if(act_foo_xor_bar != exp_foo_xor_bar) begin
      `uvm_error("COMPARE", $sformatf("Transaction failed! ACT=%d, EXP=%d", act_foo_xor_bar, exp_foo_xor_bar))
    end
    else begin
      `uvm_info("COMPARE", $sformatf("Transaction Passed! ACT=%d, EXP=%d", act_foo_xor_bar, exp_foo_xor_bar), UVM_LOW)
    end

    if(act_foo_nand_bar != exp_foo_nand_bar) begin
      `uvm_error("COMPARE", $sformatf("Transaction failed! ACT=%d, EXP=%d", act_foo_nand_bar, exp_foo_nand_bar))
    end
    else begin
      `uvm_info("COMPARE", $sformatf("Transaction Passed! ACT=%d, EXP=%d", act_foo_nand_bar, exp_foo_nand_bar), UVM_LOW)
    end

  endtask: compare
  
  
endclass: weird_scoreboard