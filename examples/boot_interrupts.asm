; This code is a basic bootloader that handles keyboard interrupts and prints
; the scan code (not ASCII) of the pressed key on screen

bits 16 ; Tell NASM this is a 16 bit code
org 0x7c00 ; tell NASM to start putting instructions in that specific region of memory
; because 0x7c00 is the default memory address where BIOS loads the first sector
; of a bootable disk
boot:
  xor ax, ax
  mov ds, ax
  mov ss, ax
  mov sp, 0x9c00 ; Stack pointer

  cli ; no interruptions

  mov bx, 0x09 ; hardware interrupt #
  shl bx, 2 ; multiply by the size of each entry in the IVT
  xor ax, ax
  mov gs, ax ; start of memory
  mov [gs:bx], word keyhandler
  mov [gs:bx+2], ds ; segment
  sti ; reenable interrupts

  mov si, hello; point si register to hello label memory location
  mov ah, 0x0e ; sets up the correct function code into the ah register

  call print_loop

stuck:
  jmp stuck

keyhandler: ; This will just print the scan code without converting it to ASCII
  in al, 0x60 ; get key data from port 0x60
  mov bl, al ; save it on bl  
  mov byte [port60], al

  in al, 0x61
  mov ah, al
  or al, 0x80 ; disable bit 7 
  out 0x61, al ; send it back
  xchg ah, al ; get original
  out 0x61, al ; send that back

  mov al, 0x20 ; end of interrupt 
  out 0x20, al

  and bl, 0x80 ; key release
  jnz idone ; dont repeat

  mov ax, [port60]
  mov word [reg16], ax
  call printreg16

  jmp idone

print_loop:
  lodsb
  or al, al ; is al == 0?
  jz done
  int 0x10 ; run BIOS interrupt 0x10 - Video services
  jmp print_loop

printreg16:
   mov di, outstr16
   mov ax, [reg16]
   mov si, hexstr
   mov cx, 4   ;four places
hexloop:
   rol ax, 4   ;leftmost will
   mov bx, ax   ; become
   and bx, 0x0f   ; rightmost
   mov bl, [si + bx];index into hexstr
   mov [di], bl
   inc di
   dec cx
   jnz hexloop

   mov si, outstr16
   mov ah, 0x0e ; sets up the correct function code into the ah register
   call print_loop
   jmp done

done: ret
idone: iret

hello: db "Hello world!", 0 ; Data label with 'Hello world' and 0 at the end

port60 dw 0
hexstr   db "0123456789ABCDEF"
outstr16   db "0000", 0  ;register value string
reg16   dw    0  ; pass values to printreg16
times 510 - ($-$$) db 0 ; pad remaining 510 bytes with zeroes
dw 0xaa55 ; magic number

