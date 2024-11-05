all: main.asm
	nasm -felf main.asm
	ld -m elf_i386 main.o -o main

clean:
	rm -f main.o 
	rm -f main
