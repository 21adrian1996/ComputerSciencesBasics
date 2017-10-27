; Source name 	  : {SCRIPTNAME}.asm
; Executable name : {SCRIPTNAME}
; Version	  : 1.0
; Created date	  : {DATE}
; Last update	  : {DATE}
; Author:	  : {AUTHOR}
; Description	  : 

section .data			; declaring initialized data or constants

section .bss			; declaring variables here

section .text			; actual code section
	global _start 		; must be declared for linker

_start:				;tells linker entry point
	; your code 
	; goes here

endScript:
	mov rax,1 		; code for exit syscall
	mov rbx,0 		; return a code of zero
	int 80H	  		; make kernel call
	
