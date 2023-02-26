# Mobile Maze Bootable
This is a bootloader for x86 architecture that loads a simple maze game, handling interrupts, basic Text-based User Interface in assembly language.

## Dependencies
- NASM Compiler

## Compilation
To compile run `make`, this will create a file named `boot.bin`, this file can then be burned into a disk image or runned through a simulator.

## Simulation
During developing, for simulation we used [QEMU](https://www.qemu.org/), you can follow the instructions to install it ion the project's webpage.
You can run `make simulate` to start a QEMU simulation.
