; Source name 	  : binominals.asm
; Executable name : binominals
; Version	  : 1.0
; Created date	  : 2017-11-07 19:23:17
; Last update	  : 2017-11-07 19:23:17
; Author:	  : adrian
; Description	  : 

section .data			; declaring initialized data or constants

section .bss			; declaring variables here

section .text			; actual code section
	global _start 		; must be declared for linker

;IN bx = n
;OUT dx = n!
recFac:
        push rax
	push rbx
	mov ax, 1
        cmp bx, 0
        je doneFac
        call doFac
ret
doFac:
        cmp bx, 0
        je doneFac
        mul bx
        dec bx
        call doFac
ret
doneFac:
	mov dx,ax
	pop rbx
	pop rax
ret

; IN ax = n
; IN bx = k
; OUT dx = (n über k) 
doBinominal:
	push rcx 		; store rcx in stack
	push rax		; store rax in stack
	call recFac 		; get k! in dx
	mov cx, dx		; store k! to cx
	sub ax, bx		; store n-k into ax
	mov bx, ax		; store n-k to bx, cause this is the input for recFac
	call recFac		; get (n-k)! into dx 	
	mov ax, dx		; store (n-k)! into ax
	xor dx, dx		; clear dx for next multiplication
	mul cx			; calc (n-k)! * k!
	mov cx, ax		; store (n-k)! * k! in cx
	pop rax			; get n in ax
	mov bx, ax		; mov n into bx
	call recFac		; get n! into dx
	mov ax, dx		; get n! into ax
	div cx			; get n!/(k!*(n-k)!) into ax
	pop rcx			; restore rcx
	
ret

_start:                         ;tells linker entry point
        mov ax, 4
	mov bx, 3
        call doBinominal
        jmp endScript

endScript:
	mov rax,1 		; code for exit syscall
	mov rbx,0 		; return a code of zero
	int 80H	  		; make kernel call
	
