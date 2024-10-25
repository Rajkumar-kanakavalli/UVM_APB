class apb_mon1 extends uvm_monitor;

`uvm_component_utils(apb_mon1)
apb_seq_item pkt1;
virtual apb_intf vif;

uvm_analysis_port #(apb_seq_item) item_collected_port1;

function new(string name = "apb_mon1",uvm_component parent);
super.new(name,parent);
endfunction

virtual function void build_phase (uvm_phase phase);
super.build_phase(phase);
uvm_config_db #(virtual apb_intf)::get(this,"","vif",vif);
item_collected_port1=new("item_collected_port1",this);//object creation for analysis port
endfunction 

//run_phase
task run_phase(uvm_phase phase);
pkt1=apb_seq_item::type_id::create("pkt1");
forever begin
//@(posedge vif.pclk)
pkt1.paddr=vif.paddr;
pkt1.pwrite=vif.pwrite;
pkt1.pwdata=vif.pwdata;
pkt1.prdata=vif.prdata;
`uvm_info("mon1","mon1 transactions",UVM_NONE);
@(posedge vif.pclk)
item_collected_port1.write(pkt1);
end

endtask
endclass