class apb_driver extends uvm_driver#(apb_seq_item);

//virtual interface
virtual apb_intf vif;

apb_seq_item pkt;

//utility macros
`uvm_component_utils(apb_driver)

//constructor
function new(string name= "apb_driver",uvm_component parent);
super.new(name,parent);
endfunction

//build phase
virtual function void build_phase(uvm_phase phase);
super.build_phase(phase);
//uvm_config_db#(virtual sram_intf)::get(this,"","vif",vif);
 if(!uvm_config_db#(virtual apb_intf)::get(this,"","vif",vif))  //if virtual interface is not camed uvm_fatal is displayed
	`uvm_fatal("no vif",{"virtual interface must set for: ",get_full_name(),".vif"}) 
endfunction

//run_phase
virtual task run_phase(uvm_phase phase);
pkt=apb_seq_item::type_id::create("pkt");
forever begin
seq_item_port.get_next_item(pkt);
drive();
seq_item_port.item_done();
`uvm_info("Driver","Drv transaction dut",UVM_NONE);
end
endtask

task reset();
if(vif.preset)begin
vif.psel=0;
vif.penable=0;
vif.paddr=0;
vif.pwdata=0;
vif.pwrite=0;
end
endtask

task drive();
reset();
@(posedge vif.pclk)
vif.psel=1;
vif.penable=0;
//@(posedge vif.pclk)
//vif.psel=1;
vif.pwrite=1;
vif.paddr=pkt.paddr;
vif.pwdata=pkt.pwdata;
//vif.pwrite=pkt.pwrite;
@(posedge vif.pclk)
vif.penable=1;
@(posedge vif.pclk)
vif.psel=1;
vif.penable=0;
vif.pwrite=0;
/* vif.paddr=pkt.paddr;
vif.pwdata=pkt.pwdata;
vif.pwrite=pkt.pwrite; */
@(posedge vif.pclk)
vif.penable=1;
endtask

endclass