all: recursiveSum

clean:
	rm *.o *.lst

recursiveSum: recursiveSum.o
	ld -o recursiveSum recursiveSum.o

recursiveSum.o: recursiveSum.asm
	nasm -f elf64 -g -F dwarf recursiveSum.asm -l recursiveSum.lst
