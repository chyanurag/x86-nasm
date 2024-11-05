%include 'functions.asm'

section .data
    msg1 db 'This is the first message', 0xA, 0x0
    msg2 db 'This is the second message', 0xA, 0x0

section .text
global _start
_start:
    mov eax, msg1
    call sprint

    mov eax, msg2
    call sprint

    call quit
