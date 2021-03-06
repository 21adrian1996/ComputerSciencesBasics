;  Executable name : log4.asm
;  Version         : 1.0
;  Created date    : 20/10/2014
;  Last update     : 20/10/2014
;  Author          : Emmanuel Benoist
;  Description     : Reads the input from the standard input, it is a number
;                    of any number of digits,
;                    Computes the logarithm in basis 2
;                    and displays it
;  Run it this way:
;    ./log4 
;    123423
;	
;  Build using these commands:
;    nasm -f elf64 -g -F dwarf log4.asm
;    ld -o log4 log4.o
;
SECTION .bss			; Section containing uninitialized data
	BUFFLEN	equ 25		; We read 25 bytes from the stdin (larger than the bigest number on 64 bits)
	Buff: 	resb BUFFLEN	; Text buffer itself
	
SECTION .data			; Section containing initialised data

StringOut:	db "  ",10	; The variable will contain the string that will be returned
STRINGOUTLEN:	equ $-StringOut	; The length of StringOut
			
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
	sub ebp,1		; We are not interested in the last char, which is \n
	
	cmp eax,0		; If eax=0, sys_read reached EOF on stdin
	je Done			; Jump If Equal (to 0, from compare)
	
		
; Set up the registers for the process buffer step:
	mov rsi,Buff		; Place address of file buffer into esi
	xor ecx,ecx		; Clear line string pointer to 0
	
	; We will place the value read in the register RDX
	; Then we will compute its logarithem
	mov rax,0		; Erase the value in RAX
	
; Go through the buffer and compute the value in RAX
	mov R8,0		; R8 is a counter visiting the buffer
	mov r9,10		; We need to store the multiplicator for the multiplication

Scan:
	mov cl, Byte[rsi+r8]	; Read one character
	sub rcx, 30h		; Convert the character into its integer value
	mul r9			; multiply the RAX by 10 : Result is in RDX:RAX
	add rax, rcx		; add the new cypher to the number
	inc r8			; go to the next value
	cmp r8, rbp	        ; Test if the counter is larger than EBP (contains the number of bytes in buffer)
	jne Scan                ; Loop until r8 == ebp
; All done! Let's end this party:

Logarithm:
	mov rbx, 0 		; At the begining the logarithm is 0

shiftLoop:
	inc rbx			; increase rbx by one
	shr rax,1		; Devide RAX by 2
	jnz shiftLoop		; as long as RAX is not 0, we go on
	dec rbx			; Because log is one less than length
	
	; RBX contains the result
	mov RAX, RBX
	div R9			; Devide RAX by 10, the rest is put in RDX
	
	; We know that the result can not be larger than 2 digits
	; So one digit is in RAX and one is in RDX
	add RAX, 30h		; Transform the integer in RAX into a character
	add RDX, 30h		; Transform the integer in RDX into a character
	mov [StringOut], al 	; We move only one byte 
	mov [StringOut+1], dl	; We move only one byte
	
Done:
	; Write the line of decimal values on stdout
	mov eax,4		; Specify sys_write call
	mov ebx,1		; Specify File Descriptor 1: Standard output
	mov ecx,StringOut	; Pass offset of line string
	mov edx,STRINGOUTLEN	; Pass size of the line string
	int 80h			; Make kernel call to display line string

	; Exit of the program
	nop			; To see the result in RBX
	mov eax,1		; Code for Exit Syscall
	mov ebx,0		; Return a code of zero	
	int 80H			; Make kernel call
