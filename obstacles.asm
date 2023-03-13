check_collisions:
  ;call check_collision_exit
  call check_collision_borders
  jmp done
; returns:
is_collision db 0x0

check_collision_borders:
  ; -- Left border
  mov ax, screen_x_start_pixel
  mov bx, word [player_x]
  cmp bx, ax
  je collision_detected
  ; -- 

  ; -- Right border
  mov cl, 5
  mov ax, screen_x_end_pixel
  mul cl
  mov bx, word [player_x]
  cmp bx, ax
  je collision_detected
  ; -- 

  jne no_collision_detected

check_collision_exit:
  ; if the collision is with the exit,
  ; change the variables for maze and screen info counters
  ; and return the player to the starting position
  ; and call a collision
  mov ax, word [player_x]
  cmp ax, exit_x
  jmp done

no_collision_detected:
  mov byte [is_collision], 0x0
  jmp done
collision_detected:
  mov byte [is_collision], 0x1
  jmp done
