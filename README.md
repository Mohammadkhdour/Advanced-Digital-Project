# Advanced Digital Design Project

## Overview
This project involves the design and simulation of several digital components, including an Arithmetic Logic Unit (ALU), a register file, a valid opcode checker, D-flip-flops, and a top module that integrates all the components. The project is written in Verilog and SystemVerilog, and the goal is to implement and test various functionalities like addition, subtraction, logical operations, and more.

## Project Components

### 1. ALU (Arithmetic Logic Unit)
- The ALU performs arithmetic and logical operations based on a 6-bit opcode.
- The ALU has two 32-bit input operands and produces a 32-bit result.
- Operations include addition, subtraction, comparison, and absolute value calculations.
- The opcode used is determined by the last digit of the student’s ID.

### 2. Register File
- The register file consists of a 32x32-bit memory array with 5-bit addresses.
- It supports reading and writing operations based on clock edges.
- The design uses a synchronous register, where data is written to a specified address on the positive clock edge.

### 3. Valid Opcode Module
- This module checks whether the given opcode is valid.
- It ensures that only valid opcodes allow access to the register file.

### 4. D-flip-flop
- A D-flip-flop is used to introduce a delay of one clock cycle for the opcode input to the ALU.
  
### 5. Top Module
- The top module integrates the ALU, register file, valid opcode checker, and D-flip-flop into a complete system.
- It receives a clock and instruction inputs and outputs the result from the ALU.

### 6. Testbench
- The testbench is written in SystemVerilog and is used to simulate and verify the functionality of all modules.
- It includes predefined instructions that trigger operations in the ALU and register file.
- The testbench ensures that the expected results match the actual results through a series of checks and displays.

## How to Run the Project

1. **Prerequisites**:
   - A Verilog/SystemVerilog simulator such as ModelSim, VCS, or XSIM is required.
   
2. **Steps**:
   1. Clone or download the repository.
   2. Compile the Verilog and SystemVerilog files using the simulator.
   3. Run the simulation to verify the functionality of each module and the overall system.
   4. Review the output to confirm correct operation.

## Project Files

- **ALU.v**: The Verilog code for the Arithmetic Logic Unit.
- **D_flipflop.v**: The Verilog code for the D-flip-flop module.
- **register_file.v**: The Verilog code for the register file.
- **Valied_opcode.v**: The Verilog code for the valid opcode checker.
- **Top_module.sv**: The SystemVerilog code for the top module.
- **testbench.sv**: The SystemVerilog testbench for simulating the design.
- **AdvancedDigital_projectReport.pdf**: The project report detailing the design and simulation results.

## Results
- All operations were tested, including addition, subtraction, logical operations (AND, NOT), and comparison.
- The testbench ensures that each module behaves as expected, and the correct results are produced for each operation.
  
## Conclusion
This project demonstrates the design and integration of essential digital components using Verilog and SystemVerilog. It covers the implementation of an ALU, a register file, and other auxiliary modules, with testing to verify correct functionality.

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgements
Thanks to the course instructor and peers for their support and feedback during the development of this project.
