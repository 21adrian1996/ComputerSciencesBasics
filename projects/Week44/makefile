# Compiles all examples at once
all: log1 log2 log3 log4 fib

# Removes all object files, and temporary editor files 
clean:
	rm *.o *~ 

log1: log1.o
	ld -o log1 log1.o
log1.o: log1.asm
	nasm -f elf64 -g -F dwarf log1.asm

log2: log2.o
	ld -o log2 log2.o
log2.o: log2.asm
	nasm -f elf64 -g -F dwarf log2.asm
 
log3: log3.o
	ld -o log3 log3.o
log3.o: log3.asm
	nasm -f elf64 -g -F dwarf log3.asm

log4: log4.o
	ld -o log4 log4.o
log4.o: log4.asm
	nasm -f elf64 -g -F dwarf log4.asm
	
fib: fib.o
	ld -o fib fib.o
fib.o: fib.asm
	nasm -f elf64 -g -F dwarf fib.asm -l fib.lst
