; my first x86 assembly language program for x86 processors

section .data
	text db "hello world",10	; 10 is newline

section .text				; your code (not related to above text)
	global _start			; link the start of the program

%macro	exit 0
	mov 	rax, 60			; sys_exit
	mov 	rdi, 0			; error code
	syscall
%endmacro

%macro countdown 0
mov rbx, 10				; load 10 in rbx
%%loop:					; %% labels can be expanded multiple times
	dec 	rbx			; decrement rbx
	jne 	%%loop			; if not zero keep looping
%endmacro

_start:					; mandatory start label
	countdown			; first expand
	;sys_write(1,text,12)
	mov 	rax, 1			; sys_write
	mov 	rdi, 1			; std output
	mov 	rsi, text		; memory address of the buffer
	mov 	rdx, 12			; length of the string, including newline
	syscall				; call the kernel
	countdown			; second expand

	exit				; expand exit macro
