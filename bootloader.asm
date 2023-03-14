org 0x7c00

boot:
  xor ax, ax      ; Set AX register to 0
  mov ds, ax      ; Move 0 into DS segment register
  mov ss, ax      ; Move 0 into SS segment register
  mov sp, 0x6ef0  ; Set stack pointer to memory location 0x6ef0
  
  cli             ; Clear interrupt flag to disable maskable hardware interrupts

  ; Loading the game
  mov ah, 0x2     ; BIOS disk function to read disk sectors
  mov al, 8       ; Number of sectors to read
  mov ch, 0       ; Cylinder number to read from
  mov dh, 0       ; Head number to read from
  mov cl, 2       ; Sector number to read from
  mov bx, 0x8000  ; Destination memory address to read to
  int 0x13        ; Trigger the BIOS disk interrupt
  
  jmp 0x8000      ; Jump to memory address 0x8000 to execute loaded program
 
  times 510 - ($ - $$) db 0 
  dw 0xaa55       ; Magic number to indicate a bootable sector