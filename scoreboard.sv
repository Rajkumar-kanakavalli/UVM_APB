
class apb_scb extends uvm_scoreboard;

`uvm_component_utils(apb_scb)

apb_seq_item pkt1,pkt2;

uvm_tlm_analysis_fifo#(apb_seq_item)ip_fifo;
uvm_tlm_analysis_fifo#(apb_seq_item)op_fifo;

function new(string name = "apb_scb",uvm_component parent);
super.new(name,parent);
ip_fifo=new("ip_fifo",this);
op_fifo=new("op_fifo",this);
endfunction

virtual function void build_phase(uvm_phase phase);
super.build_phase(phase);
pkt1 = apb_seq_item::type_id::create("pkt1",this);
pkt2 = apb_seq_item::type_id::create("pkt2",this);
endfunction

task run_phase(uvm_phase phase);
forever begin 

fork
ip_fifo.get(pkt1);
op_fifo.get(pkt2);
join

if(pkt2.prdata==pkt1.prdata)
  begin 
	`uvm_info("SCB: DATA MATCHED",$sformatf("dut prdata = %d, ref prdata =%d",pkt2.prdata,pkt1.prdata),UVM_NONE);
   end
else 
	begin
	 `uvm_info("SCB: DATA MISMATCHED",$sformatf("o/p prdata = %d, i/p prdata =%d",pkt2.prdata,pkt1.prdata),UVM_NONE);
	end
end
endtask

endclass 