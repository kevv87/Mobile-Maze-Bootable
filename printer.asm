print:
  mov ah, 0x0e
print_loop:
  lodsb ; This loads the first character of si into al
  or al, al ; when al == 0, string has finished
  jz done ; if so, finish this function
  int 0x10 ; this bios interrupt prints the character in al
  jmp print_loop

; All credits of this magic function to crazzybuddah
; from his tutorial "Babysteps" on osdev
hex2str:
  mov di, hex_outstr_buf
  mov ax, [hex2str_input_hex]
  mov si, hexstr
  mov cx, 4 ; four places
hexloop:
  rol ax, 4
  mov bx, ax
  and bx, 0x0f
  mov bl, [si + bx]
  mov [di], bl
  inc di
  dec cx
  jnz hexloop

  mov si, hex_outstr_buf
  jmp done ; output on hex_outstr_buf

hex_outstr_buf db "0000", 0 ; buffer for the string output of the hex2str function
hex2str_input_hex dw 0
