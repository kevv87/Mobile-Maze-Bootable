pause:
  mov si, game_paused_msg
  call print
  jmp done
unpause:
  mov si, game_unpaused_msg
  call print
  jmp done
