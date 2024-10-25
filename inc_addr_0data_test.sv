class inc_addr_0data_test extends base_test;
`uvm_component_utils(inc_addr_0data_test)

apb_incc_addr_0data_seq inc_addr_0data_seq;

function new(string name="inc_addr_0data_test",uvm_component parent);
super.new(name,parent);
endfunction

virtual function void build_phase(uvm_phase phase);
super.build_phase(phase);
inc_addr_0data_seq=apb_incc_addr_0data_seq::type_id::create("inc_addr_0data_seq",this);
endfunction:build_phase

task run_phase(uvm_phase phase);
phase.raise_objection(this);
	inc_addr_0data_seq.start(env.agent1.seqr);
	#10;
phase.drop_objection(this);
endtask

endclass