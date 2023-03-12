print:
  mov ah, 0x0e
print_loop:
  mov bl, 0x03 ; this prints on red
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
print_pixel_color db 0
print_pixel:
  mov byte [pixel_counter_x], 0
  mov byte [pixel_counter_y], 0
  mov ah, 0x0c ; draw pixel mode
  mov bh, 0x00 ; video page normally zero
  mov al, byte [print_pixel_color] ; color = green
loop_print_pixel:
  mov dx, word [print_pixel_start_y] ; y coordinates
  add dl, byte [pixel_counter_y]
  mov cx, word [print_pixel_start_x] ; x coordinates
  add cl, byte [pixel_counter_x]
  int 0x10 ; video interrupt

  ; Incrementing x
  inc byte [pixel_counter_x]
  cmp byte [pixel_counter_x], pixel_width
  jl loop_print_pixel

  ; Incrementing y
  mov byte [pixel_counter_x], 0
  inc byte [pixel_counter_y]
  cmp byte [pixel_counter_y], pixel_width
  jl loop_print_pixel

  jmp done
pixel_counter_x db 0
pixel_counter_y db 0

print_player:
  mov bx, word [player_x]
  mov word [print_pixel_start_x], bx
  mov bx, word [player_y]
  mov word [print_pixel_start_y], bx
  mov byte [print_pixel_color], player_color
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

; parameters:
print_line_start_x dw 0
print_line_end_x dw 0
print_horiz_line_y dw 0
print_horiz_line:
  mov word [print_line_counter], 0
print_horiz_line_loop:
  ; print_line_start_x = print_line_start * 5 print_line_counter * 5
  mov cl, pixel_width
  mov ax, word [print_line_start_x]
  mul cl
  mov bx, ax
  mov ax, word [print_line_counter]
  mul cl
  add bx, ax
  ; --
  mov word [print_pixel_start_x], bx

  ; print_horiz_line_y *= 5
  mov ax, word [print_horiz_line_y]
  mul cl
  ; ---
  mov word [print_pixel_start_y], ax
  
  mov byte [print_pixel_color], 0x04 ; line color blue
  call print_pixel
  inc word [print_line_counter]

  mov ax, word [print_line_end_x]
  mov cl, pixel_width
  mul cl
  ; comparamos donde escribimos el ultimo pixel
  ; contra print_line_end_x * 5
  cmp word [print_pixel_start_x], ax
  jl print_horiz_line_loop

  jmp done

; parameters:
print_line_start_y dw 0
print_line_end_y dw 0
print_vert_line_x dw 0
print_vert_line:
  mov word [print_line_counter], 0
print_vert_line_loop:
  ; print_line_start_y = print_line_start_y * 5 + print_line_counter * 5
  mov cl, pixel_width
  mov ax, word [print_line_start_y]
  mul cl
  mov bx, ax
  mov ax, word [print_line_counter]
  mul cl
  add bx, ax
  ; --
  mov word [print_pixel_start_y], bx

  ; print_horiz_line_y *= 5
  mov ax, word [print_vert_line_x]
  mul cl
  ; ---
  mov word [print_pixel_start_x], ax
  mov byte [print_pixel_color], wall_color
  call print_pixel

  inc word [print_line_counter]

  mov ax, word [print_line_end_y]
  mov cl, pixel_width
  mul cl
  ; comparamos donde escribimos el ultimo pixel
  ; contra print_line_end_y * 5
  cmp word [print_pixel_start_y], ax
  jl print_vert_line_loop

  jmp done

print_line_counter dw 0

print_borders:
  mov word [print_line_start_x], screen_x_start_pixel
  mov word [print_line_end_x], screen_x_end_pixel
  mov word [print_horiz_line_y], screen_y_start_pixel
  call print_horiz_line

  mov word [print_line_start_x], screen_x_start_pixel
  mov word [print_line_end_x], screen_x_end_pixel
  mov word [print_horiz_line_y], screen_y_end_pixel
  call print_horiz_line

  mov word [print_line_start_y], screen_y_start_pixel
  mov word [print_line_end_y], screen_y_end_pixel
  mov word [print_vert_line_x], screen_x_start_pixel
  call print_vert_line

  mov word [print_line_start_y], screen_y_start_pixel
  mov word [print_line_end_y], screen_y_end_pixel
  mov word [print_vert_line_x], screen_x_end_pixel
  call print_vert_line

  jmp done

refresh_screen:
  mov ah, 0x06 ; funci—n de borrar
  mov al, 0x00 ; borrar toda la pantalla
  mov bh, 0x00 ; negro sobre negro
  mov ch, 0x00 ; fila inicial
  mov cl, 0x00 ; columna inicial
  mov dh, 0x18 ; fila final
  mov dl, 0x4F ; columna final
  int 0x10     ; llamar a la interrupci—n

  call print_info
  call print_player
  call print_borders
  jmp done

move_video_cursor_to_0:
  mov ah, 0x02 ; function 2h, set cursor position
  mov bh, 0x00 ; page number
  mov dh, 0x00 ; row
  mov dl, 0x00 ; column
  int 0x10     ; call BIOS video service
  jmp done

; parameters:
col_video_cursor_to db 0
move_video_cursor_col:
  mov ah, 0x02 ; function 2h, set cursor position
  mov bh, 0x00 ; page number
  mov dl, byte [col_video_cursor_to] ; column
  int 0x10     ; call BIOS video service
  jmp done

; parameters:
row_video_cursor_to db 0
move_video_cursor_row:
  mov ah, 0x02 ; function 2h, set cursor position
  mov bh, 0x00 ; page number
  mov dh, byte [row_video_cursor_to] ; rowumn
  int 0x10     ; call BIOS video service
  jmp done

hex_outstr_buf db "0000", 0 ; buffer for the string output of the hex2str function
hex2str_input_hex dw 0
