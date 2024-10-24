// da_converter.v

// Generated using ACDS version 16.1 196

`timescale 1 ps / 1 ps
module da_converter (
		input  wire        clk_clk,                           //                         clk.clk
		output wire [7:0]  hex0_export,                       //                        hex0.export
		output wire [1:0]  leds_export,                       //                        leds.export
		output wire [11:0] new_sdram_controller_0_wire_addr,  // new_sdram_controller_0_wire.addr
		output wire [1:0]  new_sdram_controller_0_wire_ba,    //                            .ba
		output wire        new_sdram_controller_0_wire_cas_n, //                            .cas_n
		output wire        new_sdram_controller_0_wire_cke,   //                            .cke
		output wire        new_sdram_controller_0_wire_cs_n,  //                            .cs_n
		inout  wire [31:0] new_sdram_controller_0_wire_dq,    //                            .dq
		output wire [3:0]  new_sdram_controller_0_wire_dqm,   //                            .dqm
		output wire        new_sdram_controller_0_wire_ras_n, //                            .ras_n
		output wire        new_sdram_controller_0_wire_we_n   //                            .we_n
	);

	wire         nios2_qsys_0_jtag_debug_module_reset_reset;                   // nios2_qsys_0:jtag_debug_module_resetrequest -> [mm_interconnect_0:timer_0_reset_reset_bridge_in_reset_reset, rst_controller:reset_in0, rst_controller:reset_in1, timer_0:reset_n]
	wire  [31:0] nios2_qsys_0_data_master_readdata;                            // mm_interconnect_0:nios2_qsys_0_data_master_readdata -> nios2_qsys_0:d_readdata
	wire         nios2_qsys_0_data_master_waitrequest;                         // mm_interconnect_0:nios2_qsys_0_data_master_waitrequest -> nios2_qsys_0:d_waitrequest
	wire         nios2_qsys_0_data_master_debugaccess;                         // nios2_qsys_0:jtag_debug_module_debugaccess_to_roms -> mm_interconnect_0:nios2_qsys_0_data_master_debugaccess
	wire  [27:0] nios2_qsys_0_data_master_address;                             // nios2_qsys_0:d_address -> mm_interconnect_0:nios2_qsys_0_data_master_address
	wire   [3:0] nios2_qsys_0_data_master_byteenable;                          // nios2_qsys_0:d_byteenable -> mm_interconnect_0:nios2_qsys_0_data_master_byteenable
	wire         nios2_qsys_0_data_master_read;                                // nios2_qsys_0:d_read -> mm_interconnect_0:nios2_qsys_0_data_master_read
	wire         nios2_qsys_0_data_master_write;                               // nios2_qsys_0:d_write -> mm_interconnect_0:nios2_qsys_0_data_master_write
	wire  [31:0] nios2_qsys_0_data_master_writedata;                           // nios2_qsys_0:d_writedata -> mm_interconnect_0:nios2_qsys_0_data_master_writedata
	wire  [31:0] nios2_qsys_0_instruction_master_readdata;                     // mm_interconnect_0:nios2_qsys_0_instruction_master_readdata -> nios2_qsys_0:i_readdata
	wire         nios2_qsys_0_instruction_master_waitrequest;                  // mm_interconnect_0:nios2_qsys_0_instruction_master_waitrequest -> nios2_qsys_0:i_waitrequest
	wire  [27:0] nios2_qsys_0_instruction_master_address;                      // nios2_qsys_0:i_address -> mm_interconnect_0:nios2_qsys_0_instruction_master_address
	wire         nios2_qsys_0_instruction_master_read;                         // nios2_qsys_0:i_read -> mm_interconnect_0:nios2_qsys_0_instruction_master_read
	wire         mm_interconnect_0_jtag_uart_0_avalon_jtag_slave_chipselect;   // mm_interconnect_0:jtag_uart_0_avalon_jtag_slave_chipselect -> jtag_uart_0:av_chipselect
	wire  [31:0] mm_interconnect_0_jtag_uart_0_avalon_jtag_slave_readdata;     // jtag_uart_0:av_readdata -> mm_interconnect_0:jtag_uart_0_avalon_jtag_slave_readdata
	wire         mm_interconnect_0_jtag_uart_0_avalon_jtag_slave_waitrequest;  // jtag_uart_0:av_waitrequest -> mm_interconnect_0:jtag_uart_0_avalon_jtag_slave_waitrequest
	wire   [0:0] mm_interconnect_0_jtag_uart_0_avalon_jtag_slave_address;      // mm_interconnect_0:jtag_uart_0_avalon_jtag_slave_address -> jtag_uart_0:av_address
	wire         mm_interconnect_0_jtag_uart_0_avalon_jtag_slave_read;         // mm_interconnect_0:jtag_uart_0_avalon_jtag_slave_read -> jtag_uart_0:av_read_n
	wire         mm_interconnect_0_jtag_uart_0_avalon_jtag_slave_write;        // mm_interconnect_0:jtag_uart_0_avalon_jtag_slave_write -> jtag_uart_0:av_write_n
	wire  [31:0] mm_interconnect_0_jtag_uart_0_avalon_jtag_slave_writedata;    // mm_interconnect_0:jtag_uart_0_avalon_jtag_slave_writedata -> jtag_uart_0:av_writedata
	wire  [31:0] mm_interconnect_0_nios2_qsys_0_jtag_debug_module_readdata;    // nios2_qsys_0:jtag_debug_module_readdata -> mm_interconnect_0:nios2_qsys_0_jtag_debug_module_readdata
	wire         mm_interconnect_0_nios2_qsys_0_jtag_debug_module_waitrequest; // nios2_qsys_0:jtag_debug_module_waitrequest -> mm_interconnect_0:nios2_qsys_0_jtag_debug_module_waitrequest
	wire         mm_interconnect_0_nios2_qsys_0_jtag_debug_module_debugaccess; // mm_interconnect_0:nios2_qsys_0_jtag_debug_module_debugaccess -> nios2_qsys_0:jtag_debug_module_debugaccess
	wire   [8:0] mm_interconnect_0_nios2_qsys_0_jtag_debug_module_address;     // mm_interconnect_0:nios2_qsys_0_jtag_debug_module_address -> nios2_qsys_0:jtag_debug_module_address
	wire         mm_interconnect_0_nios2_qsys_0_jtag_debug_module_read;        // mm_interconnect_0:nios2_qsys_0_jtag_debug_module_read -> nios2_qsys_0:jtag_debug_module_read
	wire   [3:0] mm_interconnect_0_nios2_qsys_0_jtag_debug_module_byteenable;  // mm_interconnect_0:nios2_qsys_0_jtag_debug_module_byteenable -> nios2_qsys_0:jtag_debug_module_byteenable
	wire         mm_interconnect_0_nios2_qsys_0_jtag_debug_module_write;       // mm_interconnect_0:nios2_qsys_0_jtag_debug_module_write -> nios2_qsys_0:jtag_debug_module_write
	wire  [31:0] mm_interconnect_0_nios2_qsys_0_jtag_debug_module_writedata;   // mm_interconnect_0:nios2_qsys_0_jtag_debug_module_writedata -> nios2_qsys_0:jtag_debug_module_writedata
	wire         mm_interconnect_0_leds_s1_chipselect;                         // mm_interconnect_0:LEDS_s1_chipselect -> LEDS:chipselect
	wire  [31:0] mm_interconnect_0_leds_s1_readdata;                           // LEDS:readdata -> mm_interconnect_0:LEDS_s1_readdata
	wire   [1:0] mm_interconnect_0_leds_s1_address;                            // mm_interconnect_0:LEDS_s1_address -> LEDS:address
	wire         mm_interconnect_0_leds_s1_write;                              // mm_interconnect_0:LEDS_s1_write -> LEDS:write_n
	wire  [31:0] mm_interconnect_0_leds_s1_writedata;                          // mm_interconnect_0:LEDS_s1_writedata -> LEDS:writedata
	wire         mm_interconnect_0_timer_0_s1_chipselect;                      // mm_interconnect_0:timer_0_s1_chipselect -> timer_0:chipselect
	wire  [15:0] mm_interconnect_0_timer_0_s1_readdata;                        // timer_0:readdata -> mm_interconnect_0:timer_0_s1_readdata
	wire   [2:0] mm_interconnect_0_timer_0_s1_address;                         // mm_interconnect_0:timer_0_s1_address -> timer_0:address
	wire         mm_interconnect_0_timer_0_s1_write;                           // mm_interconnect_0:timer_0_s1_write -> timer_0:write_n
	wire  [15:0] mm_interconnect_0_timer_0_s1_writedata;                       // mm_interconnect_0:timer_0_s1_writedata -> timer_0:writedata
	wire         mm_interconnect_0_new_sdram_controller_0_s1_chipselect;       // mm_interconnect_0:new_sdram_controller_0_s1_chipselect -> new_sdram_controller_0:az_cs
	wire  [31:0] mm_interconnect_0_new_sdram_controller_0_s1_readdata;         // new_sdram_controller_0:za_data -> mm_interconnect_0:new_sdram_controller_0_s1_readdata
	wire         mm_interconnect_0_new_sdram_controller_0_s1_waitrequest;      // new_sdram_controller_0:za_waitrequest -> mm_interconnect_0:new_sdram_controller_0_s1_waitrequest
	wire  [21:0] mm_interconnect_0_new_sdram_controller_0_s1_address;          // mm_interconnect_0:new_sdram_controller_0_s1_address -> new_sdram_controller_0:az_addr
	wire         mm_interconnect_0_new_sdram_controller_0_s1_read;             // mm_interconnect_0:new_sdram_controller_0_s1_read -> new_sdram_controller_0:az_rd_n
	wire   [3:0] mm_interconnect_0_new_sdram_controller_0_s1_byteenable;       // mm_interconnect_0:new_sdram_controller_0_s1_byteenable -> new_sdram_controller_0:az_be_n
	wire         mm_interconnect_0_new_sdram_controller_0_s1_readdatavalid;    // new_sdram_controller_0:za_valid -> mm_interconnect_0:new_sdram_controller_0_s1_readdatavalid
	wire         mm_interconnect_0_new_sdram_controller_0_s1_write;            // mm_interconnect_0:new_sdram_controller_0_s1_write -> new_sdram_controller_0:az_wr_n
	wire  [31:0] mm_interconnect_0_new_sdram_controller_0_s1_writedata;        // mm_interconnect_0:new_sdram_controller_0_s1_writedata -> new_sdram_controller_0:az_data
	wire         mm_interconnect_0_hex0_s1_chipselect;                         // mm_interconnect_0:HEX0_s1_chipselect -> HEX0:chipselect
	wire  [31:0] mm_interconnect_0_hex0_s1_readdata;                           // HEX0:readdata -> mm_interconnect_0:HEX0_s1_readdata
	wire   [1:0] mm_interconnect_0_hex0_s1_address;                            // mm_interconnect_0:HEX0_s1_address -> HEX0:address
	wire         mm_interconnect_0_hex0_s1_write;                              // mm_interconnect_0:HEX0_s1_write -> HEX0:write_n
	wire  [31:0] mm_interconnect_0_hex0_s1_writedata;                          // mm_interconnect_0:HEX0_s1_writedata -> HEX0:writedata
	wire         mm_interconnect_0_onchip_memory2_0_s1_chipselect;             // mm_interconnect_0:onchip_memory2_0_s1_chipselect -> onchip_memory2_0:chipselect
	wire  [31:0] mm_interconnect_0_onchip_memory2_0_s1_readdata;               // onchip_memory2_0:readdata -> mm_interconnect_0:onchip_memory2_0_s1_readdata
	wire   [9:0] mm_interconnect_0_onchip_memory2_0_s1_address;                // mm_interconnect_0:onchip_memory2_0_s1_address -> onchip_memory2_0:address
	wire   [3:0] mm_interconnect_0_onchip_memory2_0_s1_byteenable;             // mm_interconnect_0:onchip_memory2_0_s1_byteenable -> onchip_memory2_0:byteenable
	wire         mm_interconnect_0_onchip_memory2_0_s1_write;                  // mm_interconnect_0:onchip_memory2_0_s1_write -> onchip_memory2_0:write
	wire  [31:0] mm_interconnect_0_onchip_memory2_0_s1_writedata;              // mm_interconnect_0:onchip_memory2_0_s1_writedata -> onchip_memory2_0:writedata
	wire         mm_interconnect_0_onchip_memory2_0_s1_clken;                  // mm_interconnect_0:onchip_memory2_0_s1_clken -> onchip_memory2_0:clken
	wire         irq_mapper_receiver0_irq;                                     // jtag_uart_0:av_irq -> irq_mapper:receiver0_irq
	wire         irq_mapper_receiver1_irq;                                     // timer_0:irq -> irq_mapper:receiver1_irq
	wire  [31:0] nios2_qsys_0_d_irq_irq;                                       // irq_mapper:sender_irq -> nios2_qsys_0:d_irq
	wire         rst_controller_reset_out_reset;                               // rst_controller:reset_out -> [HEX0:reset_n, LEDS:reset_n, irq_mapper:reset, jtag_uart_0:rst_n, mm_interconnect_0:nios2_qsys_0_reset_n_reset_bridge_in_reset_reset, new_sdram_controller_0:reset_n, nios2_qsys_0:reset_n, onchip_memory2_0:reset, rst_translator:in_reset]
	wire         rst_controller_reset_out_reset_req;                           // rst_controller:reset_req -> [nios2_qsys_0:reset_req, onchip_memory2_0:reset_req, rst_translator:reset_req_in]

	da_converter_HEX0 hex0 (
		.clk        (clk_clk),                              //                 clk.clk
		.reset_n    (~rst_controller_reset_out_reset),      //               reset.reset_n
		.address    (mm_interconnect_0_hex0_s1_address),    //                  s1.address
		.write_n    (~mm_interconnect_0_hex0_s1_write),     //                    .write_n
		.writedata  (mm_interconnect_0_hex0_s1_writedata),  //                    .writedata
		.chipselect (mm_interconnect_0_hex0_s1_chipselect), //                    .chipselect
		.readdata   (mm_interconnect_0_hex0_s1_readdata),   //                    .readdata
		.out_port   (hex0_export)                           // external_connection.export
	);

	da_converter_LEDS leds (
		.clk        (clk_clk),                              //                 clk.clk
		.reset_n    (~rst_controller_reset_out_reset),      //               reset.reset_n
		.address    (mm_interconnect_0_leds_s1_address),    //                  s1.address
		.write_n    (~mm_interconnect_0_leds_s1_write),     //                    .write_n
		.writedata  (mm_interconnect_0_leds_s1_writedata),  //                    .writedata
		.chipselect (mm_interconnect_0_leds_s1_chipselect), //                    .chipselect
		.readdata   (mm_interconnect_0_leds_s1_readdata),   //                    .readdata
		.out_port   (leds_export)                           // external_connection.export
	);

	da_converter_jtag_uart_0 jtag_uart_0 (
		.clk            (clk_clk),                                                     //               clk.clk
		.rst_n          (~rst_controller_reset_out_reset),                             //             reset.reset_n
		.av_chipselect  (mm_interconnect_0_jtag_uart_0_avalon_jtag_slave_chipselect),  // avalon_jtag_slave.chipselect
		.av_address     (mm_interconnect_0_jtag_uart_0_avalon_jtag_slave_address),     //                  .address
		.av_read_n      (~mm_interconnect_0_jtag_uart_0_avalon_jtag_slave_read),       //                  .read_n
		.av_readdata    (mm_interconnect_0_jtag_uart_0_avalon_jtag_slave_readdata),    //                  .readdata
		.av_write_n     (~mm_interconnect_0_jtag_uart_0_avalon_jtag_slave_write),      //                  .write_n
		.av_writedata   (mm_interconnect_0_jtag_uart_0_avalon_jtag_slave_writedata),   //                  .writedata
		.av_waitrequest (mm_interconnect_0_jtag_uart_0_avalon_jtag_slave_waitrequest), //                  .waitrequest
		.av_irq         (irq_mapper_receiver0_irq)                                     //               irq.irq
	);

	da_converter_new_sdram_controller_0 new_sdram_controller_0 (
		.clk            (clk_clk),                                                   //   clk.clk
		.reset_n        (~rst_controller_reset_out_reset),                           // reset.reset_n
		.az_addr        (mm_interconnect_0_new_sdram_controller_0_s1_address),       //    s1.address
		.az_be_n        (~mm_interconnect_0_new_sdram_controller_0_s1_byteenable),   //      .byteenable_n
		.az_cs          (mm_interconnect_0_new_sdram_controller_0_s1_chipselect),    //      .chipselect
		.az_data        (mm_interconnect_0_new_sdram_controller_0_s1_writedata),     //      .writedata
		.az_rd_n        (~mm_interconnect_0_new_sdram_controller_0_s1_read),         //      .read_n
		.az_wr_n        (~mm_interconnect_0_new_sdram_controller_0_s1_write),        //      .write_n
		.za_data        (mm_interconnect_0_new_sdram_controller_0_s1_readdata),      //      .readdata
		.za_valid       (mm_interconnect_0_new_sdram_controller_0_s1_readdatavalid), //      .readdatavalid
		.za_waitrequest (mm_interconnect_0_new_sdram_controller_0_s1_waitrequest),   //      .waitrequest
		.zs_addr        (new_sdram_controller_0_wire_addr),                          //  wire.export
		.zs_ba          (new_sdram_controller_0_wire_ba),                            //      .export
		.zs_cas_n       (new_sdram_controller_0_wire_cas_n),                         //      .export
		.zs_cke         (new_sdram_controller_0_wire_cke),                           //      .export
		.zs_cs_n        (new_sdram_controller_0_wire_cs_n),                          //      .export
		.zs_dq          (new_sdram_controller_0_wire_dq),                            //      .export
		.zs_dqm         (new_sdram_controller_0_wire_dqm),                           //      .export
		.zs_ras_n       (new_sdram_controller_0_wire_ras_n),                         //      .export
		.zs_we_n        (new_sdram_controller_0_wire_we_n)                           //      .export
	);

	da_converter_nios2_qsys_0 nios2_qsys_0 (
		.clk                                   (clk_clk),                                                      //                       clk.clk
		.reset_n                               (~rst_controller_reset_out_reset),                              //                   reset_n.reset_n
		.reset_req                             (rst_controller_reset_out_reset_req),                           //                          .reset_req
		.d_address                             (nios2_qsys_0_data_master_address),                             //               data_master.address
		.d_byteenable                          (nios2_qsys_0_data_master_byteenable),                          //                          .byteenable
		.d_read                                (nios2_qsys_0_data_master_read),                                //                          .read
		.d_readdata                            (nios2_qsys_0_data_master_readdata),                            //                          .readdata
		.d_waitrequest                         (nios2_qsys_0_data_master_waitrequest),                         //                          .waitrequest
		.d_write                               (nios2_qsys_0_data_master_write),                               //                          .write
		.d_writedata                           (nios2_qsys_0_data_master_writedata),                           //                          .writedata
		.jtag_debug_module_debugaccess_to_roms (nios2_qsys_0_data_master_debugaccess),                         //                          .debugaccess
		.i_address                             (nios2_qsys_0_instruction_master_address),                      //        instruction_master.address
		.i_read                                (nios2_qsys_0_instruction_master_read),                         //                          .read
		.i_readdata                            (nios2_qsys_0_instruction_master_readdata),                     //                          .readdata
		.i_waitrequest                         (nios2_qsys_0_instruction_master_waitrequest),                  //                          .waitrequest
		.d_irq                                 (nios2_qsys_0_d_irq_irq),                                       //                     d_irq.irq
		.jtag_debug_module_resetrequest        (nios2_qsys_0_jtag_debug_module_reset_reset),                   //   jtag_debug_module_reset.reset
		.jtag_debug_module_address             (mm_interconnect_0_nios2_qsys_0_jtag_debug_module_address),     //         jtag_debug_module.address
		.jtag_debug_module_byteenable          (mm_interconnect_0_nios2_qsys_0_jtag_debug_module_byteenable),  //                          .byteenable
		.jtag_debug_module_debugaccess         (mm_interconnect_0_nios2_qsys_0_jtag_debug_module_debugaccess), //                          .debugaccess
		.jtag_debug_module_read                (mm_interconnect_0_nios2_qsys_0_jtag_debug_module_read),        //                          .read
		.jtag_debug_module_readdata            (mm_interconnect_0_nios2_qsys_0_jtag_debug_module_readdata),    //                          .readdata
		.jtag_debug_module_waitrequest         (mm_interconnect_0_nios2_qsys_0_jtag_debug_module_waitrequest), //                          .waitrequest
		.jtag_debug_module_write               (mm_interconnect_0_nios2_qsys_0_jtag_debug_module_write),       //                          .write
		.jtag_debug_module_writedata           (mm_interconnect_0_nios2_qsys_0_jtag_debug_module_writedata),   //                          .writedata
		.no_ci_readra                          ()                                                              // custom_instruction_master.readra
	);

	da_converter_onchip_memory2_0 onchip_memory2_0 (
		.clk        (clk_clk),                                          //   clk1.clk
		.address    (mm_interconnect_0_onchip_memory2_0_s1_address),    //     s1.address
		.clken      (mm_interconnect_0_onchip_memory2_0_s1_clken),      //       .clken
		.chipselect (mm_interconnect_0_onchip_memory2_0_s1_chipselect), //       .chipselect
		.write      (mm_interconnect_0_onchip_memory2_0_s1_write),      //       .write
		.readdata   (mm_interconnect_0_onchip_memory2_0_s1_readdata),   //       .readdata
		.writedata  (mm_interconnect_0_onchip_memory2_0_s1_writedata),  //       .writedata
		.byteenable (mm_interconnect_0_onchip_memory2_0_s1_byteenable), //       .byteenable
		.reset      (rst_controller_reset_out_reset),                   // reset1.reset
		.reset_req  (rst_controller_reset_out_reset_req),               //       .reset_req
		.freeze     (1'b0)                                              // (terminated)
	);

	da_converter_timer_0 timer_0 (
		.clk        (clk_clk),                                     //   clk.clk
		.reset_n    (~nios2_qsys_0_jtag_debug_module_reset_reset), // reset.reset_n
		.address    (mm_interconnect_0_timer_0_s1_address),        //    s1.address
		.writedata  (mm_interconnect_0_timer_0_s1_writedata),      //      .writedata
		.readdata   (mm_interconnect_0_timer_0_s1_readdata),       //      .readdata
		.chipselect (mm_interconnect_0_timer_0_s1_chipselect),     //      .chipselect
		.write_n    (~mm_interconnect_0_timer_0_s1_write),         //      .write_n
		.irq        (irq_mapper_receiver1_irq)                     //   irq.irq
	);

	da_converter_mm_interconnect_0 mm_interconnect_0 (
		.clk_0_clk_clk                                    (clk_clk),                                                      //                                  clk_0_clk.clk
		.nios2_qsys_0_reset_n_reset_bridge_in_reset_reset (rst_controller_reset_out_reset),                               // nios2_qsys_0_reset_n_reset_bridge_in_reset.reset
		.timer_0_reset_reset_bridge_in_reset_reset        (nios2_qsys_0_jtag_debug_module_reset_reset),                   //        timer_0_reset_reset_bridge_in_reset.reset
		.nios2_qsys_0_data_master_address                 (nios2_qsys_0_data_master_address),                             //                   nios2_qsys_0_data_master.address
		.nios2_qsys_0_data_master_waitrequest             (nios2_qsys_0_data_master_waitrequest),                         //                                           .waitrequest
		.nios2_qsys_0_data_master_byteenable              (nios2_qsys_0_data_master_byteenable),                          //                                           .byteenable
		.nios2_qsys_0_data_master_read                    (nios2_qsys_0_data_master_read),                                //                                           .read
		.nios2_qsys_0_data_master_readdata                (nios2_qsys_0_data_master_readdata),                            //                                           .readdata
		.nios2_qsys_0_data_master_write                   (nios2_qsys_0_data_master_write),                               //                                           .write
		.nios2_qsys_0_data_master_writedata               (nios2_qsys_0_data_master_writedata),                           //                                           .writedata
		.nios2_qsys_0_data_master_debugaccess             (nios2_qsys_0_data_master_debugaccess),                         //                                           .debugaccess
		.nios2_qsys_0_instruction_master_address          (nios2_qsys_0_instruction_master_address),                      //            nios2_qsys_0_instruction_master.address
		.nios2_qsys_0_instruction_master_waitrequest      (nios2_qsys_0_instruction_master_waitrequest),                  //                                           .waitrequest
		.nios2_qsys_0_instruction_master_read             (nios2_qsys_0_instruction_master_read),                         //                                           .read
		.nios2_qsys_0_instruction_master_readdata         (nios2_qsys_0_instruction_master_readdata),                     //                                           .readdata
		.HEX0_s1_address                                  (mm_interconnect_0_hex0_s1_address),                            //                                    HEX0_s1.address
		.HEX0_s1_write                                    (mm_interconnect_0_hex0_s1_write),                              //                                           .write
		.HEX0_s1_readdata                                 (mm_interconnect_0_hex0_s1_readdata),                           //                                           .readdata
		.HEX0_s1_writedata                                (mm_interconnect_0_hex0_s1_writedata),                          //                                           .writedata
		.HEX0_s1_chipselect                               (mm_interconnect_0_hex0_s1_chipselect),                         //                                           .chipselect
		.jtag_uart_0_avalon_jtag_slave_address            (mm_interconnect_0_jtag_uart_0_avalon_jtag_slave_address),      //              jtag_uart_0_avalon_jtag_slave.address
		.jtag_uart_0_avalon_jtag_slave_write              (mm_interconnect_0_jtag_uart_0_avalon_jtag_slave_write),        //                                           .write
		.jtag_uart_0_avalon_jtag_slave_read               (mm_interconnect_0_jtag_uart_0_avalon_jtag_slave_read),         //                                           .read
		.jtag_uart_0_avalon_jtag_slave_readdata           (mm_interconnect_0_jtag_uart_0_avalon_jtag_slave_readdata),     //                                           .readdata
		.jtag_uart_0_avalon_jtag_slave_writedata          (mm_interconnect_0_jtag_uart_0_avalon_jtag_slave_writedata),    //                                           .writedata
		.jtag_uart_0_avalon_jtag_slave_waitrequest        (mm_interconnect_0_jtag_uart_0_avalon_jtag_slave_waitrequest),  //                                           .waitrequest
		.jtag_uart_0_avalon_jtag_slave_chipselect         (mm_interconnect_0_jtag_uart_0_avalon_jtag_slave_chipselect),   //                                           .chipselect
		.LEDS_s1_address                                  (mm_interconnect_0_leds_s1_address),                            //                                    LEDS_s1.address
		.LEDS_s1_write                                    (mm_interconnect_0_leds_s1_write),                              //                                           .write
		.LEDS_s1_readdata                                 (mm_interconnect_0_leds_s1_readdata),                           //                                           .readdata
		.LEDS_s1_writedata                                (mm_interconnect_0_leds_s1_writedata),                          //                                           .writedata
		.LEDS_s1_chipselect                               (mm_interconnect_0_leds_s1_chipselect),                         //                                           .chipselect
		.new_sdram_controller_0_s1_address                (mm_interconnect_0_new_sdram_controller_0_s1_address),          //                  new_sdram_controller_0_s1.address
		.new_sdram_controller_0_s1_write                  (mm_interconnect_0_new_sdram_controller_0_s1_write),            //                                           .write
		.new_sdram_controller_0_s1_read                   (mm_interconnect_0_new_sdram_controller_0_s1_read),             //                                           .read
		.new_sdram_controller_0_s1_readdata               (mm_interconnect_0_new_sdram_controller_0_s1_readdata),         //                                           .readdata
		.new_sdram_controller_0_s1_writedata              (mm_interconnect_0_new_sdram_controller_0_s1_writedata),        //                                           .writedata
		.new_sdram_controller_0_s1_byteenable             (mm_interconnect_0_new_sdram_controller_0_s1_byteenable),       //                                           .byteenable
		.new_sdram_controller_0_s1_readdatavalid          (mm_interconnect_0_new_sdram_controller_0_s1_readdatavalid),    //                                           .readdatavalid
		.new_sdram_controller_0_s1_waitrequest            (mm_interconnect_0_new_sdram_controller_0_s1_waitrequest),      //                                           .waitrequest
		.new_sdram_controller_0_s1_chipselect             (mm_interconnect_0_new_sdram_controller_0_s1_chipselect),       //                                           .chipselect
		.nios2_qsys_0_jtag_debug_module_address           (mm_interconnect_0_nios2_qsys_0_jtag_debug_module_address),     //             nios2_qsys_0_jtag_debug_module.address
		.nios2_qsys_0_jtag_debug_module_write             (mm_interconnect_0_nios2_qsys_0_jtag_debug_module_write),       //                                           .write
		.nios2_qsys_0_jtag_debug_module_read              (mm_interconnect_0_nios2_qsys_0_jtag_debug_module_read),        //                                           .read
		.nios2_qsys_0_jtag_debug_module_readdata          (mm_interconnect_0_nios2_qsys_0_jtag_debug_module_readdata),    //                                           .readdata
		.nios2_qsys_0_jtag_debug_module_writedata         (mm_interconnect_0_nios2_qsys_0_jtag_debug_module_writedata),   //                                           .writedata
		.nios2_qsys_0_jtag_debug_module_byteenable        (mm_interconnect_0_nios2_qsys_0_jtag_debug_module_byteenable),  //                                           .byteenable
		.nios2_qsys_0_jtag_debug_module_waitrequest       (mm_interconnect_0_nios2_qsys_0_jtag_debug_module_waitrequest), //                                           .waitrequest
		.nios2_qsys_0_jtag_debug_module_debugaccess       (mm_interconnect_0_nios2_qsys_0_jtag_debug_module_debugaccess), //                                           .debugaccess
		.onchip_memory2_0_s1_address                      (mm_interconnect_0_onchip_memory2_0_s1_address),                //                        onchip_memory2_0_s1.address
		.onchip_memory2_0_s1_write                        (mm_interconnect_0_onchip_memory2_0_s1_write),                  //                                           .write
		.onchip_memory2_0_s1_readdata                     (mm_interconnect_0_onchip_memory2_0_s1_readdata),               //                                           .readdata
		.onchip_memory2_0_s1_writedata                    (mm_interconnect_0_onchip_memory2_0_s1_writedata),              //                                           .writedata
		.onchip_memory2_0_s1_byteenable                   (mm_interconnect_0_onchip_memory2_0_s1_byteenable),             //                                           .byteenable
		.onchip_memory2_0_s1_chipselect                   (mm_interconnect_0_onchip_memory2_0_s1_chipselect),             //                                           .chipselect
		.onchip_memory2_0_s1_clken                        (mm_interconnect_0_onchip_memory2_0_s1_clken),                  //                                           .clken
		.timer_0_s1_address                               (mm_interconnect_0_timer_0_s1_address),                         //                                 timer_0_s1.address
		.timer_0_s1_write                                 (mm_interconnect_0_timer_0_s1_write),                           //                                           .write
		.timer_0_s1_readdata                              (mm_interconnect_0_timer_0_s1_readdata),                        //                                           .readdata
		.timer_0_s1_writedata                             (mm_interconnect_0_timer_0_s1_writedata),                       //                                           .writedata
		.timer_0_s1_chipselect                            (mm_interconnect_0_timer_0_s1_chipselect)                       //                                           .chipselect
	);

	da_converter_irq_mapper irq_mapper (
		.clk           (clk_clk),                        //       clk.clk
		.reset         (rst_controller_reset_out_reset), // clk_reset.reset
		.receiver0_irq (irq_mapper_receiver0_irq),       // receiver0.irq
		.receiver1_irq (irq_mapper_receiver1_irq),       // receiver1.irq
		.sender_irq    (nios2_qsys_0_d_irq_irq)          //    sender.irq
	);

	altera_reset_controller #(
		.NUM_RESET_INPUTS          (2),
		.OUTPUT_RESET_SYNC_EDGES   ("deassert"),
		.SYNC_DEPTH                (2),
		.RESET_REQUEST_PRESENT     (1),
		.RESET_REQ_WAIT_TIME       (1),
		.MIN_RST_ASSERTION_TIME    (3),
		.RESET_REQ_EARLY_DSRT_TIME (1),
		.USE_RESET_REQUEST_IN0     (0),
		.USE_RESET_REQUEST_IN1     (0),
		.USE_RESET_REQUEST_IN2     (0),
		.USE_RESET_REQUEST_IN3     (0),
		.USE_RESET_REQUEST_IN4     (0),
		.USE_RESET_REQUEST_IN5     (0),
		.USE_RESET_REQUEST_IN6     (0),
		.USE_RESET_REQUEST_IN7     (0),
		.USE_RESET_REQUEST_IN8     (0),
		.USE_RESET_REQUEST_IN9     (0),
		.USE_RESET_REQUEST_IN10    (0),
		.USE_RESET_REQUEST_IN11    (0),
		.USE_RESET_REQUEST_IN12    (0),
		.USE_RESET_REQUEST_IN13    (0),
		.USE_RESET_REQUEST_IN14    (0),
		.USE_RESET_REQUEST_IN15    (0),
		.ADAPT_RESET_REQUEST       (0)
	) rst_controller (
		.reset_in0      (nios2_qsys_0_jtag_debug_module_reset_reset), // reset_in0.reset
		.reset_in1      (nios2_qsys_0_jtag_debug_module_reset_reset), // reset_in1.reset
		.clk            (clk_clk),                                    //       clk.clk
		.reset_out      (rst_controller_reset_out_reset),             // reset_out.reset
		.reset_req      (rst_controller_reset_out_reset_req),         //          .reset_req
		.reset_req_in0  (1'b0),                                       // (terminated)
		.reset_req_in1  (1'b0),                                       // (terminated)
		.reset_in2      (1'b0),                                       // (terminated)
		.reset_req_in2  (1'b0),                                       // (terminated)
		.reset_in3      (1'b0),                                       // (terminated)
		.reset_req_in3  (1'b0),                                       // (terminated)
		.reset_in4      (1'b0),                                       // (terminated)
		.reset_req_in4  (1'b0),                                       // (terminated)
		.reset_in5      (1'b0),                                       // (terminated)
		.reset_req_in5  (1'b0),                                       // (terminated)
		.reset_in6      (1'b0),                                       // (terminated)
		.reset_req_in6  (1'b0),                                       // (terminated)
		.reset_in7      (1'b0),                                       // (terminated)
		.reset_req_in7  (1'b0),                                       // (terminated)
		.reset_in8      (1'b0),                                       // (terminated)
		.reset_req_in8  (1'b0),                                       // (terminated)
		.reset_in9      (1'b0),                                       // (terminated)
		.reset_req_in9  (1'b0),                                       // (terminated)
		.reset_in10     (1'b0),                                       // (terminated)
		.reset_req_in10 (1'b0),                                       // (terminated)
		.reset_in11     (1'b0),                                       // (terminated)
		.reset_req_in11 (1'b0),                                       // (terminated)
		.reset_in12     (1'b0),                                       // (terminated)
		.reset_req_in12 (1'b0),                                       // (terminated)
		.reset_in13     (1'b0),                                       // (terminated)
		.reset_req_in13 (1'b0),                                       // (terminated)
		.reset_in14     (1'b0),                                       // (terminated)
		.reset_req_in14 (1'b0),                                       // (terminated)
		.reset_in15     (1'b0),                                       // (terminated)
		.reset_req_in15 (1'b0)                                        // (terminated)
	);

endmodule
