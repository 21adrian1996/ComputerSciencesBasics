; Source name 	  : maths.asm
; Executable name : maths
; Version	  : 1.0
; Created date	  : 2017-10-30
; Last update	  : 2017-10-30
; Author:	  : adrian

section .data			; declaring initialized data or constants

section .bss			; declaring variables here

section .text			; actual code section
	global _start 		; must be declared for linker

_start:				;tells linker entry point
	GLOBAL calcSumOneToN, calcFact


; descripiton: calculate the 
; 	sum of an n numbers
;	n+(n-1)+...+1
; input: ah n
; ouput: ah the factorial
calcSumOneToN:
	push rbx
	push rax
	xor al,al 		; al=0 al=sum
.next:  add al,ah 		; sum
	dec ah	  		; n = n + 1
	jnz .next 		; util ah==0
	pop rbx
	mov ah,bh
	pop rbx
	ret


; descripiton: calculate the 
; 	factorial of an number n!
; input: bx numer to factorizie
; ouput: ax the factorial
calcFact:
	push rcx
	push rax
	push rdx
	push rbx
	xor ax,ax 		; acx = 0
	xor dx,dx 		; dx = 0
	mov ax,1  		; 1 is my netral multiplikator
.next   mul bx	  		; stored to ax register
	dec bx 
	jnz .next
	mov cx, ax
	pop rbx
	pop rdx
	pop rax
	mov ax, cx
	pop rcx
	ret
