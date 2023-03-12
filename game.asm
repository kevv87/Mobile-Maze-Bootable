org 0x8000

game:
  call print_hello_world
  call variable_initialization
  call activate_vga_mode
  call enable_keyhandler
  call refresh_screen

  call game_loop
  ;call inf_loop
  ;call end_program

game_loop:
  jmp game_loop

variable_initialization:
    mov word [CURRENT_COLOR], BASE_COLOR
    mov byte [current_level], 0x01
    mov byte [obst_overcm], 0x0
    ; Posicion del jugador en el centro de la pantalla
    mov word [player_x], 0x0078
    mov word [player_y], 0x0050
    mov word [wall_x], 0x00A8
    mov word [wall_y], 0x60
    jmp done

; -- Mode functions
activate_vga_mode:
  mov ax, 0x13
  mov bx, 0x105 ; clear the screen
  int 0x10
  jmp done

; --- Auxiliary functions
inf_loop:
  jmp inf_loop
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
; --- Data
%include "constants.asm"
