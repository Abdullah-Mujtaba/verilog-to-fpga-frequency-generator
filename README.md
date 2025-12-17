#verilog-to-fpga-frequency-generator

This repository contains a complete Verilog FPGA signal chain built for a Digital Systems Design Complex Engineering Problem (CEP):

#A DDS (Direct Digital Synthesizer) generates sine waves at configurable frequencies

#A low-pass FIR filter (cutoff ≈ 1 kHz) filters the generated waveform

#A PWM module converts the filtered samples into a PWM stream for FPGA output (audio / external RC low-pass)

Project Goals

Implement a FIR low-pass filter in Verilog with a cutoff around 1 kHz

Generate test signals using a DDS (sine waves with varying frequency)

Run the signal chain in real-time on FPGA and output the filtered result through PWM

-------------------------------------------------------------------------------------------------
Modules
1) DDS (Direct Digital Synthesizer)

Purpose: Generate a digital sine wave at different output frequencies.

Typical implementation details:

Uses a phase accumulator

Phase increments by a configurable phase_step (controls frequency)

Uses a sine LUT (lookup table) to map phase → amplitude/sample

Outputs:

sine_sample (digital sample, typically signed)

2) FIR Low-Pass Filter (Cutoff ≈ 1 kHz)

Purpose: Filter the DDS sine wave using a real-time FIR filter implementation in Verilog.

Typical implementation details:

Tapped delay line (shift register of input samples)
​
Coefficients can be:

hard-coded in Verilog, or

stored in a ROM/array

Notes:

Cutoff is designed around 1 kHz (exact cutoff depends on chosen sample rate + coefficient design)

If coefficients are symmetric, the design can be optimized (optional)

3) PWM Output Module

Purpose: Convert filtered digital samples into a 1-bit PWM stream for hardware output.

Typical implementation details:

Maps signed sample range → unsigned duty cycle

Uses a counter and compares it with a duty value:

if counter < duty → PWM high else PWM low

Output:

pwm_out suitable for:

a buzzer/speaker via RC filter/amplifier

logic analyzer observation

external DAC-style reconstruction (RC low-pass)
