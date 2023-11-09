module WB_AXI #(
    parameter pADDR_WIDTH = 12,
    parameter pDATA_WIDTH = 32
)(
    // System clock and Reset (Active High)
    input  wire                   wb_clk_i,
    input  wire                   wb_rst_i,
    // Wishbone Slave ports (WB MI A)
    input  wire                   wbs_stb_i,
    input  wire                   wbs_cyc_i,
    input  wire                   wbs_we_i,
    input  wire [3:0]             wbs_sel_i,
    input  wire [31:0]            wbs_dat_i,
    input  wire [31:0]            wbs_adr_i,
    input  wire                   wbs_ack_o,
    input  wire [31:0]            wbs_dat_o,
    // AXI clock and Reset (Active Low)
    output wire                   axis_rst_n,
    // AXI-Lite Protocal
    // write
    output reg  [pADDR_WIDTH-1:0] awaddr,  
    output reg                    awvalid, 
    input  wire                   awready, 
    output wire [pDATA_WIDTH-1:0] wdata,   
    output reg                    wvalid,  
    input  wire                   wready,  
    // read
    output wire [pADDR_WIDTH-1:0] araddr,
    output reg                    arvalid,
    input  wire                   arready,
    input  wire [pDATA_WIDTH-1:0] rdata,  
    input  wire                   rvalid,
    output wire                   rready,
    // AXI-Stream Protocal
    // data in
    output reg                    ss_tvalid, 
    output reg  [pDATA_WIDTH-1:0] ss_tdata, 
    output reg                    ss_tlast, 
    input  wire                   ss_tready, 
    // data out
    output reg                    sm_tready, 
    input  wire                   sm_tvalid, 
    input  wire [pDATA_WIDTH-1:0] sm_tdata, 
    input  wire                   sm_tlast
);
//////////////////////////////////////////
//
// local parameter declaration
//
//////////////////////////////////////////
wire [pADDR_WIDTH-1:0] next_awaddr;
wire next_awvalid;
wire [pDATA_WIDTH-1:0] next_wdata;
wire next_wvalid;
wire next_arvalid;
wire next_ss_tvalid;
wire [pDATA_WIDTH-1:0] next_ss_tdata;
wire next_ss_tlast;
wire next_sm_tready;

wire AXI_Lite_EN;
wire AXI_Stream_EN;
wire AXI_Read_EN;
// AXI reset (Active Low)
assign axis_rst_n = ~wb_rst_i;

assign AXI_Lite_EN = (wbs_adr_i[12] && &wbs_adr_i[29:27]);
assign AXI_Stream_EN = (wbs_adr_i[13] && &wbs_adr_i[29:27]);
assign AXI_Read_EN = (wbs_adr_i[14] && &wbs_adr_i[29:27]);

assign next_awaddr = {{24{1'b0}}, wbs_adr_i[7:0]};
assign next_awvalid = (AXI_Lite_EN && awready) ? 1'b0 : (AXI_Lite_EN && wbs_cyc_i && wbs_stb_i);
// assign next_wdata = wbs_dat_i;
assign wdata = wbs_dat_i;
assign next_wvalid = (AXI_Lite_EN && wready) ? 1'b0 : (AXI_Lite_EN && wbs_cyc_i && wbs_stb_i);

assign next_ss_tvalid = (AXI_Stream_EN && ss_tready) ? 1'b0 : (AXI_Stream_EN && wbs_cyc_i && wbs_stb_i);
assign next_ss_tdata = wbs_dat_i;
assign next_ss_tlast = (AXI_Stream_EN && wbs_adr_i[3] && wbs_cyc_i && wbs_stb_i);
assign next_sm_tready = 1;

assign araddr = {{24{1'b0}}, wbs_adr_i[7:0]};
assign next_arvalid = (AXI_Read_EN && arready) ? 1'b0 : (AXI_Read_EN && wbs_cyc_i && wbs_stb_i);
assign rready = 'd1;

always @(posedge wb_clk_i) begin
    if(~axis_rst_n) begin
        awaddr    <= 'd0;
        awvalid   <= 'd0;
        // wdata     <= 'd0;
        wvalid    <= 'd0;
        ss_tvalid <= 'd0;
        ss_tdata  <= 'd0;
        ss_tlast  <= 'd0;
        sm_tready <= 'd1;
        arvalid   <= 'd0;
    end else begin
        awaddr    <= next_awaddr;
        awvalid   <= next_awvalid;
        // wdata     <= next_wdata;
        wvalid    <= next_wvalid;
        ss_tvalid <= next_ss_tvalid;
        ss_tdata  <= next_ss_tdata;
        ss_tlast  <= next_ss_tlast;
        sm_tready <= next_sm_tready;
        arvalid   <= next_arvalid;
    end
end

endmodule
