class apb_dec_addr_seq extends uvm_sequence #(apb_seq_item);

`uvm_object_utils(apb_dec_addr_seq)

apb_seq_item pkt; //handle of seq_item to randomize

bit [2:0]c=7;

virtual task body();

pkt=apb_seq_item::type_id::create("pkt");

repeat(10)
begin
`uvm_do_with(pkt,{pkt.paddr==c;})//decrementing the address and randomized data values
c--;
end

endtask

endclass