interface apb_intf (input pclk,preset);

//payload information
logic[7:0]pwdata;

//control information
logic[7:0]paddr;
logic psel,penable,pwrite;

//analysis information 
logic [7:0]prdata;
logic pready;

modport dut(input pclk,preset,input pwdata,paddr,psel,penable,pwrite,output prdata,pready);

endinterface