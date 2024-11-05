%include 'functions.asm'
section .data
    filename db 'file.txt', 0
    contents db 'Hello, file!', 0xA, 0

section .bss
    fileContent resb 255

section .text
global _start
_start:
    mov ecx, 0777o
    mov ebx, filename
    mov eax, 8
    int 0x80

    mov edx, 14
    mov ecx, contents
    mov ebx, eax
    mov eax, 4
    int 0x80

    mov ecx, 0
    mov ebx, filename
    mov eax, 5
    int 0x80

    mov edx, 255
    mov ecx, fileContent
    mov ebx, eax
    mov eax, 3
    int 0x80
    
    mov eax, fileContent
    call sprint

    mov eax, 6
    int 0x80

    call quit
