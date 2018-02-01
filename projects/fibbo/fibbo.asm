; Source name 	  : fibbo.asm
; Executable name : fibbo
; Version	  : 1.0
; Created date	  : 2018-02-01 10:55:38
; Last update	  : 2018-02-01 10:55:38
; Author:	  : adrianberger
; Description	  : 

section .data			; declaring initialized data or constants

section .bss			; declaring variables here

section .text			; actual code section
	global _start 		; must be declared for linker

_start:				; tells the linker the entry point
	mov eax, 10	 	; eax is the limit
	jmp fibo
; IN: eax: which fibbo number should be found
; OUT: ebx: the fibbo number
fibo:
	push rax
	push rcx
	mov ebx, 0		; first fibo number
	mov ecx, 1		; second fibo number		
	jmp doRec 
; IN: ebx: current fibo, ecx: last fibo
; OUT: ebx: next fibo, ecx: current fibo
doRec:
	cmp eax, 0		; if counter is 0
	je endFibo		; we have reached our fibo number
	push rbx		; store last fibo
	add ebx, ecx		; calculate next fibo
	pop rcx			; store last fibo in rcx
	dec eax			; decrement the counter
        jmp doRec
endFibo:
	pop rcx
	pop rax
	jmp endScript

endScript:
	mov rax,1 		; code for exit syscall
	mov rbx,0 		; return a code of zero
	int 80H	  		; make kernel call
	
