all: {SCRIPTNAME}

clean:
	rm *.o *.lst

{SCRIPTNAME}: {SCRIPTNAME}.o
	ld -o {SCRIPTNAME} {SCRIPTNAME}.o

{SCRIPTNAME}.o: {SCRIPTNAME}.asm
	nasm -f elf64 -g -F dwarf {SCRIPTNAME}.asm -l {SCRIPTNAME}.lst
