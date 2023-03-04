reboot: ; Long jump to BIOS reset vector, triggers a BIOS reboot
  db 0x0ea 
  dw 0x0000 
  dw 0xffff 
