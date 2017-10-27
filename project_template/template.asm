section .data

section .bss

section .text
	global _start

_start:
	

endScript:
	mov rax,1 ; Code for exit syscall
	mov rbx,0 ; Return a code of zero
	int 80H	  ; Make kernel call
	
