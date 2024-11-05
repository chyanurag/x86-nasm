%include 'functions.asm'

section .text
global _start
_start:
    pop ecx

loop:
    cmp ecx, 0
    jz finished
    pop eax
    call sprintln
    dec ecx
    jmp loop

finished:
    call quit
