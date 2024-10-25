class apb_rand_addr_data_seq extends uvm_sequence #(apb_seq_item);

`uvm_object_utils(apb_rand_addr_data_seq)

apb_seq_item pkt; //handle of seq_item to randomize

virtual task body();

pkt=apb_seq_item::type_id::create("pkt");  //create method[Creates memory]

repeat(10)
begin
`uvm_do(pkt) //randomized address and data values
end

endtask

endclass