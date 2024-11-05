section .data
    msg db 'Hello!', 0xA

section .text
global _start

strlen:
    push ebx
    mov ebx, eax

nextchar:
    cmp byte [eax], 0
    je finished
    inc eax
    jmp nextchar
    
finished:
    sub eax, ebx
    pop ebx
    ret

sprint:
    push ecx
    push ebx
    push edx
    mov ecx, eax
    call strlen
    mov edx, eax
    mov eax, 4
    mov ebx, 1
    int 0x80

    pop edx
    pop ebx
    pop ecx
    ret

_start:
    mov eax, msg
    call sprint
exit:
    mov eax, 1
    mov ebx, 0
    int 0x80
