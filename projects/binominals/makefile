all: binominals

clean:
	rm *.o *.lst

binominals: binominals.o
	ld -o binominals binominals.o

binominals.o: binominals.asm
	nasm -f elf64 -g -F dwarf binominals.asm -l binominals.lst
