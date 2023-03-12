print_info:
  call move_video_cursor_to_0
  call obstacles_overcome_count
  call print_newline

  call level_msg
  call print_newline

  call print_game_name
  call print_newline

  jmp done

obstacles_overcome_count:
  mov si, obstacles_msg
  call print
  ; TODO: Imprimir el número de obstáculos
  ; hay que hacer un conversor de numero a string
  mov al, "0"
  int 0x10
  jmp done

level_msg:
    ; Cargar el mensaje de nivel actual
    mov     si, CURRENT_LEVEL_MSG
    ; TODO: Aqui tambien, ocupamos el conversor de numero a string
    call print
    jmp done

print_game_name:
  mov si, game_name_str
  call print
  jmp done
  
