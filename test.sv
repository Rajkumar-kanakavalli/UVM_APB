class base_test extends uvm_test;
`uvm_component_utils(base_test)

apb_env env;
apb_rand_addr_data_seq rand_seq;

function new(string name="base_test",uvm_component parent);
super.new(name,parent);
endfunction

virtual function void build_phase(uvm_phase phase);
super.build_phase(phase);
env=apb_env::type_id::create("env",this);
rand_seq=apb_rand_addr_data_seq::type_id::create("rand_seq",this);
endfunction:build_phase

task run_phase(uvm_phase phase);
phase.raise_objection(this);
	rand_seq.start(env.agent1.seqr);
	#10;
phase.drop_objection(this);


endtask

virtual function void end_of_elaboration_phase(uvm_phase phase);
super.end_of_elaboration_phase(phase);
uvm_top.print_topology();
endfunction

endclass