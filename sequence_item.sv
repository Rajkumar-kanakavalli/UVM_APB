class apb_seq_item extends uvm_sequence_item;

//payload information
rand bit[7:0]pwdata;

//control information
rand bit[7:0]paddr;
bit psel,penable;
bit pwrite;

//analysis information 
bit [7:0]prdata;
bit pready;
		
//utility and Field macros
`uvm_object_utils_begin(apb_seq_item)
	`uvm_field_int(pwdata,UVM_ALL_ON + UVM_DEC)
	`uvm_field_int(paddr,UVM_ALL_ON + UVM_DEC)
	`uvm_field_int(psel,UVM_ALL_ON)
	`uvm_field_int(penable,UVM_ALL_ON)
	`uvm_field_int(pwrite,UVM_ALL_ON)
`uvm_object_utils_end
//new constructor
function new(string name = "apb_seq_item");
super.new(name);
endfunction

endclass