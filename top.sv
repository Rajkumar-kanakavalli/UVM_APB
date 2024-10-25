import uvm_pkg::*;
`include "uvm_macros.svh"

`include "sequence_item.sv"
`include "sequence.sv"
`include "sequencer.sv"
`include "driver.sv"
`include "interface.sv"
`include "dut.sv"
`include "mon1.sv"
`include "agent1.sv"
`include "mon2.sv"
`include "agent2.sv"
`include "scoreboard.sv"
`include "environment.sv"
`include "test.sv"
//-----------Test Case 1 -------------------------------
`include "inc_addr_sequence.sv"
`include "inc_addr_test.sv"
//-----------Test Case 2 -------------------------------
`include "dec_addr_sequence.sv"
`include "dec_addr_test.sv"
//-----------Test Case 3 ------------------------------
`include "inc_data_sequence.sv"
`include "inc_data_test.sv"
//-----------Test Case 4 -------------------------------
`include "dec_data_sequence.sv"
`include "dec_data_test.sv"
//-----------Test case 5 -------------------------------
`include "inc_addr_inc_data_sequence.sv"
`include "inc_addr_inc_data_test.sv"
//-----------Test Case 6 -------------------------------
`include "dec_addr_dec_data_sequence.sv"
`include "dec_addr_dec_data_test.sv"
//-----------Test case 7 -------------------------------
`include "inc_addr_0data_sequence.sv"
`include "inc_addr_0data_test.sv"






module apb_top1;

bit preset,pclk;

initial begin
pclk = 1;
forever #5 pclk=~pclk;
end

initial begin 
preset = 1;
#5;
preset = 1'b0;
end

apb_intf vif(pclk,preset);
APB_Slave DUT(vif);

initial begin
uvm_config_db #(virtual apb_intf)::set(uvm_root::get(),"*","vif",vif);

$dumpfile("dump.vcd"); $dumpvars;
end

initial begin

run_test("dec_addr_dec_data_test");

end
endmodule