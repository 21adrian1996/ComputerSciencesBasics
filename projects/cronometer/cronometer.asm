; Source name 	  : cronometer.asm
; Executable name : cronometer
; Version	  : 1.0
; Created date	  : 2018-02-01 13:01:53
; Last update	  : 2018-02-01 13:01:53
; Author:	  : adrianberger
; Description	  : 

section .data			; declaring initialized data or constants

section .bss			; declaring variables here

section .text			; actual code section
	global _start 		; must be declared for linker

_start:				;tells linker entry point
	mov ax, 000010111011111011b
	call addSecond
	mov eax, 04
	call addSecond 
	jmp endScript	

addSecond:
	push r8			; seconds
	push r9			; minutes
	push r10		; hours
	
	mov r8, rax
	mov r9, rax
	mov r10, rax
 
	and r8, 63
	shr r9, 6
	and r9, 63
	shr r10, 12
	and r10, 31

; add second
	inc r8
	cmp r8, 60
	jb .done

; add minute
	mov r8, 0
	inc r9
	cmp r9, 60
	jb .done

; add hour
	mov r9, 0
	inc r10
	cmp r10, 24
	jb .done

; set chronometer to zero
	mov r10, 0

.done:
	shl r9, 6
	shl r10, 12
	xor rax, rax
	or rax, r8
	or rax, r9
	or rax, r10
	
	pop r10
	pop r9
	pop r8
ret

endScript:
	mov rax,1 		; code for exit syscall
	mov rbx,0 		; return a code of zero
	int 80H	  		; make kernel call
	
