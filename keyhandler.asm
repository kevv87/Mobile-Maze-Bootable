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

  ; --- Return 
  mov ax, [port60]

  ; -- Checking for presses of the L key regardless of pause status
  cmp ax, 0x0026
  je L_key_pressed

  ; -- When paused it should only respond to L presses
  cmp byte [pause_status], 1
  je switch_keys_done

  ; -- Checking the rest of the keys
  cmp ax, 0x0050
  je down_key_pressed

  cmp ax, 0x004B
  je left_key_pressed

  cmp ax, 0x0048
  je up_key_pressed

  cmp ax, 0x004D
  je right_key_pressed

  cmp ax, 0x0013
  je R_key_pressed
  
switch_keys_done:
  jmp idone

left_key_pressed:
  sub word [player_x], 5
  call refresh_screen
  jmp switch_keys_done

right_key_pressed:
  add word [player_x], 5
  call refresh_screen
  jmp switch_keys_done

down_key_pressed:
  add word [player_y], 5
  call refresh_screen
  jmp switch_keys_done

up_key_pressed:
  sub word [player_y], 5
  call refresh_screen
  jmp switch_keys_done

L_key_pressed:
  mov si, pause_msg
  call print
  call toggle_pause_status

  cmp byte [pause_status], 1
  je start_pausing
  jne start_unpausing

R_key_pressed:
  mov si, restart_msg
  call print
  call reboot
  jmp switch_keys_done

debug_key:
  mov word [hex2str_input_hex], ax
  call hex2str
  call print
  jmp done

port60 dw 0 ; can we change this name?
pause_status db 0
