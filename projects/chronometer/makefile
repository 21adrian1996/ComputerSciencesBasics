all: chronometer

clean:
	rm *.o *.lst

chronometer: chronometer.o
	ld -o chronometer chronometer.o

chronometer.o: chronometer.asm
	nasm -f elf64 -g -F dwarf chronometer.asm -l chronometer.lst
