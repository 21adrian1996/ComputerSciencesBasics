all: cronometer

clean:
	rm *.o *.lst

cronometer: cronometer.o
	ld -o cronometer cronometer.o

cronometer.o: cronometer.asm
	nasm -f elf64 -g -F dwarf cronometer.asm -l cronometer.lst
