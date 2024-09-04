# Pipelined-RV32I-Processor-with-Hazard-Unit

This project focuses on the design of a pipelined RV32I Processor with a Hazard Unit

## Table of Contents
- [Introduction](#Introduction)
- [Supported Instruction Set](#supported_instruction_set)
- [Final Datapath](#final_datapath)

## Introduction
What is the difference between a Single-Cycle Processor and a Pipelined Processor in case of latency and throughput?

For the single-cycle processor:

Latency is the total time taken to complete a single instruction, for a single-cycle processor any instruction is completed in one clock cycle but the clock cycle must be long enough to be able to complete the slowest possible instruction, therefore its latency is relatively high.

Throughput is the number of instructions the processor can complete in a given amount of time so the single-cycle processor has a low throughput as an instruction can be completed in one clock cycle.

For the pipelined processor:

In a pipelined processor, the instruction execution is broken down into stages, and multiple instructions can be processed simultaneously at different stages of the pipeline. For example, while one instruction is executed, another can be decoded, and yet another can be fetched.

Latency for any single instruction still depends on the number of pipeline stages. However, because each stage of the pipeline typically takes only one clock cycle, the latency for any single instruction is roughly equal to the number of pipeline stages multiplied by the clock cycle time. Even though individual instructions take multiple cycles to complete, the clock cycle can be much shorter than in a single-cycle design.

Throughput is much higher in a pipelined processor because once the pipeline is full, the processor can complete an instruction every clock cycle. This is significantly more efficient than the single-cycle design

Therefore <br>
For Latency: <br>
Single-Cycle Processor: High latency per instruction due to long clock cycle.<br>
Pipelined Processor: Lower latency per clock cycle for each stage, but total latency for an instruction is the sum of the latencies of all stages.<br>
For Throughput: <br>
Single-Cycle Processor: Lower throughput since each instruction takes an entire clock cycle.<br>
Pipelined Processor: Higher throughput as an instruction can be completed every clock cycle once the pipeline is full.<br>


## Supported Instruction Set

My Design supports 27 different instructions which are classified according to these instruction formats

<div align="center">
  <img src="https://github.com/KareemAtefEECE/Pipelined-RV32I-Processor-with-Hazard-Unit/blob/main/Images/Instructions types.png" alt=" Instructions types">
</div>
<br>

The Supported R-Type instructions formats:
<div align="center">
  <img src="https://github.com/KareemAtefEECE/Pipelined-RV32I-Processor-with-Hazard-Unit/blob/main/Images/supported R-Type Instructions.png" alt=" Instructions types">
</div>
<br>

The Supported I-Type instructions formats:
<div align="center">
  <img src="https://github.com/KareemAtefEECE/Pipelined-RV32I-Processor-with-Hazard-Unit/blob/main/Images/supported I-Type Instructions.png" alt=" Instructions types">
</div>
<br>

The Supported S-Type instructions formats:
<div align="center">
  <img src="https://github.com/KareemAtefEECE/Pipelined-RV32I-Processor-with-Hazard-Unit/blob/main/Images/supported S-Type Instructions.png" alt=" Instructions types">
</div>
<br>

The Supported B-Type instruction format:
<div align="center">
  <img src="https://github.com/KareemAtefEECE/Pipelined-RV32I-Processor-with-Hazard-Unit/blob/main/Images/supported B-Type Instruction.png" alt=" Instructions types">
</div>
<br>

The Supported J-Type instruction format:

<div align="center">
  <img src="https://github.com/KareemAtefEECE/Pipelined-RV32I-Processor-with-Hazard-Unit/blob/main/Images/supported J-Type Instruction.png" alt=" Instructions types">
</div>
<br>

# Final Datapath

<div align="center">
  <img src="https://github.com/KareemAtefEECE/Pipelined-RV32I-Processor-with-Hazard-Unit/blob/main/Images/Final Datapath.png" alt=" Instructions types">
</div>
<br>
