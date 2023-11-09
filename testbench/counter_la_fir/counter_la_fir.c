/*
 * SPDX-FileCopyrightText: 2020 Efabless Corporation
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * SPDX-License-Identifier: Apache-2.0
 */

// This include is relative to $CARAVEL_PATH (see Makefile)
#include <defs.h>
#include <stub.c>

extern int* fir();

// --------------------------------------------------------

/*
	MPRJ Logic Analyzer Test:
		- Observes counter value through LA probes [31:0] 
		- Sets counter initial value through LA probes [63:32]
		- Flags when counter value exceeds 500 through the management SoC gpio
		- Outputs message to the UART when the test concludes successfuly
*/

void main()
{
	int j;

	/* Set up the housekeeping SPI to be connected internally so	*/
	/* that external pin changes don't affect it.			*/

	// reg_spi_enable = 1;
	// reg_spimaster_cs = 0x00000;

	// reg_spimaster_control = 0x0801;

	// reg_spimaster_control = 0xa002;	// Enable, prescaler = 2,
                                        // connect to housekeeping SPI

	// Connect the housekeeping SPI to the SPI master
	// so that the CSB line is not left floating.  This allows
	// all of the GPIO pins to be used for user functions.

	// The upper GPIO pins are configured to be output
	// and accessble to the management SoC.
	// Used to flad the start/end of a test 
	// The lower GPIO pins are configured to be output
	// and accessible to the user project.  They show
	// the project count value, although this test is
	// designed to read the project count through the
	// logic analyzer probes.
	// I/O 6 is configured for the UART Tx line

	reg_mprj_io_31 = GPIO_MODE_MGMT_STD_OUTPUT;
	reg_mprj_io_30 = GPIO_MODE_MGMT_STD_OUTPUT;
	reg_mprj_io_29 = GPIO_MODE_MGMT_STD_OUTPUT;
	reg_mprj_io_28 = GPIO_MODE_MGMT_STD_OUTPUT;
	reg_mprj_io_27 = GPIO_MODE_MGMT_STD_OUTPUT;
	reg_mprj_io_26 = GPIO_MODE_MGMT_STD_OUTPUT;
	reg_mprj_io_25 = GPIO_MODE_MGMT_STD_OUTPUT;
	reg_mprj_io_24 = GPIO_MODE_MGMT_STD_OUTPUT;
	reg_mprj_io_23 = GPIO_MODE_MGMT_STD_OUTPUT;
	reg_mprj_io_22 = GPIO_MODE_MGMT_STD_OUTPUT;
	reg_mprj_io_21 = GPIO_MODE_MGMT_STD_OUTPUT;
	reg_mprj_io_20 = GPIO_MODE_MGMT_STD_OUTPUT;
	reg_mprj_io_19 = GPIO_MODE_MGMT_STD_OUTPUT;
	reg_mprj_io_18 = GPIO_MODE_MGMT_STD_OUTPUT;
	reg_mprj_io_17 = GPIO_MODE_MGMT_STD_OUTPUT;
	reg_mprj_io_16 = GPIO_MODE_MGMT_STD_OUTPUT;

	reg_mprj_io_15 = GPIO_MODE_USER_STD_OUTPUT;
	reg_mprj_io_14 = GPIO_MODE_USER_STD_OUTPUT;
	reg_mprj_io_13 = GPIO_MODE_USER_STD_OUTPUT;
	reg_mprj_io_12 = GPIO_MODE_USER_STD_OUTPUT;
	reg_mprj_io_11 = GPIO_MODE_USER_STD_OUTPUT;
	reg_mprj_io_10 = GPIO_MODE_USER_STD_OUTPUT;
	reg_mprj_io_9  = GPIO_MODE_USER_STD_OUTPUT;
	reg_mprj_io_8  = GPIO_MODE_USER_STD_OUTPUT;
	reg_mprj_io_7  = GPIO_MODE_USER_STD_OUTPUT;
	reg_mprj_io_6  = GPIO_MODE_MGMT_STD_OUTPUT;
	reg_mprj_io_5  = GPIO_MODE_USER_STD_OUTPUT;
	reg_mprj_io_4  = GPIO_MODE_USER_STD_OUTPUT;
	reg_mprj_io_3  = GPIO_MODE_USER_STD_OUTPUT;
	reg_mprj_io_2  = GPIO_MODE_USER_STD_OUTPUT;
	reg_mprj_io_1  = GPIO_MODE_USER_STD_OUTPUT;
	reg_mprj_io_0  = GPIO_MODE_USER_STD_OUTPUT;

	// Set UART clock to 64 kbaud (enable before I/O configuration)
	// reg_uart_clkdiv = 625;
	reg_uart_enable = 1;
	
	// Now, apply the configuration
	reg_mprj_xfer = 1;
	while (reg_mprj_xfer == 1);

	// Configure LA probes [31:0], [127:64] as inputs to the cpu 
	// Configure LA probes [63:32] as outputs from the cpu
	reg_la0_oenb = reg_la0_iena = 0x00000000;    // [31:0]
	reg_la1_oenb = reg_la1_iena = 0xFFFFFFFF;    // [63:32]
	reg_la2_oenb = reg_la2_iena = 0x00000000;    // [95:64]
	reg_la3_oenb = reg_la3_iena = 0x00000000;    // [127:96]

	// Flag start of the test 
	reg_mprj_datal = 0xAB400000;

	// Set Counter value to zero through LA probes [63:32]
	reg_la1_data = 0x00000000;

	// Configure LA probes from [63:32] as inputs to disable counter write
	reg_la1_oenb = reg_la1_iena = 0x00000000;    

	// filter size and data length
	int N = 11;
	int DATA_LENGTH = 64;

	// send data length
	reg_mprj_data_length = DATA_LENGTH;

	// send coefficient
	int* tmp = fir();
	reg_mprj_coef0  = *(tmp   );
	reg_mprj_coef1  = *(tmp+1 );
	reg_mprj_coef2  = *(tmp+2 );
	reg_mprj_coef3  = *(tmp+3 );
	reg_mprj_coef4  = *(tmp+4 );
	reg_mprj_coef5  = *(tmp+5 );
	reg_mprj_coef6  = *(tmp+6 );
	reg_mprj_coef7  = *(tmp+7 );
	reg_mprj_coef8  = *(tmp+8 );
	reg_mprj_coef9  = *(tmp+9 );
	reg_mprj_coef10 = *(tmp+10);

	reg_mprj_rcoef0  = *(tmp   );
	reg_mprj_rcoef1  = *(tmp+1 );
	reg_mprj_rcoef2  = *(tmp+2 );
	reg_mprj_rcoef3  = *(tmp+3 );
	reg_mprj_rcoef4  = *(tmp+4 );
	reg_mprj_rcoef5  = *(tmp+5 );
	reg_mprj_rcoef6  = *(tmp+6 );
	reg_mprj_rcoef7  = *(tmp+7 );
	reg_mprj_rcoef8  = *(tmp+8 );
	reg_mprj_rcoef9  = *(tmp+9 );
	reg_mprj_rcoef10 = *(tmp+10);

	for(int j = 0; j < 3; j++){
		// send start mark and ap_start (MSB-LSB:idle, done, start)
		reg_mprj_datal = 0x00A50000;
		reg_mprj_ap_signal = 1;

		// send input data
		for (int i=0; i<DATA_LENGTH - 1; i++){
			reg_mprj_data = *(tmp+i+N);

			// receive one FIR output
			reg_mprj_datal = (reg_la1_data_in << 16);
		}
		reg_mprj_last = *(tmp+DATA_LENGTH-1+N);
		reg_mprj_datal = (reg_la1_data_in << 16);
		// if (j != 2){
		// 	reg_mprj_datal = 0x005A0000;
		// } else {
		// 	reg_mprj_datal = (reg_la1_data_in << 24) + 0x005A0000;
		// }
		reg_mprj_datal = (reg_la1_data_in << 24) + 0x005A0000;
	}
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// LA interface input   : LA interface input in user_proj_example.counter.v
	// reg_la0_data_in      : la_data_out[31:0]         // rdata 
	// reg_la1_data_in      : la_data_out[63:32]        // sm_tdata (output Y)
	// reg_la2_data_in      : la_data_out[95:64]        //  [66/2] sm_tlast | [65/1] sm_tvalid | [64/0] rvalid
	// reg_la3_data_in      : la_data_out[127:96]
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////


	// send end mark
	reg_mprj_datal = (reg_la1_data_in << 24) + 0x005A0000;

	
	//print("\n");
	//print("Monitor: Test 1 Passed\n\n");	// Makes simulation very long!
	reg_mprj_datal = 0xAB510000;
}

