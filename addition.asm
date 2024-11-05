%include 'functions.asm'
section .text
global _start
_start:
    mov eax, 63
    mov ebx, 6
    add eax, ebx
    call iprintln
    call quit
