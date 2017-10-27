all: template

clean:
	rm *.o *.lst

template: template.o
	ld -o template template.o

template.o: template.asm
	nasm -f elf64 -g -F dwarf template.asm -l template.lst
