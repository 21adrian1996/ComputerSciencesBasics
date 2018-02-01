;  Executable name : log2.asm
;  Version         : 1.0
;  Created date    : 20/10/2014
;  Last update     : 20/10/2014
;  Author          : Emmanuel Benoist
;  Description     : Reads the input from the standard input, it is a number
;                    Of 4 digits, it generates a number in a register and  
;                    Computes the logarithm in basis 2
;                    In the end the value is stored in RBX      
;
;  Run it this way:
;    ./log2 
;    1234
;	
;  Build using these commands:
;    nasm -f elf64 -g -F dwarf log2.asm
;    ld -o log2 log2.o
;
SECTION .bss			; Section containing uninitialized data

	BUFFLEN	equ 4		; We read the file 16 bytes at a time
	Buff: 	resb BUFFLEN	; Text buffer itself
	
SECTION .data			; Section containing initialised data
		
SECTION .text			; Section containing code

global 	_start			; Linker needs this to find the entry point!
	
_start:
	nop			; This no-op keeps gdb happy...

; Read a buffer full of text from stdin:
Read:
	mov eax,3		; Specify sys_read call
	mov ebx,0		; Specify File Descriptor 0: Standard Input
	mov ecx,Buff		; Pass offset of the buffer to read to
	mov edx,BUFFLEN		; Pass number of bytes to read at one pass
	int 80h			; Call sys_read to fill the buffer
	mov ebp,eax		; Save # of bytes read from file for later
	cmp eax,0		; If eax=0, sys_read reached EOF on stdin
	je Done			; Jump If Equal (to 0, from compare)
	
; Set up the registers for the process buffer step:
	mov rsi,Buff		; Place address of file buffer into esi
	xor ecx,ecx		; Clear line string pointer to 0
	
	; We will place the value read in the register RDX
	; Then we will compute its logarithem
	mov rax,0		; Errase the value in RAX
	
; Go through the buffer and convert binary values to hex digits:
	mov R8,0		; R8 is a counter visiting the buffer
	mov r9,10		; We need to store the multiplicator for the multiplication
Scan:
	mov cl, Byte[rsi+r8]	; Read one character
	sub rcx, 30h		; Convert the character into its integer value
	mul r9			; multiply the rax by 10
	add rax, rcx		; add the new cypher to the number
	inc r8			; go to the next value
	cmp r8, BUFFLEN	        ; Test if the counter is larger than BUFFLEN
	jne Scan		; Loop until
	
; All done! Let's end this party:

Logarithm:
	mov rbx, 0 		; At the begining the logarithm is 0

shiftLoop:
	inc rbx			; increase rbx by one
	shr rax,1		; Devide RAX by 2
	jnz shiftLoop		; as long as RAX is not 0, we go on

	sub rbx,1 		; Because log is 1 less than length

Done:
	nop			; To see the result in RBX
	mov eax,1		; Code for Exit Syscall
	mov ebx,0		; Return a code of zero	
	int 80H			; Make kernel call
