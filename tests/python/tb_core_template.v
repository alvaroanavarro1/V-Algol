/*
 * Algol - A RISC-V (RV32I) Processor Core.
 *
 * Copyright (C) 2017 Angel Terrones <angelterrones@gmail.com>
 *
 * Permission to use, copy, modify, and/or distribute this software for any
 * purpose with or without fee is hereby granted, provided that the above
 * copyright notice and this permission notice appear in all copies.
 *
 * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
 * ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
 * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
 * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 */

module test_core;
        reg         clk_i;
        reg         rst_i;
        wire [31:0] wbm_addr_o;
        wire [31:0] wbm_dat_o;
        wire [3:0]  wbm_sel_o;
        wire        wbm_cyc_o;
        wire        wbm_stb_o;
        wire        wbm_we_o;
        reg [31:0]  wbm_dat_i;
        reg         wbm_ack_i;
        reg         wbm_err_i;
        reg         xint_meip_i;
        reg         xint_mtip_i;
        reg         xint_msip_i;

        initial begin
`ifdef TRACE
                $dumpfile("build/algol.vcd");
                $dumpvars(0, dut);
`endif
                $from_myhdl(clk_i, rst_i, wbm_dat_i, wbm_ack_i, wbm_err_i, xint_meip_i, xint_mtip_i, xint_msip_i);
                $to_myhdl(wbm_addr_o, wbm_dat_o, wbm_sel_o, wbm_cyc_o, wbm_stb_o, wbm_we_o);
        end

        algol #(.HART_ID({HART_ID}),
                .RESET_ADDR({RESET_ADDR}))
        dut(.clk_i(clk_i),
            .rst_i(rst_i),
            .wbm_addr_o(wbm_addr_o),
            .wbm_dat_o(wbm_dat_o),
            .wbm_sel_o(wbm_sel_o),
            .wbm_cyc_o(wbm_cyc_o),
            .wbm_stb_o(wbm_stb_o),
            .wbm_we_o(wbm_we_o),
            .wbm_dat_i(wbm_dat_i),
            .wbm_ack_i(wbm_ack_i),
            .wbm_err_i(wbm_err_i),
            .xint_meip_i(xint_meip_i),
            .xint_mtip_i(xint_mtip_i),
            .xint_msip_i(xint_msip_i)
            );

endmodule // test_core
// EOF