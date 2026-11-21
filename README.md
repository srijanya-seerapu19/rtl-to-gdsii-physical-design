# RTL-to-GDSII Physical Design Flow
### Open-Source ASIC Implementation on SkyWater 130nm CMOS PDK

![PDK](https://img.shields.io/badge/PDK-SkyWater%20130nm-orange)
![Flow](https://img.shields.io/badge/Flow-RTL%20to%20GDSII-blue)
![License](https://img.shields.io/badge/License-Apache%202.0-green)

---

## 📌 Overview
This repository documents a systematic, stage-by-stage implementation of the digital ASIC physical design flow—transitioning from high-level Register-Transfer Level (RTL) Verilog descriptions to manufacturing-ready GDSII mask layout. The physical implementation targets the **SkyWater 130nm High-Density (`sky130_fd_sc_hd`)** standard cell library using an open-source Electronic Design Automation (EDA) toolchain.

---

## 🛠️ Tools & Technologies Matrix

The following table details the open-source tools and technology libraries utilized throughout the physical design flow, along with their specific functional responsibilities:

| Tool / Technology | Category | Technical Purpose in Flow |
| :--- | :--- | :--- |
| **Verilog HDL (IEEE 1364)** | Hardware Description | Models digital hardware behavior and structure at the Register-Transfer Level. |
| **Icarus Verilog (`iverilog`)** | Simulation Compiler | Compiles RTL source and testbenches into simulation executables; executes Gate-Level Simulation (GLS). |
| **GTKWave** | Waveform Analysis | Graphical viewer for Value Change Dump (`.vcd`) files to verify signal transitions and bus protocols. |
| **Yosys** | Logic Synthesis | Elaborates HDL descriptions into generic Boolean logic networks and performs logic optimization. |
| **Berkeley ABC** | Technology Mapping | Maps optimized Boolean networks onto target foundry standard cells based on timing and area metrics. |
| **SkyWater 130nm (`sky130_fd_sc_hd`)** | Foundry PDK | 130nm CMOS foundry Process Design Kit; provides high-density standard cell models and layout rules. |
| **Liberty Library (`.lib`)** | Timing & Power Characterization | Contains cell delays, input/output capacitances, setup/hold constraints, and power specifications. |
| **OpenSTA** | Static Timing Analysis | Verifies circuit timing against design constraints, reporting setup/hold slacks and maximum clock frequency. |
| **OpenROAD / OpenLane** | Physical Implementation | Orchestrates automated backend physical design from post-synthesis netlist to final layout. |
| **RePlAce** | Standard Cell Placement | Performs global analytical placement and legalized row assignment of standard logic cells. |
| **TritonCTS** | Clock Tree Synthesis | Constructs balanced clock distribution networks (buffer trees) to minimize clock skew and latency. |
| **FastRoute / TritonRoute** | Routing Engines | Generates global routing tracks and performs detailed metal-layer interconnect routing (Metal 1–5). |
| **Magic** | Physical Verification | Validates layout geometry compliance against foundry Design Rule Checking (DRC) specifications. |
| **Netgen** | Schematic Verification | Performs Layout Versus Schematic (LVS) comparison between extracted layout and gate-level netlist. |
| **KLayout** | Mask Layout Inspection | High-performance viewer and editor for production-format GDSII/OASIS layout data. |

---

## 🗺️ Complete ASIC Design Flow

The digital ASIC implementation flow bridges the gap between functional abstraction and silicon layout:

```
[ RTL Verilog HDL ]
       │
       ▼
[ Functional Simulation (iverilog + GTKWave) ]
       │
       ▼
[ Logic Synthesis & Technology Mapping (Yosys + ABC) ] ───► [ Gate-Level Simulation (GLS) ]
       │
       ▼
[ Floorplanning & Power Distribution Network (OpenROAD) ]
       │
       ▼
[ Standard Cell Placement (RePlAce / OpenROAD) ]
       │
       ▼
[ Clock Tree Synthesis - CTS (TritonCTS) ]
       │
       ▼
[ Global & Detailed Routing (FastRoute / TritonRoute) ]
       │
       ▼
[ Physical Verification: DRC & LVS (Magic + Netgen) ]
       │
       ▼
[ Final GDSII Mask Layout (Magic / KLayout) ]
```

---

## 📂 Implementation Roadmap & Flow Stages

- [x] **[Stage 01: RTL Simulation & Logic Synthesis](./01_rtl_simulation_and_synthesis/)**
  - *Demonstrated Design*: 2-to-4 Line Binary Decoder with Active-High Enable
  - *Key Deliverables*: Verilog behavioral modeling, GTKWave waveform verification, technology mapping to SkyWater 130nm standard cells, silicon area characterization ($31.28\ \mu\text{m}^2$), and Gate-Level Simulation (GLS).
- [x] **[Stage 02: Sequential Logic & Memory Elements](./02_sequential_logic_dff/)**
  - *Demonstrated Design*: Positive Edge-Triggered D Flip-Flop with Active-Low Asynchronous Reset
  - *Key Deliverables*: Clocked sequential modeling, asynchronous reset verification in GTKWave, Yosys `dfflibmap` technology mapping to `sky130_fd_sc_hd__dfrtp_1`, silicon area calculation ($25.02\ \mu\text{m}^2$), and Gate-Level Simulation (GLS).
- [ ] **Stage 03: Standard Cell Placement & Clock Tree Synthesis (CTS)**
  - Global analytical placement, cell legalization, clock buffer insertion, skew minimization, and hold-time slack closure.
- [ ] **Stage 04: Interconnect Routing, Physical Verification & GDSII Stream-Out**
  - Detailed routing across Sky130 metal layers, Design Rule Checking (DRC) via Magic, Layout Versus Schematic (LVS) via Netgen, and final GDSII generation.
