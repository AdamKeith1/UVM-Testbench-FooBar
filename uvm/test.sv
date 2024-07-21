class weird_test extends uvm_test;
  `uvm_component_utils(weird_test)

  // --- Test Components --- //
  weird_env env;
  weird_base_sequence reset_seq;
  weird_test_sequence test_seq;

  // --- Clocking --- //
  parameter CLK_PERIOD = 4;

  // --- Constructor --- //
  function new(string name = "weird_test", uvm_component parent);
    super.new(name, parent);
    `uvm_info("TEST_CLASS", "Inside Constructor", UVM_HIGH)
  endfunction: new
  
  // --- Build Phase --- //
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("TEST_CLASS", "Build Phase", UVM_HIGH)

    // --- Build Environment --- //
    env = weird_env::type_id::create("env", this);

  endfunction: build_phase

  // --- Connect Phase --- //
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info("TEST_CLASS", "Connect Phase!", UVM_HIGH)

  endfunction: connect_phase

  // --- Test Procedure --- //
  task run_phase (uvm_phase phase);
    super.run_phase(phase);
    `uvm_info("TEST_CLASS", "Run Phase", UVM_HIGH)

    phase.raise_objection(this);

    // --- Reset Sequence - to prime DUT --- //
    reset_seq = weird_base_sequence::type_id::create("reset_seq");
    reset_seq.start(env.agnt.seqr);
    #(2 * CLK_PERIOD);

    // --- Normal Operation --- //
    repeat(50 * CLK_PERIOD) begin
      // --- Test Sequence --- //
      test_seq = weird_test_sequence::type_id::create("test_seq");
      test_seq.start(env.agnt.seqr);
      #(2 * CLK_PERIOD);
    end
    
    phase.drop_objection(this);

  endtask: run_phase

endclass: weird_test