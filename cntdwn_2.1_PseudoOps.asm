SECTION .text                                           ;Pseudooperation .text
	extern printf                                   ;Pseudooperation extern
	extern exit                                     ;Pseudooperation extern
	global main                                     ;Pseudooperation global
	global msg                                      ;Pseudooperation global

main:                                                   ;Pseudooperation Funktionsname main
	push ebp
	mov ebp, esp
	sub esp, 4                                      ;Pseudooperation Literal 4

	mov ebx, 0x39                                   ;Pseudooperation Literal 0x39        
	mov dword [ebp-4], 0x30                         ;Pseudooperation Literale 4 und 0x30

schleife:                                               ;Pseudooperation Funktionsname schleife
	cmp ebx, dword [ebp-4]                          ;Pseudooperation Literal 4 
	je ende

	mov byte [msg+msg_len-4], bl                    ;Pseudooperation Literal 4

	push dword msg  
	call printf
	add esp, 4                                      ;Pseudooperation Literal 4       

	dec ebx
	jmp schleife

ende:                                                   ;Pseudooperation Funktionsname ende
	add esp, 4                                      ;Pseudooperation Literal 4
	pop ebp

	push dword 0                                    ;Pseudooperation Literal 0
	call exit
	add esp, 4                                      ;Pseudooperation Literal 4

	mov eax, 1                                      ;Pseudooperation Literal 1
	mov ebx, 0                                      ;Pseudooperation Literal 0
	int 0x80                                        ;Pseudooperation Literal 0x80

SECTION .data                                            ;Pseudooperation .data
	CR equ 13                                        ;Pseudooperation equ
	LF equ 10                                        ;Pseudooperation equ
	msg db "Hello World! ebx = ?", CR, LF, 0         ;Pseudooperation Variable db, Literal 0
	msg_len equ $ - msg                              ;Pseudooperation equ
