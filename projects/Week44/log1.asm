;  filename: log1.asm
;  Version         : 1.0
;  Created date    : 4/4/2009
;  Last update     : 4/4/2009
;  Author          : E. Benoist
;  Description     : A simple program in assembly for Linux, using NASM 2.05,
;    demonstrating the conversion of binary values to hexadecimal strings.
;    It acts as a very simple hex dump utility for files, though without the
;    ASCII equivalent column.

; Write an assembler file, where you put 20h in the RAX.
; Then you divide this number each time by two.
; Each time you increase the counter RCX (originally initialized to 0).
; Loop until RAX contains zero.
; RCX should contain the logarithm of the value in RAX at the beginning.

;
SECTION .bss			; Section containing uninitialized data
	
SECTION .data			; Section containing initialised data

SECTION .text			; Section containing code

global 	_start			; Linker needs this to find the entry point!
	
_start:
	nop			; This no-op keeps gdb happy...
	mov rax, 128		; We initialize RAX with the value we want to study
	mov rcx, 0 		; At the begining the logarithm is 0

shiftLoop:
	inc rcx			; increase rbx by one
	shr rax,1		; devide RAX by 2
	jnz shiftLoop		; as long as RAX is not 0, we go on

	sub rcx, 1		; Log is length - 1
	nop	                ; A place to look at the result in rcx
                                ; I leave this in order to provide a clean exit
	mov eax,1		; Code for Exit Syscall
	mov ebx,0		; Return a code of zero	
	int 80H			; Make kernel call
