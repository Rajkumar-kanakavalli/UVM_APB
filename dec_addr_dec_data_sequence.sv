class apb_dec_addr_data_seq extends uvm_sequence #(apb_seq_item);

`uvm_object_utils(apb_dec_addr_data_seq)

apb_seq_item pkt; //handle of seq_item to randomize

bit[7:0] c = 255;
bit [2:0]a = 15;

virtual task body();

pkt=apb_seq_item::type_id::create("pkt");

repeat(50)
begin
`uvm_do_with(pkt,{pkt.paddr==a;pkt.pwdata==c;})//incrementing the address and incrementing data values
c--;
a--;
end

endtask

endclass
