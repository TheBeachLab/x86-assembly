; x86 assembly language program for x86 processors
; prints out strings with arbitrary lengths

section .data
	text 	db "hello world",10,0	; 10 is newline
	text2	db "this is me",10,0

section .text				; your code (not related to above text)
	global 	_start			; link the start of the program

_start:					; mandatory start label
	mov 	rax, text		; load the text into rax
	call 	_print			; call print subroutine

	mov 	rax, text2
	call	_print

	;sys_exit(0)
	mov 	rax, 60			; sys_exit
	mov 	rdi, 0			; error code
	syscall

; input rax as pointer to string
; output print a string at rax
_print:
	push	rax			; push the text to the stack for later
	mov 	rbx, 0			; init the string char counter

_printLoop:
	inc 	rax			; get the next character of the string
	inc 	rbx			; increase the char count
	mov	cl, [rax]		; load the character to cl, the 8bit end of rcx
	cmp 	cl, 0			; check if it reached 0 (last char)
	jne	_printLoop		; if not keep going

	; sys_write(1,rax,rbx)
	mov	rax, 1			; sys_write
	mov	rdi, 1			; std_output
	pop	rsi			; get the text back from the stack to the buffer
	mov	rdx, rbx		; load the length of the string into rdx argument
	syscall

	ret
