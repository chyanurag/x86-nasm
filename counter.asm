%include 'functions.asm'

section .data
    n db 69

section .text
global _start
_start:
    mov ecx, 0

nextNumber:
    inc ecx
    mov eax, ecx
    call iprintln
    cmp ecx, [n]
    jnz nextNumber

finished:
    call quit
