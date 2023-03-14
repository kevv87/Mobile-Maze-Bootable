check_collisions:
  call check_collision_exit
  cmp byte [current_level], 3
  je done
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

  ; -- up border
  mov cl, 5
  mov ax, screen_y_start_pixel
  mul cl
  mov bx, word [player_y]
  cmp bx, ax
  je collision_detected
  ; -- 

  ; -- down border
  mov cl, 5
  mov ax, screen_y_end_pixel
  mul cl
  mov bx, word [player_y]
  cmp bx, ax
  je collision_detected
  ; ---

  cmp byte [current_level], 1 ; Comparar current_level con 1
  je check_level1 ; Saltar a check_level1 si es igual a 1
  cmp byte [current_level], 2 ; Comparar current_level con 2
  je check_level2 ; Saltar a check_level2 si es igual a 2



check_level1:

 ;check row 1
  mov cl, 5
  mov ax, 18
  mul cl
  mov bx, word [player_y]
  cmp bx, ax
  jne obstacle_2
  mov cl, 5
  mov ax, 20
  mul cl
  mov bx, word [player_x]
  cmp bx, ax
  jl obstacle_2
  mov ax, 50
  mul cl
  mov bx, word [player_x]
  cmp bx, ax
  jg obstacle_2
  jmp collision_detected

obstacle_2:

  mov cl, 5
  mov ax, 13
  mul cl
  mov bx, word [player_y]
  cmp bx, ax
  jne obstacle_3
  mov cl, 5
  mov ax, 10
  mul cl
  mov bx, word [player_x]
  cmp bx, ax
  jl obstacle_3
  mov ax, 40
  mul cl
  mov bx, word [player_x]
  cmp bx, ax
  jg obstacle_3
  jmp collision_detected

obstacle_3:
  mov cl, 5
  mov ax, 9
  mul cl
  mov bx, word [player_y]
  cmp bx, ax
  jne obstacle_4
  mov cl, 5
  mov ax, 10
  mul cl
  mov bx, word [player_x]
  cmp bx, ax
  jl obstacle_4
  mov ax, 20
  mul cl
  mov bx, word [player_x]
  cmp bx, ax
  jg obstacle_4
  jmp collision_detected


obstacle_4:
  mov cl, 5
  mov ax, 21
  mul cl
  mov bx, word [player_y]
  cmp bx, ax
  jne obstacle_5
  mov cl, 5
  mov ax, 0
  mul cl
  mov bx, word [player_x]
  cmp bx, ax
  jl obstacle_5
  mov ax, 10
  mul cl
  mov bx, word [player_x]
  cmp bx, ax
  jg obstacle_5
  jmp collision_detected

obstacle_5:
  mov cl, 5
  mov ax, 24
  mul cl
  mov bx, word [player_y]
  cmp bx, ax
  jne obstacle_6
  mov cl, 5
  mov ax, 10
  mul cl
  mov bx, word [player_x]
  cmp bx, ax
  jl obstacle_6
  mov ax, 20
  mul cl
  mov bx, word [player_x]
  cmp bx, ax
  jg obstacle_6
  jmp collision_detected

obstacle_6:
  mov cl, 5
  mov ax, 29
  mul cl
  mov bx, word [player_y]
  cmp bx, ax
  jne obstacle_7
  mov cl, 5
  mov ax, 25
  mul cl
  mov bx, word [player_x]
  cmp bx, ax
  jl obstacle_7
  mov ax, 50
  mul cl
  mov bx, word [player_x]
  cmp bx, ax
  jg obstacle_7
  jmp collision_detected

obstacle_7:
  mov cl, 5
  mov ax, 32
  mul cl
  mov bx, word [player_y]
  cmp bx, ax
  jne obstacle_8
  mov cl, 5
  mov ax, 20
  mul cl
  mov bx, word [player_x]
  cmp bx, ax
  jl obstacle_8
  mov ax, 30
  mul cl
  mov bx, word [player_x]
  cmp bx, ax
  jg obstacle_8
  jmp collision_detected

obstacle_8:
  mov cl, 5
  mov ax, 35
  mul cl
  mov bx, word [player_y]
  cmp bx, ax
  jne obstacle_9
  mov cl, 5
  mov ax, 10
  mul cl
  mov bx, word [player_x]
  cmp bx, ax
  jl obstacle_9
  mov ax, 45
  mul cl
  mov bx, word [player_x]
  cmp bx, ax
  jg obstacle_9
  jmp collision_detected

obstacle_9:
  mov cl, 5
  mov ax, 40
  mul cl
  mov bx, word [player_x]
  cmp bx, ax
  jne obstacle_10
  mov cl, 5
  mov ax, 6
  mul cl
  mov bx, word [player_y]
  cmp bx, ax
  jl obstacle_10
  mov ax, 9
  mul cl
  mov bx, word [player_y]
  cmp bx, ax
  jg obstacle_10
  jmp collision_detected

obstacle_10:
  mov cl, 5
  mov ax, 20
  mul cl
  mov bx, word [player_x]
  cmp bx, ax
  jne no_collision_detected
  mov cl, 5
  mov ax, 9
  mul cl
  mov bx, word [player_y]
  cmp bx, ax
  jl no_collision_detected
  mov ax, 32
  mul cl
  mov bx, word [player_y]
  cmp bx, ax
  jg no_collision_detected
  jmp collision_detected


