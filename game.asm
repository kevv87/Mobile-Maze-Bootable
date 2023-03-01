hello_world:
  mov si, debug_msg
  call print
  call end_program

; --- Auxiliary functions
done:
  ret
idone: 
  iret
end_program:
  cli 
  hlt

%include "printer.asm"
%include "constants.asm"
