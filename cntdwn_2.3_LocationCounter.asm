                                                                ;                                Location Counter (hexadezimal):
SECTION .text                                                   ;                                 0000
	extern printf                                           ;                                 0004      
	extern exit                                             ;                                 0008
	global main                                             ;                                 000C      
	global msg                                              ;                                 0010
	                                                        ;                                 0014
	                                      
                                                                ;Länge:                         Location Counter (hexadezimal):
main:                                                                                            0000
	push ebp                                                ; 2 Byte                         0000
	mov ebp, esp                                            ; 3 Byte                         0002       
	sub esp, 4                                              ; 6 Bytes                        0005

	mov ebx, 0x39                                           ; 6 Bytes                        000B 
	mov dword [ebp-4], 0x30                                 ; 11 Bytes                       0011

schleife:                                                                                        001D
	cmp ebx, dword [ebp-4]                                  ; 7 Bytes                        001D
	je ende                                                 ; 2 bytes                        0024

	mov byte [msg+msg_len-4], bl                            ; 8 Bytes                        0026

	push dword msg                                          ; 2 Bytes                        002E
	call printf                                             ; 2 Bytes                        0030
	add esp, 4                                              ; 6 Bytes                        0032

	dec ebx                                                 ; 2 Bytes                        0038
	jmp schleife                                            ; 2 Bytes                        003A

ende:                                                                                            003C
	add esp, 4                                              ; 6 Bytes                        003C
	pop ebp                                                 ; 2 Bytes                        0042       

	push dword 0                                            ; 6 Bytes                        0044
	call exit                                               ; 2 bytes                        004A
	add esp, 4                                              ; 6 Bytes                        004C
                
	mov eax, 1                                              ; 6 Bytes                        0052
	mov ebx, 0                                              ; 6 Bytes                        0058
	int 0x80                                                ; 5 Bytes                        005E       
                                                                                                 0063
                                                                                                 
                                                                ;                                Location Counter (hexadezimal):        
SECTION .data                                                   ;                                 0000       
	CR equ 13                                               ;                                 0004
	LF equ 10                                               ;                                 0008
	msg db "Hello World! ebx = ?", CR, LF, 0                ;                                 000C       
	msg_len equ $ - msg                                     ;                                 0020                 
	                                                        ;                                 0024  
