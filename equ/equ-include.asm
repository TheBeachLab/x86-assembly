; my first x86 assembly language program for x86 processors

%include "constants.inc"

section .data
	text db "hello world",10	; 10 is newline

section .text				; your code (not related to above text)
	global _start			; link the start of the program

_start:					; mandatory start label
	;sys_write(1,text,12)
	mov 	rax, syswr		; sys_write
	mov 	rdi, stdout		; std output
	mov 	rsi, text		; memory address of the buffer
	mov 	rdx, 12			; length of the string, including newline
	syscall				; call the kernel				
	;sys_exit(0)
	mov 	rax, sysex		; sys_exit
	mov 	rdi, 0			; error code
	syscall

