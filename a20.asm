; Returns to caller if A20 gate is cleared.
; Continues to A20_on if A20 line is set.
; Written by Elad Ashkcenazi 
enable_a20:
  mov     ax,2403h                ;--- A20-Gate Support ---
  int     15h
  jb      a20_ns                  ;INT 15h is not supported
  cmp     ah,0
  jnz     a20_ns                  ;INT 15h is not supported

  mov     ax,2402h                ;--- A20-Gate Status ---
  int     15h
  jb      a20_failed              ;couldn't get status
  cmp     ah,0
  jnz     a20_failed              ;couldn't get status

  cmp     al,1
  jz      a20_activated           ;A20 is already activated

  mov     ax,2401h                ;--- A20-Gate Activate ---
  int     15h
  jb      a20_failed              ;couldn't activate the gate
  cmp     ah,0
  jnz     a20_failed              ;couldn't activate the gate
 
a20_activated:                  ;go A20_on
  mov si, a20_activated_msg
  call print
  jmp done

a20_ns:
  mov si, a20_ns_msg
  call print
  jmp done

a20_failed:
  mov si, a20_failed_msg
  call print
  jmp done

