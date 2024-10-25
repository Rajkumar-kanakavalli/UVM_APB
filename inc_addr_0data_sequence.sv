class apb_incc_addr_0data_seq extends uvm_sequence #(apb_seq_item);

`uvm_object_utils(apb_incc_addr_0data_seq)

apb_seq_item pkt; //handle of seq_item to randomize

bit[2:0] a = 0;

virtual task body();

pkt=apb_seq_item::type_id::create("pkt");

repeat(50)
begin
`uvm_do_with(pkt,{pkt.paddr==a;pkt.pwdata==0;})//incrementing the address and incrementing data values
a++;
end

endtask

endclass
