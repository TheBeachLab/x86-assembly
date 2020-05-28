; my input x86 assembly language program for x86 processors

section .data
	text1	db "what is your name? "
	text2	db "hello, "

section .bss				; reserve memory space
	name	resb 16 		; reserve 16 bytes for name


section .text				; your code (not related to above text)
	global _start			; link the start of the program

_start:					; mandatory start label

	call 	_printText1
	call	_getName
	call	_printText2
	call	_printName

	;sys_exit(0)
	mov 	rax, 60			; sys_exit
	mov 	rdi, 0			; error code
	syscall

_printText1:
	;sys_write(1,text1,19)
	mov 	rax, 1			; sys_write
	mov 	rdi, 1			; std output
	mov 	rsi, text1		; memory address of the buffer
	mov 	rdx, 19			; length of the string, including newline
	syscall				; call the kernel
	ret

_getName:
	;sys_input(0,name.16)
	mov	rax, 0			; sys_input
	mov 	rdi, 0			; std_input
	mov 	rsi, name		; memory address
	mov 	rdx, 16			; length
	syscall
	ret

_printText2:
	;sys_write(1,text2,7)
	mov 	rax, 1			; sys_write
	mov 	rdi, 1			; std output
	mov 	rsi, text2		; memory address of the buffer
	mov 	rdx, 9			; length of the string, including newline
	syscall				; call the kernel
	ret

_printName:
	;sys_write(1,name,16)
	mov 	rax, 1			; sys_write
	mov 	rdi, 1			; std output
	mov 	rsi, name		; memory address of the buffer
	mov 	rdx, 16			; length of the string, including newline
	syscall				; call the kernel
	ret
