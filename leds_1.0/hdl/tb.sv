`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 10/22/2016 06:20:44 PM
// Design Name:
// Module Name: tb
// Project Name:
// Target Devices:
// Tool Versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////

// Design parameters
localparam PRINT_TIMER = 1000000;  //miliseconds
localparam C_NUM_OF_LEDS = 4;
localparam C_AXI_DATA_WIDTH = 32;
localparam C_AXI_ADDR_WIDTH = 4;


task printTime ();
  $display ("** Current sim time is %d ms", ($time/PRINT_TIMER));
endtask

module tb(    );


logic         clock_axi = 1'b0;
logic         reset_axi = 1'b0;


logic            [C_AXI_ADDR_WIDTH-1 : 0] axi_awaddr = '0;
logic                             [2 : 0] axi_awprot = '0;
logic                                     axi_awvalid = '0;
logic                                     axi_awready = '0;
logic            [C_AXI_DATA_WIDTH-1 : 0] axi_wdata = '0;
logic        [(C_AXI_DATA_WIDTH/8)-1 : 0] axi_wstrb = '0;
logic                                     axi_wvalid = '0;
logic                                     axi_wready = '0;
logic                             [1 : 0] axi_bresp = '0;
logic                                     axi_bvalid = '0;
logic                                     axi_bready = '0;
logic            [C_AXI_ADDR_WIDTH-1 : 0] axi_araddr = '0;
logic                             [2 : 0] axi_arprot = '0;
logic                                     axi_arvalid = '0;
logic                                     axi_arready = '0;
logic            [C_AXI_DATA_WIDTH-1 : 0] axi_rdata = '0;
logic                             [1 : 0] axi_rresp = '0;
logic                                     axi_rvalid = '0;
logic                                     axi_rready = '0;


// Setup module clock
localparam CLOCK_PER = 10.0;
always begin
  #(CLOCK_PER/2) clock_axi <= ~clock_axi;
end


// Setup module reset
initial begin
  #(CLOCK_PER) reset_axi <= 1'b1;
  #(CLOCK_PER*10) reset_axi <= 1'b0;
end

//Sim Timer
always begin
  #(PRINT_TIMER) printTime();
end


// Commands
initial begin
  axi_wstrb <= '1;
  #(CLOCK_PER*100) axi_awaddr <= 0;
  axi_awvalid <= 1'b0;
  axi_wvalid <= 1'b0;
  axi_wdata <= 32'h0;
  #(CLOCK_PER) axi_awaddr <= 0;
  axi_awvalid <= 1'b1;
  axi_wvalid <= 1'b1;
  axi_wdata <= 32'hF;
  #(CLOCK_PER*3) axi_awaddr <= 0;
  axi_awvalid <= 1'b0;
  axi_wvalid <= 1'b0;
  axi_wdata <= 32'h0;
  #(CLOCK_PER*100) axi_awaddr <= 0;
  axi_awvalid <= 1'b0;
  axi_wvalid <= 1'b0;
  axi_wdata <= 32'h0;
  #(CLOCK_PER) axi_awaddr <= 0;
  axi_awvalid <= 1'b1;
  axi_wvalid <= 1'b1;
  axi_wdata <= 32'hA;
  #(CLOCK_PER*3) axi_awaddr <= 0;
  axi_awvalid <= 1'b0;
  axi_wvalid <= 1'b0;
  axi_wdata <= 32'h0;

end


logic [C_NUM_OF_LEDS-1:0] leds;

leds_v1_0 #
(
  .C_NUM_OF_LEDS        (C_NUM_OF_LEDS),
  .C_S00_AXI_DATA_WIDTH (C_AXI_DATA_WIDTH),
  .C_S00_AXI_ADDR_WIDTH (C_AXI_ADDR_WIDTH)
) leds_v1_0_i
(

  .leds             (leds),


  // Ports of Axi Slave Bus Interface S00_AXI
  .s00_axi_aclk     (clock_axi),
  .s00_axi_aresetn  (~reset_axi),
  .s00_axi_awaddr   (axi_awaddr),
  .s00_axi_awprot   (axi_awprot),
  .s00_axi_awvalid  (axi_awvalid),
  .s00_axi_awready  (axi_awready),
  .s00_axi_wdata    (axi_wdata),
  .s00_axi_wstrb    (axi_wstrb),
  .s00_axi_wvalid   (axi_wvalid),
  .s00_axi_wready   (axi_wready),
  .s00_axi_bresp    (axi_bresp),
  .s00_axi_bvalid   (axi_bvalid),
  .s00_axi_bready   (axi_bready),
  .s00_axi_araddr   (axi_araddr),
  .s00_axi_arprot   (axi_arprot),
  .s00_axi_arvalid  (axi_arvalid),
  .s00_axi_arready  (axi_arready),
  .s00_axi_rdata    (axi_rdata),
  .s00_axi_rresp    (axi_rresp),
  .s00_axi_rvalid   (axi_rvalid),
  .s00_axi_rready   (axi_rready)
);


endmodule
