`include "APB_module_slave.sv"
module APB_Slave(apb_intf.dut intf);


APB_Module_Slave slave(.PCLK(intf.pclk),
					   .PRESET(intf.preset),
					   .PRDATA(intf.prdata),
					   .PSEL(intf.psel),
					   .PENABLE(intf.penable),
					   .PADDR(intf.paddr),
					   .PWRITE(intf.pwrite),
					   .PWDATA(intf.pwdata),
					   .PREADY(intf.pready));
					
endmodule
  