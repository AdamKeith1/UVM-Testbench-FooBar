`timescale 1ns/1ns

import uvm_pkg::*;
`include "uvm_macros.svh"

// --- Include Files --- //
`include "interface.sv"
`include "sequence_item.sv"
`include "sequence.sv"
`include "sequencer.sv"
`include "driver.sv"
`include "monitor.sv"
`include "agent.sv"
`include "scoreboard.sv"
`include "env.sv"
`include "test.sv"

module top;
  
  // --- Instantiation --- //

  logic clk;
  
  weird_interface intf(.clk(clk));
  
  weird dut(
    .clk(intf.clk) ,
    .n_rst(intf.n_rst),
    .en(intf.en),
    
    .foo(intf.foo),
    .bar(intf.bar),

    .foo_and_bar(intf.foo_and_bar),
    .foo_or_bar(intf.foo_or_bar),
    .foo_xor_bar(intf.foo_xor_bar),
    .foo_nand_bar(intf.foo_nand_bar)
  );
  
  // --- Interface Setting --- //
  initial begin
    uvm_config_db #(virtual weird_interface)::set(null, "*", "vif", intf );
  end
  
  // --- Start Test --- //
  initial begin
    run_test("weird_test");
  end
  
  // --- Clock Generation --- //
  // TODO: ugly clock gen block
  initial begin
    clk = 0;
    #5;
    forever begin
      clk = ~clk;
      #2;
    end
  end
  
  // --- Maximum Sim Duration --- //
  initial begin
    #5000;
    $display("Sorry! Ran out of clock cycles!");
    $finish();
  end
  
  // --- Generate Waveforms --- //
  initial begin
    $dumpfile("d.vcd");
    $dumpvars();
  end
  
endmodule: top