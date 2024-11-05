%include 'functions.asm'
section .text
global _start
_start:
    pop ecx
    pop edx
    sub ecx, 1
    mov edx, 0

addLoop:
    pop eax
    call atoi
    add edx, eax
    dec ecx
    cmp ecx, 0
    jnz addLoop

noMoreArgs:
    mov eax, edx
    call iprintln
    call quit
