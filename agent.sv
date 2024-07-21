class weird_agent extends uvm_agent;
  `uvm_component_utils(weird_agent)
  
  weird_driver    drv;
  weird_monitor   mon;
  weird_sequencer seqr;
  
  // --- Constructor --- //
  function new(string name = "weird_agent", uvm_component parent);
    super.new(name, parent);
    `uvm_info("AGENT_CLASS", "Inside Constructor!", UVM_HIGH)
  endfunction: new
  
  // --- Build Phase --- //
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("AGENT_CLASS", "Build Phase!", UVM_HIGH)
    
    drv  = weird_driver::type_id::create("drv", this);
    mon  = weird_monitor::type_id::create("mon", this);
    seqr = weird_sequencer::type_id::create("seqr", this);
    
  endfunction: build_phase
  
  // --- Connect Phase --- //
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("AGENT_CLASS", "Connect Phase!", UVM_HIGH)
    
    drv.seq_item_port.connect(seqr.seq_item_export);
    
  endfunction: connect_phase
  
  // --- Run Phase --- //
  task run_phase (uvm_phase phase);
    super.run_phase(phase);
    
  endtask: run_phase
  
  
endclass: weird_agent