org 0x7c00

boot:
  xor ax, ax
  mov ds, ax 
  mov ss, ax
  mov sp, 0x6ef0
  
  cli
  ; Loading the game
  mov ah, 0x2 ; read disk
  mov al, 8 ; sectors to read
  mov ch, 0 ; cylinder idx
  mov dh, 0 ; head idx
  mov cl, 2 ; sector idx
  mov bx, 0x8000
  int 0x13
  
  jmp 0x8000
 
  times 510 - ($ - $$) db 0
  dw 0xaa55

