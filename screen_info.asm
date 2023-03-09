print_info:
  call obstacles_overcome_count
  ;call level_msg
  jmp done

obstacles_overcome_count:
  mov si, obstacles_msg
  ;mov si, debug_msg
  call print
  ;mov al, '0'
  ;mov al, [obst_overcm]
  ;int 0x10
  jmp done

level_msg:
    ; Cargar el mensaje de nivel actual
    mov     si, CURRENT_LEVEL_MSG
    call print
    jmp done
