
class weird_monitor extends uvm_monitor;
  `uvm_component_utils(weird_monitor)
  
  // --- Monitor Components --- //
  virtual weird_interface vif;
  weird_sequence_item item;
  
  uvm_analysis_port #(weird_sequence_item) monitor_port;
  
  // --- Constructor --- //
  function new(string name = "weird_monitor", uvm_component parent);
    super.new(name, parent);
    `uvm_info("MONITOR_CLASS", "Inside Constructor", UVM_HIGH)
  endfunction: new
  
  // --- Build Phase --- //
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("MONITOR_CLASS", "Build Phase", UVM_HIGH)
    
    // --- Build Monitor Port --- //
    monitor_port = new("monitor_port", this);
    
    // --- Virtual Interface Failure --- //
    if(!(uvm_config_db #(virtual weird_interface)::get(this, "*", "vif", vif))) begin
      `uvm_error("MONITOR_CLASS", "Failed to get virtual interface")
    end
    
  endfunction: build_phase
  
  // --- Connect Phase --- //
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("MONITOR_CLASS", "Connect Phase", UVM_HIGH)
    
  endfunction: connect_phase
  
  // --- Run Phase --- //
  task run_phase (uvm_phase phase);
    super.run_phase(phase);
    `uvm_info("MONITOR_CLASS", "Inside Run Phase!", UVM_HIGH)
    
    // --- Capture DUT Interface --- //
    forever begin
      item = weird_sequence_item::type_id::create("item");
      
      wait(vif.n_rst);
      
      // --- Input Sample --- //
      @(posedge vif.clk);
      item.en  = vif.en;
      item.foo = vif.foo;
      item.bar = vif.bar;
      
      // --- Output Sample --- //
      @(posedge vif.clk);
      item.foo_and_bar  = vif.foo_and_bar;  
      item.foo_or_bar   = vif.foo_or_bar;
      item.foo_xor_bar  = vif.foo_xor_bar;
      item.foo_nand_bar = vif.foo_nand_bar;

      // --- Send to Scoreboard --- //
      monitor_port.write(item);
    end
        
  endtask: run_phase
  
endclass: weird_monitor