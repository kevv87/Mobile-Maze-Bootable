print:
  mov ah, 0x0e
print_loop:
  lodsb ; This loads the first character of si into al
  or al, al ; when al == 0, string has finished
  jz done ; if so, finish this function
  int 0x10 ; this bios interrupt prints the character in al
  jmp print_loop
