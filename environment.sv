class apb_env extends uvm_env;
`uvm_component_utils(apb_env)

apb_agent1 agent1;
apb_agent2 agent2;
apb_scb scb;

function new(string name = "apb_env",uvm_component parent);
super.new(name,parent);
endfunction

//build_phase
virtual function void build_phase(uvm_phase phase);
super.build_phase(phase);
agent1 = apb_agent1::type_id::create("agent1",this);
agent2 = apb_agent2::type_id::create("agent2",this);
scb = apb_scb::type_id::create("scb",this);
endfunction

//connect_phase
virtual function void connect_phase(uvm_phase phase);
super.connect_phase(phase);
agent1.mon1.item_collected_port1.connect(scb.ip_fifo.analysis_export);
agent2.mon2.item_collected_port2.connect(scb.op_fifo.analysis_export);
endfunction

endclass