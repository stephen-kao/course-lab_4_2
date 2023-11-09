// SPDX-FileCopyrightText: 2020 Efabless Corporation
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// SPDX-License-Identifier: Apache-2.0

`define MPRJ_IO_PADS_1 19	/* number of user GPIO pads on user1 side */
`define MPRJ_IO_PADS_2 19	/* number of user GPIO pads on user2 side */
`define MPRJ_IO_PADS (`MPRJ_IO_PADS_1 + `MPRJ_IO_PADS_2)

`default_nettype wire
/*
 *-------------------------------------------------------------
 *
 * user_proj_example
 *
 * This is an example of a (trivially simple) user project,
 * showing how the user project can connect to the logic
 * analyzer, the wishbone bus, and the I/O pads.
 *
 * This project generates an integer count, which is output
 * on the user area GPIO pads (digital output only).  The
 * wishbone connection allows the project to be controlled
 * (start and stop) from the management SoC program.
 *
 * See the testbenches in directory "mprj_counter" for the
 * example programs that drive this user project.  The three
 * testbenches are "io_ports", "la_test1", and "la_test2".
 *
 *-------------------------------------------------------------
 */

module user_proj_example #(
    parameter BITS = 32,
    parameter DELAYS=10
)(
`ifdef USE_POWER_PINS
    inout vccd1,	// User area 1 1.8V supply
    inout vssd1,	// User area 1 digital ground
`endif

    // Wishbone Slave ports (WB MI A)
    input wb_clk_i,
    input wb_rst_i,
    input wbs_stb_i,
    input wbs_cyc_i,
    input wbs_we_i,
    input [3:0] wbs_sel_i,
    input [31:0] wbs_dat_i,
    input [31:0] wbs_adr_i,
    output wbs_ack_o,
    output [31:0] wbs_dat_o,

    // Logic Analyzer Signals
    input  [127:0] la_data_in,
    output [127:0] la_data_out,
    input  [127:0] la_oenb,

    // IOs
    input  [`MPRJ_IO_PADS-1:0] io_in,
    output [`MPRJ_IO_PADS-1:0] io_out,
    output [`MPRJ_IO_PADS-1:0] io_oeb,

    // IRQ
    output [2:0] irq
);
    wire clk;
    wire rst;

    wire [`MPRJ_IO_PADS-1:0] io_in;
    wire [`MPRJ_IO_PADS-1:0] io_out;
    wire [`MPRJ_IO_PADS-1:0] io_oeb;

    //FIR parameter
    parameter pADDR_WIDTH = 12;
    parameter pDATA_WIDTH = 32;
    parameter Tape_Num    = 11;

    //FIR
    wire                     axis_rst_n;
    wire                     awready;
    wire                     wready;
    wire                     awvalid;
    wire [(pADDR_WIDTH-1):0] awaddr;
    wire                     wvalid;
    wire [(pDATA_WIDTH-1):0] wdata;
    wire                     arready;
    wire                     rready;
    wire                     arvalid;
    wire [(pADDR_WIDTH-1):0] araddr;
    wire                     rvalid;
    wire [(pDATA_WIDTH-1):0] rdata;
    wire                     ss_tvalid;
    wire [(pDATA_WIDTH-1):0] ss_tdata;
    wire                     ss_tlast;
    wire                     ss_tready;
    wire                     sm_tready;
    wire                     sm_tvalid;
    wire [(pDATA_WIDTH-1):0] sm_tdata;
    wire                     sm_tlast;

    // ram for tap
    wire [3:0]               tap_WE;
    wire                     tap_EN;
    wire [(pDATA_WIDTH-1):0] tap_Di;
    wire [(pADDR_WIDTH-1):0] tap_A;
    wire [(pDATA_WIDTH-1):0] tap_Do;

    // ram for data RAM
    wire [3:0]               data_WE;
    wire                     data_EN;
    wire [(pDATA_WIDTH-1):0] data_Di;
    wire [(pADDR_WIDTH-1):0] data_A;
    wire [(pDATA_WIDTH-1):0] data_Do;

    // Lab 4-1
    wire [31:0] rrdata; 
    // wire [31:0] wdata;
    // wire [BITS-1:0] count;

    wire valid;
    wire [3:0] wstrb;
    wire [31:0] la_write;
	
	reg [9:0] fifo;
	integer i;

    WB_AXI WB_AXI (
        // Wishbone
    	.wb_clk_i   (wb_clk_i ),
        .wb_rst_i   (wb_rst_i ),
        .wbs_stb_i  (wbs_stb_i),
        .wbs_cyc_i  (wbs_cyc_i),
        .wbs_we_i   (wbs_we_i ),
        .wbs_sel_i  (wbs_sel_i),
        .wbs_dat_i  (wbs_dat_i),
        .wbs_adr_i  (wbs_adr_i),
        .wbs_ack_o  (wbs_ack_o),
        .wbs_dat_o  (wbs_dat_o),
        //FIR reset
        .axis_rst_n  (axis_rst_n),
        // AXI_Lite
        // write
        .awaddr     (awaddr  ),
        .awvalid    (awvalid ),
        .awready    (awready ),
        .wdata      (wdata   ),
        .wvalid     (wvalid  ),
        .wready     (wready  ),
        // read
        .araddr     (araddr ),
        .arvalid    (arvalid),
        .arready    (arready),
        .rdata      (rdata  ),
        .rvalid     (rvalid ),
        .rready     (rready ),
        // AXI_Stream
        // data in
        .ss_tvalid  (ss_tvalid), 
        .ss_tdata   (ss_tdata ), 
        .ss_tlast   (ss_tlast ), 
        .ss_tready  (ss_tready), 
        // data out
        .sm_tready  (sm_tready), 
        .sm_tvalid  (sm_tvalid), 
        .sm_tdata   (sm_tdata ), 
        .sm_tlast   (sm_tlast )
    );

    fir #(
        .pADDR_WIDTH (pADDR_WIDTH),
        .pDATA_WIDTH (pDATA_WIDTH),
        .Tape_Num    (Tape_Num)
    ) fir (
        // System clock and Reset
        .axis_clk   (wb_clk_i  ),
        .axis_rst_n (axis_rst_n),
        // AXI_Lite
        // write
        .awaddr     (awaddr  ),
        .awvalid    (awvalid ),
        .awready    (awready ),
        .wdata      (wdata   ),
        .wvalid     (wvalid  ),
        .wready     (wready  ),
        // read
        .araddr     (araddr ),
        .arvalid    (arvalid),
        .arready    (arready),
        .rdata      (rdata  ),
        .rvalid     (rvalid ),
        .rready     (rready ),
        // // AXI_Stream
        // // data in
        .ss_tvalid  (ss_tvalid), 
        .ss_tdata   (ss_tdata ), 
        .ss_tlast   (ss_tlast ), 
        .ss_tready  (ss_tready), 
        // // data out
        .sm_tready  (sm_tready), 
        .sm_tvalid  (sm_tvalid), 
        .sm_tdata   (sm_tdata ), 
        .sm_tlast   (sm_tlast ), 
        // // ram for tap
        .tap_WE     (tap_WE   ),
        .tap_EN     (tap_EN   ),
        .tap_Di     (tap_Di   ),
        .tap_A      (tap_A    ),
        .tap_Do     (tap_Do   ),
        // ram for data
        .data_WE    (data_WE  ),
        .data_EN    (data_EN  ),
        .data_Di    (data_Di  ),
        .data_A     (data_A   ),
        .data_Do    (data_Do  )
    );


    // RAM for tap
    bram11 tap_RAM (
        .CLK(wb_clk_i),
        .WE(tap_WE),
        .EN(tap_EN),
        .Di(tap_Di),
        .A(tap_A),
        .Do(tap_Do)
    );

    // RAM for data
    bram11 data_RAM(
        .CLK(wb_clk_i),
        .WE(data_WE),
        .EN(data_EN),
        .Di(data_Di),
        .A(data_A),
        .Do(data_Do)
    );


    // WB MI A
    assign valid = wbs_cyc_i && wbs_stb_i; 
    assign wstrb = wbs_sel_i & {4{wbs_we_i}};
    assign wbs_dat_o = rrdata;
    assign wdata = wbs_dat_i;
    
    //assign wbs_ack_o = 1;
    
    // delay 10 cycles for ack
    assign wbs_ack_o = fifo[9];
    always@(posedge clk) begin
		if(rst) begin
			fifo <= 10'b0;
		end else if(fifo[9]) begin
			fifo <= 10'b0;
		end else begin
			fifo[0] <= valid;
			for (i=1; i<10; i=i+1) begin
				fifo[i] <= fifo[i-1];
			end
		end
	end
    // IO
    assign io_out = rdata;
    assign io_oeb = {(`MPRJ_IO_PADS-1){rst}};

    // IRQ
    assign irq = 3'b000;	// Unused

    // LA
    // assign la_data_out = {{(127-BITS){1'b0}}, rdata};
    assign la_data_out = {{61{1'b0}}, sm_tlast, sm_tvalid, rvalid, sm_tdata, rdata};
    // Assuming LA probes [63:32] are for controlling the count register  
    assign la_write = ~la_oenb[63:32] & ~{BITS{valid}};
    // Assuming LA probes [65:64] are for controlling the count clk & reset  
    assign clk = (~la_oenb[64]) ? la_data_in[64]: wb_clk_i;
    assign rst = (~la_oenb[65]) ? la_data_in[65]: wb_rst_i;


    bram user_bram (
        .CLK(clk),
        .WE0(wstrb),
        .EN0(valid),
        .Di0(wdata),
        .Do0(rrdata),
        .A0(wbs_adr_i)
    );

endmodule



`default_nettype wire
