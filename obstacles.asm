check_collisions:
  call check_collision_exit
  jmp done
; returns:
is_collision db 0x0

check_collision_exit:
  ; if the collision is with the exit,
  ; change the variables for maze and screen info counters
  ; and return the player to the starting position
  ; and call a collision
  mov ax, word [player_x]
  cmp ax, exit_x
  jne 
  jmp done
