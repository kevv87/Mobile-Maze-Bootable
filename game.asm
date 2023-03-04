hello_world:
  mov si, debug_msg
  call print
  call enable_keyhandler
  call inf_loop

  ;call end_program

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
; --- Data
%include "constants.asm"
