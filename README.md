# UVM-Testbench-FooBar

UVM test-bench for a weird module. Adding covergroups next instead of just making assumptions on adequate sim length. Yes I'm aware that there is a reset packet in addition to a test packet with 5% reset probability, this is on purpose. I don't like the idea of just throwing the DUT one reset at the start and then just ignoring it for the rest of the sim, it feels kind of sloppy. The first reset is a garunteed sanity check and 'primes' the DUT and then the actual test packets in theory should test how reset works with and without enable.

What's next...
 
 - covergroups
 - parameterize the interface and DUT instance
 - make this readme better
 - fix the waveform image

Small testbench (at least relative to UVM testbenches) so just ran on EDA Playgorund. Try it yourself with setting below...

 - Simulator: Synopsys VCS 2023.03
 - Compile Options: <-timescale=1ns/1ns +vcs+flush+all +warn=all -sverilog>
 - Run Options (Optional)
    - <+UVM_VERBOSITY=UVM_HIGH>
    - Open EPWave after run (to see waves in EPWave)

Here's a snippet of the wave trace file...

<img src="image.png" width="1400" height="275"/>