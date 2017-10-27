section .data
	highest dd 10
section .text
	global _start

_start:
	mov eax,0
sumUp:
	cmp eax,[highest]
	ja endSum
	add ebx,eax
	inc eax
	jmp sumUp

endSum:
	mov eax,1
	mov ebx,0
	int 80H
	
