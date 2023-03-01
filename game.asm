hello_world:
  mov si, debug_msg
  mov ah, 0x0e
  call print_loop

print_loop:
  lodsb
  or al, al
  jz done
  int 0x10
  jmp print_loop
done:
  jmp done

debug_msg: db "Hello world!", 0
