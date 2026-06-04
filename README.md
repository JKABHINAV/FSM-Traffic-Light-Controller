# FSM Traffic Light Controller Design & Verification

## Project Overview
This project implements a 4-state Finite State Machine (FSM) to control a standard four-way traffic light intersection. Designed in Verilog, the project focuses on safe state transitions, timing control, and rigorous logic verification.

As an aspiring Design Verification (DV) Engineer, the primary focus of this repository is the accompanying testbench, which asserts correct state transitions and guarantees that conflicting signals (e.g., Green in both directions) cannot occur.

## Design Architecture
The FSM consists of 4 distinct states to manage the North-South (NS) and East-West (EW) traffic flow:
* `S_NS_GREEN`: NS is Green, EW is Red
* `S_NS_YELLOW`: NS is Yellow, EW is Red
* `S_EW_GREEN`: NS is Red, EW is Green
* `S_EW_YELLOW`: NS is Red, EW is Yellow

## Verification Methodology
The testbench (`traffic_light_tb.v`) is designed to:
1. Generate a stable clock stimulus.
2. Apply asynchronous resets to verify the system defaults to a safe known state (`S_NS_GREEN`).
3. Monitor and log state transitions over time.
4. Verify edge cases to ensure no illegal states (e.g., both NS and EW displaying Green simultaneously) are reached during the simulation runtime.

## Files
* `traffic_light.v` : The RTL design containing the state machine and transition logic.
* `traffic_light_tb.v` : The testbench used to stimulate the RTL and verify functional correctness.
