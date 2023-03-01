enable_keyhandler:
  xor ax, ax
  mov bx, ax
  cli
  mov bx, 0x09 ; hardware interrupt number
  shl bx, 2 ; multiply by the size of the entry in the IVT
  xor ax, ax
  mov gs, ax
  mov [gs:bx], word keyhandler
  mov [gs:bx + 2], ds ; segment
  sti ; reenable interrupts

  ret

keyhandler:
  in al, 0x60 ; get key data from port 0x60
  mov bl, al ; save it on bl
  mov byte [port60], al
  
  in al, 0x61
  mov ah, al
  or al, 0x80 ; disable bit 7
  out 0x61, al ; send it back
  xchg ah, al ; get original
  out 0x61, al ; send it back

  mov al, 0x20 ; end of interrupt
  out 0x20, al

  and bl, 0x80 ; key release
  jnz idone ; dont repeat

  mov si, [port60]
  call print

  jmp idone

port60 dw 0 ; can we change this name?
