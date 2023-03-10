debug_msg:              db "Hello world!", 13, 10, 0
right_msg:              db "Pressed right!", 13, 10, 0
left_msg:               db "Pressed left!", 13, 10, 0
up_msg:                 db "Pressed up!", 13, 10, 0
down_msg:               db "Pressed down!", 13, 10, 0
pause_msg:              db 13,10,13,10,13,10,"Pressed pause!", 13, 10, 0
restart_msg:            db "Pressed restart!", 13, 10, 0
game_paused_msg:        db "Press L to unpause!", 13, 10, 0
game_unpaused_msg:      db "Game was unpaused!", 13, 10, 0
game_start_msg:         db "Hi! Welcome to the game Maze: The Last Path, to play please press Enter to start the game", 13, 10, 0
move_controls_msg:      db "Use ",25,26,27,24," to move",  0
pause_controls_msg:     db "Press L to pause", 0
reset_controls_msg:     db "Press R to reset", 0
finish_game_msg:        db "Game Victory!", 13, 10, "         Press R to restart", 0

hexstr:                 db "0123456789ABCDEF"

pixel_width             equ 5
screen_x_start_pixel    equ 0
screen_y_start_pixel    equ 6
screen_x_end_pixel      equ 50
screen_y_end_pixel      equ 39

exit_x                  equ 250
exit_y                  equ 95
exit_color              equ 0x0f

; Obstaculos superados
obst_overcm             db      0x34
; Nivel actual de 1 - 2
current_level           db      0x0
; Desde el origin de la columna
player_x                dw      0x0
; Desde el origin de la fila
player_y                dw      0x0
player_start_x          equ 0x0078
player_start_y          equ 0x0050

level_1_msg:            db      "Level: 1", 0
level_2_msg:            db      "Level: 2", 0
obstacles_lv1_msg:      db "Obstacles: 0", 0
obstacles_lv2_msg:      db "Obstacles: 9", 0
obstacles_lvw_msg:      db "Obstacles: 20", 0
game_name_str:          db      "Name: Maze", 0
wall_color              equ     0x04       ; Rojo
wall_color2             equ     0x01       ; Azul
player_color            equ     0x02       ; Verde