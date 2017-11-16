; Source name 	  : recursiveSum.asm
; Executable name : recursiveSum
; Version	  : 1.0
; Created date	  : 2017-11-07 18:53:08
; Last update	  : 2017-11-07 18:53:08
; Author:	  : adrian
; Description	  : 

section .data			; declaring initialized data or constants

section .bss			; declaring variables here

section .text			; actual code section
	global _start 		; must be declared for linker

;IN ax = n
;OUT dx = the sum(n)
recSum:
	push rax
	xor dx,dx
	cmp ax, 0
	je done
	call doSum
ret
doSum:
	cmp ax, 0
	je done
	add dx,ax
	dec ax
	call doSum
done:
	pop rax
ret

_start:				;tells linker entry point
	mov ax,5 
	call recSum
	jmp endScript

endScript:
	mov rax,1 		; code for exit syscall
	mov rbx,0 		; return a code of zero
	int 80H	  		; make kernel call
	
