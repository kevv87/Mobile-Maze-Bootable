print_info:
  call move_video_cursor_to_0
  call obstacles_overcome_count
  call print_newline

  call level_msg
  call print_newline

  call print_game_name
  call print_newline

  call print_game_controls

  cmp byte [current_level], 3
  jne done
  call print_finish_game_msg

  jmp done

print_finish_game_msg:
  mov byte [col_video_cursor_to], 10
  mov byte [row_video_cursor_to], 10
  call move_video_cursor_col
  call move_video_cursor_row
  mov si, finish_game_msg
  call print
  jmp done

print_game_controls:
  mov byte [col_video_cursor_to], 14
  call move_video_cursor_col
  mov si, move_controls_msg
  call print

  mov byte [row_video_cursor_to], 1
  call move_video_cursor_row

  mov si, pause_controls_msg
  call print

  mov byte [row_video_cursor_to], 2
  call move_video_cursor_row

  mov si, reset_controls_msg
  call print

  jmp done

obstacles_overcome_count:
  mov al, byte [current_level]
  cmp al, 1
  jne obstacles_lv2

  mov si, obstacles_lv1_msg
  jmp obstacles_print
obstacles_lv2:
  mov si, obstacles_lv2_msg
obstacles_print:
  call print
  jmp done

level_msg:
  mov al, byte [current_level]
  cmp al, 1
  jne level2_msg
  mov si, level_1_msg
  jmp level_print
level2_msg:
  mov si, level_2_msg
level_print:
    call print
    jmp done

print_game_name:
  mov si, game_name_str
  call print
  jmp done
  
