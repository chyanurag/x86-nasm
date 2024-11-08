%include 'functions.asm'
section .data
    request db 'GET / HTTP/1.1', 0xD, 0xA, 'Host: 139.162.39.66', 0xD, 0xA, 0xD, 0xA, 0x0

section .bss
    buffer resb 1

section .text
global _start
_start:

    mov eax, 0
    mov ebx, 0
    mov edi, 0

_socket:
    push byte 6
    push byte 1
    push byte 2
    mov ecx, esp
    mov ebx, 1
    mov eax, 102
    int 0x80

_connect:
    mov edi, eax
    push dword 0x4227a28b
    push word 0x5000
    push word 2
    mov ecx, esp
    push byte 16
    push ecx
    push edi
    mov ecx, esp
    mov ebx, 3
    mov eax, 102
    int 0x80

_write:
    mov edx, 43
    mov ecx, request
    mov ebx, edi
    mov eax, 4
    int 0x80

_read:
    mov edx, 1
    mov ecx, buffer
    mov ebx, edi
    mov eax, 3
    int 0x80

    cmp eax, 0
    jz _close

    mov eax, buffer
    call sprint
    jmp _read

_close:
    mov ebx, edi
    mov eax, 6
    int 0x80

_exit:
    call quit
