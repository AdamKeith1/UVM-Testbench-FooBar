class weird_sequencer extends uvm_sequencer#(weird_sequence_item);
  `uvm_component_utils(weird_sequencer)
  
  // --- Constructor --- //
  function new(string name = "weird_sequencer", uvm_component parent);
    super.new(name, parent);
    `uvm_info("SEQR_CLASS", "Inside Constructor", UVM_HIGH)
  endfunction: new
  
  // --- Build Phase --- //
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("SEQR_CLASS", "Build Phase", UVM_HIGH)
    
  endfunction: build_phase
  
  // --- Connect Phase --- //
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("SEQR_CLASS", "Connect Phase", UVM_HIGH)
    
  endfunction: connect_phase
  
endclass: weird_sequencer