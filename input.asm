%include 'functions.asm'
section .bss
    sinput resb 255
section .data
    inputLen db 255
    inputMsg db 'Enter your name : ', 0x0
    welcomeMsg db 'Hello ', 0x0
section .text
global _start
_start:
    mov eax, inputMsg
    call sprint

    mov eax, 3
    mov ebx, 0
    mov ecx, sinput
    mov edx, [inputLen]
    int 0x80

    mov eax, welcomeMsg
    call sprint
    mov eax, sinput
    call sprint
    call quit
