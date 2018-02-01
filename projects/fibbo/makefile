all: fibbo

clean:
	rm *.o *.lst

fibbo: fibbo.o
	ld -o fibbo fibbo.o

fibbo.o: fibbo.asm
	nasm -f elf64 -g -F dwarf fibbo.asm -l fibbo.lst
