all: maths

clean:
	rm *.o *.lst

maths: maths.o
	ld -o maths maths.o

maths.o: maths.asm
	nasm -f elf64 -g -F dwarf maths.asm -l maths.lst
