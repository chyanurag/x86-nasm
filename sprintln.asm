%include 'functions.asm'

section .data
    msg db 'Hello,', 0x0
    msg2 db 'World', 0x0

section .text
global _start
_start:
    mov eax, msg
    call sprintln
    mov eax, msg2
    call sprintln
    call quit
