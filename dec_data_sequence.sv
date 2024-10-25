class apb_dec_data_seq extends uvm_sequence #(apb_seq_item);

`uvm_object_utils(apb_dec_data_seq)

apb_seq_item pkt; //handle of seq_item to randomize

int c=8'hff;

virtual task body();

pkt=apb_seq_item::type_id::create("pkt");

repeat(50)
begin
`uvm_do_with(pkt,{pkt.pwdata==c;})//decrementing the data and randomized address values
c--;
end

endtask

endclass