debug_msg: db "Hello world!", 13, 10, 0

right_msg: db "Pressed right!", 13, 10, 0
left_msg: db "Pressed left!", 13, 10, 0
up_msg: db "Pressed up!", 13, 10, 0
down_msg: db "Pressed down!", 13, 10, 0
pause_msg: db "Pressed pause!", 13, 10, 0
restart_msg: db "Pressed restart!", 13, 10, 0
game_paused_msg: db "Game is paused! Press L to continue", 13, 10, 0
game_unpaused_msg: db "Game was unpaused!", 13, 10, 0

hexstr: db "0123456789ABCDEF"

; -- Globals
; Obstaculos superados
obst_overcm             db      0x0
; Nivel actual de 1 - 2
current_level           db      0x0
; Nombre del jugador
player_name             db      0x0
; Desde el origin de la columna
player_x:               dw      0x0
; Desde el origin de la fila
player_y:               dw      0x0

; Desde el origin de la columna
wall_x:               dw      0x0
; Desde el origin de la fila
wall_y:               dw      0x0
CURRENT_LEVEL_MSG:      db      "Nivel:   ", 0
CURRENT_COLOR:          db      0x0
PLAYER_NAME:            db      "carlos"
; Pantalla de 320x200x256
ROWS                    equ     168         ; 200 - 32
COLS                    equ     288         ; 200 - 32
TILE_SIZE               equ     8           ; Sprites de 8x8
;-------------------------------Colores--------------------------------
; Se usa una representacion de 8 bit para cada color de la forma
; RRRGGGBB
; Hay una imagen llamada 8bit_color_mode.png con todos los colores
; posibles, si quieren cambiar un color, solo buscan la fila i y la
; columna j y el valor decimal sera, lo convierten a hex
; y ese es el color que usan, y tiene que usarse BASE_COLOR + el color
; que se obtuvo
BASE_COLOR              equ     0x0C00      ; Black
BG_COLOR:               equ     0x09        ; Azul
WALL_COLOR:             equ     0x02        ; Verde
PLAYER_COLOR:           equ     0x2C        ; Amarillo
obstacles_msg: db "Obstaculos:", 0
