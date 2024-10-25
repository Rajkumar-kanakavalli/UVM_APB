class apb_agent1 extends uvm_agent;//active agent
`uvm_component_utils(apb_agent1)

//active agent components
apb_sequencer seqr;
apb_driver drv;
apb_mon1 mon1;

function new(string name = "apb_agent1",uvm_component parent);
super.new(name,parent);
endfunction

//build_phase
virtual function void build_phase(uvm_phase phase);
super.build_phase(phase);
seqr = apb_sequencer::type_id::create("seqr",this);
drv  = apb_driver::type_id::create("drv",this);
mon1 = apb_mon1::type_id::create("mon1",this);
endfunction

virtual function void connect_phase(uvm_phase phase);
super.connect_phase(phase);
drv.seq_item_port.connect(seqr.seq_item_export);
endfunction

endclass