section .data
    msg db 'hello, world', 0xA

section .text
global _start
_start:
    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, 13
    int 0x80

exit:
    mov eax, 1
    mov ebx, 0
    int 0x80
