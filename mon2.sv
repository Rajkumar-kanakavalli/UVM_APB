class apb_mon2 extends uvm_monitor;

`uvm_component_utils(apb_mon2)
apb_seq_item pkt2;
virtual apb_intf vif;

uvm_analysis_port #(apb_seq_item) item_collected_port2;

function new(string name = "apb_mon2",uvm_component parent);
super.new(name,parent);
endfunction

virtual function void build_phase (uvm_phase phase);
super.build_phase(phase);
uvm_config_db #(virtual apb_intf)::get(this,"","vif",vif);
item_collected_port2=new("item_collected_port2",this);
endfunction 

//run_phase
task run_phase(uvm_phase phase);
pkt2=apb_seq_item::type_id::create("pkt2");
forever begin
#2;
@(posedge vif.pclk)
pkt2.prdata=vif.prdata;

`uvm_info("mon2","mon2 transactions",UVM_NONE);
@(posedge vif.pclk)
item_collected_port2.write(pkt2);
end

endtask
endclass