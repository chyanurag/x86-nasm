%include 'functions.asm'

section .text
global _start
_start:
    pop eax
    pop eax
    pop eax
    call atoi
    mov ebx, eax
    mov eax, 1

.multiply:
    mul ebx
    dec ebx
    cmp ebx, 0
    jnz .multiply

    call iprintln

    call quit
