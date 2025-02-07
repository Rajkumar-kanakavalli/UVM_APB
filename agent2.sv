class apb_agent2 extends uvm_agent; //pasive agent
`uvm_component_utils(apb_agent2)

apb_mon2 mon2;

function new(string name = "apb_agent2",uvm_component parent);
super.new(name,parent);
endfunction

//build_phase
virtual function void build_phase(uvm_phase phase);
super.build_phase(phase);
mon2 = apb_mon2::type_id::create("mon2",this);
endfunction

endclass