SECTION .text                                           
	extern printf
	extern exit
	global main
	global msg
                                                                ;Länge:
main:                                                   
	push ebp                                                ; 2 Byte
	mov ebp, esp                                            ; 3 Byte       
	sub esp, 4                                              ; 6 Bytes

	mov ebx, 0x39                                           ; 6 Bytes       
	mov dword [ebp-4], 0x30                                 ; 11 Bytes

schleife:
	cmp ebx, dword [ebp-4]                                  ; 7 Bytes
	je ende                                                 ; 2 bytes

	mov byte [msg+msg_len-4], bl                            ; 8 Bytes

	push dword msg                                          ; 2 Bytes
	call printf                                             ; 2 Bytes
	add esp, 4                                              ; 6 Bytes

	dec ebx                                                 ; 2 Bytes
	jmp schleife                                            ; 2 Bytes

ende:
	add esp, 4                                              ; 6 Bytes
	pop ebp                                                 ; 2 Bytes

	push dword 0                                            ; 6 Bytes
	call exit                                               ; 2 bytes        
	add esp, 4                                              ; 6 Bytes
                
	mov eax, 1                                              ; 6 Bytes
	mov ebx, 0                                              ; 6 Bytes
	int 0x80                                                ; 5 Bytes

SECTION .data
	CR equ 13                                               
	LF equ 10
	msg db "Hello World! ebx = ?", CR, LF, 0
	msg_len equ $ - msg
