org 0x8000

game:
  call variable_initialization
  call enable_keyhandler
  call print_welcome_msg

  call activate_vga_mode
  call refresh_screen

  call game_loop
  ;call end_program

print_welcome_msg:
  mov si, game_start_msg
  call print

start_loop:
  cmp byte [current_level], 0x00
  je start_loop
  jmp done

game_loop:
  jmp game_loop


variable_initialization:
    mov byte [current_level], 0x00
    mov byte [obst_overcm], 0x0
    ; Posicion del jugador en el centro de la pantalla
    mov word [player_x], player_start_x
    mov word [player_y], player_start_y 
    jmp done

; -- Mode functions
activate_vga_mode:
  mov ax, 0x13
  mov bx, 0x105 ; clear the screen
  int 0x10
  jmp done

; --- Auxiliary functions
done:
  ret
idone: 
  iret
end_program:
  cli 
  hlt

; --- Subroutines
%include "printer.asm"
%include "keyhandler.asm"
%include "pause.asm"
%include "restart.asm"
%include "screen_info.asm"
%include "obstacles.asm"
; --- Data
%include "constants.asm"