check_level2:
 ;check row 1
  mov cl, 5
  mov ax, 18
  mul cl
  mov bx, word [player_y]
  cmp bx, ax
  jne obstacle_11
  mov cl, 5
  mov ax, 30
  mul cl
  mov bx, word [player_x]
  cmp bx, ax
  jl obstacle_11
  mov ax, 47
  mul cl
  mov bx, word [player_x]
  cmp bx, ax
  jg obstacle_11
  jmp collision_detected

obstacle_11:

  mov cl, 5
  mov ax, 13
  mul cl
  mov bx, word [player_y]
  cmp bx, ax
  jne obstacle_12
  mov cl, 5
  mov ax, 10
  mul cl
  mov bx, word [player_x]
  cmp bx, ax
  jl obstacle_12
  mov ax, 40
  mul cl
  mov bx, word [player_x]
  cmp bx, ax
  jg obstacle_12
  jmp collision_detected

obstacle_12:

  mov cl, 5
  mov ax, 18
  mul cl
  mov bx, word [player_y]
  cmp bx, ax
  jne obstacle_13
  mov cl, 5
  mov ax, 10
  mul cl
  mov bx, word [player_x]
  cmp bx, ax
  jl obstacle_13
  mov ax, 15
  mul cl
  mov bx, word [player_x]
  cmp bx, ax
  jg obstacle_13
  jmp collision_detected

obstacle_13:

  mov cl, 5
  mov ax, 21
  mul cl
  mov bx, word [player_y]
  cmp bx, ax
  jne obstacle_14
  mov cl, 5
  mov ax, 0
  mul cl
  mov bx, word [player_x]
  cmp bx, ax
  jl obstacle_14
  mov ax, 10
  mul cl
  mov bx, word [player_x]
  cmp bx, ax
  jg obstacle_14
  jmp collision_detected

obstacle_14:

  mov cl, 5
  mov ax, 24
  mul cl
  mov bx, word [player_y]
  cmp bx, ax
  jne obstacle_15
  mov cl, 5
  mov ax, 10
  mul cl
  mov bx, word [player_x]
  cmp bx, ax
  jl obstacle_15
  mov ax, 20
  mul cl
  mov bx, word [player_x]
  cmp bx, ax
  jg obstacle_15
  jmp collision_detected

obstacle_15:

  mov cl, 5
  mov ax, 9
  mul cl
  mov bx, word [player_y]
  cmp bx, ax
  jne obstacle_16
  mov cl, 5
  mov ax, 30
  mul cl
  mov bx, word [player_x]
  cmp bx, ax
  jl obstacle_16
  mov ax, 50
  mul cl
  mov bx, word [player_x]
  cmp bx, ax
  jg obstacle_16
  jmp collision_detected

obstacle_16:

  mov cl, 5
  mov ax, 35
  mul cl
  mov bx, word [player_y]
  cmp bx, ax
  jne obstacle_17
  mov cl, 5
  mov ax, 21
  mul cl
  mov bx, word [player_x]
  cmp bx, ax
  jl obstacle_17
  mov ax, 45
  mul cl
  mov bx, word [player_x]
  cmp bx, ax
  jg obstacle_17
  jmp collision_detected

obstacle_17:

  mov cl, 5
  mov ax, 30
  mul cl
  mov bx, word [player_x]
  cmp bx, ax
  jne obstacle_18
  mov cl, 5
  mov ax, 13
  mul cl
  mov bx, word [player_y]
  cmp bx, ax
  jl obstacle_18
  mov ax, 32
  mul cl
  mov bx, word [player_y]
  cmp bx, ax
  jg obstacle_18
  jmp collision_detected

obstacle_18:

  mov cl, 5
  mov ax, 10
  mul cl
  mov bx, word [player_x]
  cmp bx, ax
  jne obstacle_19
  mov cl, 5
  mov ax, 16
  mul cl
  mov bx, word [player_y]
  cmp bx, ax
  jl obstacle_19
  mov ax, 21
  mul cl
  mov bx, word [player_y]
  cmp bx, ax
  jg obstacle_19
  jmp collision_detected

obstacle_19:

  mov cl, 5
  mov ax, 26
  mul cl
  mov bx, word [player_y]
  cmp bx, ax
  jne obstacle_20
  mov cl, 5
  mov ax, 30
  mul cl
  mov bx, word [player_x]
  cmp bx, ax
  jl obstacle_20
  mov ax, 50
  mul cl
  mov bx, word [player_x]
  cmp bx, ax
  jg obstacle_20
  jmp collision_detected

obstacle_20:

  mov cl, 5
  mov ax, 20
  mul cl
  mov bx, word [player_x]
  cmp bx, ax
  jne no_collision_detected
  mov cl, 5
  mov ax, 9
  mul cl
  mov bx, word [player_y]
  cmp bx, ax
  jl no_collision_detected
  mov ax, 35
  mul cl
  mov bx, word [player_y]
  cmp bx, ax
  jg no_collision_detected
  jmp collision_detected

check_collision_exit:
  ; if the collision is with the exit,
  ; change the variables for maze and screen info counters
  ; and return the player to the starting position
  ; and call a collision
  mov ax, word [player_x]
  cmp ax, exit_x
  jne no_collision_detected
  mov ax, word [player_y]
  cmp ax, exit_y
  jne no_collision_detected

  call next_level

  jmp done

next_level:
  inc byte [current_level]
  mov word [player_x], player_start_x
  mov word [player_y], player_start_y
  jmp done

no_collision_detected:
  mov byte [is_collision], 0x0
  jmp done
collision_detected:
  mov byte [is_collision], 0x1
  jmp done
