class dec_addr_data_test extends base_test;
`uvm_component_utils(dec_addr_data_test)

apb_dec_addr_data_seq dec_addr_data_seq;

function new(string name="dec_addr_data_test",uvm_component parent);
super.new(name,parent);
endfunction

virtual function void build_phase(uvm_phase phase);
super.build_phase(phase);
dec_addr_data_seq=apb_dec_addr_data_seq::type_id::create("dec_addr_data_seq",this);
endfunction:build_phase

task run_phase(uvm_phase phase);
phase.raise_objection(this);
	dec_addr_data_seq.start(env.agent1.seqr);
	#10;
phase.drop_objection(this);
endtask

endclass