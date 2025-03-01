class weird_driver extends uvm_driver#(weird_sequence_item);
  `uvm_component_utils(weird_driver)
  
  // --- Virtual Interface + Sequence Item --- //
  virtual weird_interface vif;
  weird_sequence_item item;
  
  // --- Constructor --- //
  function new(string name = "weird_driver", uvm_component parent);
    super.new(name, parent);
    `uvm_info("DRIVER_CLASS", "Inside Constructor", UVM_HIGH)
  endfunction: new
  
  // --- Build Phase --- //
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("DRIVER_CLASS", "Build Phase", UVM_HIGH)
    
    // --- Virtual Interface Failure --- //
    if(!(uvm_config_db #(virtual weird_interface)::get(this, "*", "vif", vif))) begin
      `uvm_error("DRIVER_CLASS", "Failed to get virtual interface")
    end
    
  endfunction: build_phase
  
  // --- Connect Phase --- //
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("DRIVER_CLASS", "Connect Phase", UVM_HIGH)
    
  endfunction: connect_phase
  
  // --- Run Phase --- //
  task run_phase (uvm_phase phase);
    super.run_phase(phase);
    `uvm_info("DRIVER_CLASS", "Inside Run Phase", UVM_HIGH)
    
    // --- Sequence Item Queue --- //
    forever begin
      item = weird_sequence_item::type_id::create("item"); 
      seq_item_port.get_next_item(item);
      drive(item);
      seq_item_port.item_done();
    end
    
  endtask: run_phase
  
  // --- Drive Virtual Interface --- //
  task drive(weird_sequence_item item);
    @(posedge vif.clk);
    vif.n_rst <= item.n_rst;
    vif.en    <= item.en;
    vif.foo   <= item.foo;
    vif.bar   <= item.bar;

  endtask: drive
  
endclass: weird_driver