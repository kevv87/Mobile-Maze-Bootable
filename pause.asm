start_pausing:
  call pause
  jmp switch_keys_done

start_unpausing:
  call unpause
  jmp switch_keys_done

toggle_pause_status:
  xor byte [pause_status], 1
  jmp done

pause:
  mov si, game_paused_msg
  call print
  jmp done

unpause:
  mov si, game_unpaused_msg
  call print
  jmp done
