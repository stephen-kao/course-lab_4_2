# SoC Lab4-2 Group10

## File arrangement

* **Design sources**:
  * In `/testbench/counter_la_fir` folder: https://github.com/stephen-kao/course-lab_4_2/tree/main/testbench/counter_la_fir
    * counter_la_fir.c
    * fir.c
    * fir.h
  * In `firmware` https://github.com/stephen-kao/course-lab_4_2/tree/main/firmware
    * caravel.h
* **user_project design** in `/rtl/user` folder: https://github.com/stephen-kao/course-lab_4_2/tree/main/rtl/user
  * user_proj_example.counter.v
  * WB_AXI.v
  * fir.v
  * input_buffer.v
  * bram.v
  * bram11.v
* Synthesis area report: https://github.com/stephen-kao/course-lab_4_2/blob/main/project_1/project_1.runs/synth_1/user_proj_example_utilization_synth.rpt
* Synthesis log file: https://github.com/stephen-kao/course-lab_4_2/blob/main/project_1/project_1.runs/synth_1/user_proj_example.vds
* Synthesis timing report: https://github.com/stephen-kao/course-lab_4_2/blob/main/project_1/timing_report.txt
* Simulation log: https://github.com/stephen-kao/course-lab_4_2/tree/main/logfile
* Waveform: https://github.com/stephen-kao/course-lab_4_2/tree/main/waveform
* Report: https://github.com/stephen-kao/course-lab_4_2/blob/main/Report.pdf

## Introduction
In lab4-1, we use the firmware code to implement the FIR engine, and we build up the interface of wishbone and user bram. 

In this lab, we use the FIR.v design in lab3 to do filtering rather than using the firmware code. On the other hand, we use firmware code to control the dataflow.
The two main tasks we’ve done in lab4-2 are: 
1. WB-AXI decoder and interface (both are in `WB_AXI.v`)
2. The firmware code to control the flow (in `counter_la_fir.c`)

There’re other things we also put our efforts into: 
1. modify `FIR.v` to communicate with the WB successfully
2. wrap and merge WB-AXI decoder, FIR and the original file in `user_proj_example.counter.v`
3. define the new MMIO address for user project in `caravel.h`
4. modify the testbench (`counter_la_fir_tb.v`) to print the received data Y and the timer

## Simulation for FIR
```sh
cd testbench/counter_la_fir
source run_clean
source run_sim
```
