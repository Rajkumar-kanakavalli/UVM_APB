class apb_inc_addr_seq extends uvm_sequence #(apb_seq_item);

`uvm_object_utils(apb_inc_addr_seq)

apb_seq_item pkt; //handle of seq_item to randomize

int c;

virtual task body();

pkt=apb_seq_item::type_id::create("pkt");

repeat(20)
begin
`uvm_do_with(pkt,{pkt.paddr==c;})//incrementing the address and randomized data values
c++;
end

endtask

endclass