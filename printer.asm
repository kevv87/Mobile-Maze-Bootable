print:
  mov ah, 0x0e
print_loop:
  ;mov bl, 0x04 ; this prints on red
  lodsb ; This loads the first character of si into al
  cmp al, 0 ; when al == 0, string has finished
  je done ; if so, finish this function
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

; Remember that mode 13 has 320x200 pixels
; parameters:
print_pixel_start_x dw 0
print_pixel_start_y dw 0
print_pixel:
  mov byte [pixel_counter_x], 0
  mov byte [pixel_counter_y], 0
  mov ah, 0x0c ; draw pixel mode
  mov bh, 0x00 ; video page normally zero
  mov al, 0x02 ; color = green
loop_print_pixel:
  mov dx, word [print_pixel_start_x] ; x coordinates
  add dl, byte [pixel_counter_x]
  mov cx, word [print_pixel_start_y] ; y coordinates
  add cl, byte [pixel_counter_y]
  int 0x10 ; video interrupt

  ; Incrementing x
  inc byte [pixel_counter_x]
  ; TODO: pixel width
  cmp byte [pixel_counter_x], 5
  jl loop_print_pixel

  ; Incrementing y
  mov byte [pixel_counter_x], 0
  inc byte [pixel_counter_y]
  cmp byte [pixel_counter_y], 5
  jl loop_print_pixel

  jmp done
pixel_counter_x db 0
pixel_counter_y db 0

print_player:
  mov bx, word [player_x]
  mov word [print_pixel_start_x], bx
  mov bx, word [player_y]
  mov word [print_pixel_start_y], bx
  call print_pixel
  jmp done

print_newline:
  mov ah, 0x0e
  mov al, 0x0a
  int 0x10
  mov al, 0x0d
  int 0x10
  jmp done

print_hello_world:
  mov si, debug_msg
  call print
  jmp done

hex_outstr_buf db "0000", 0 ; buffer for the string output of the hex2str function
hex2str_input_hex dw 0
