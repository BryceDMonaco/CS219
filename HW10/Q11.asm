org 100h
section .text
start:
; put your code here
; BX has the address of the string
REPLACE:	MOV AX, [BX] ;Load the value at the PTR
			CMP AX, 0 ;Check if null char
			JE ENDSTR
			
			CMP AX, '0' ;Check if leading zero
			JE SPACE
			JNE NEXT
			
SPACE:		MOV dword [BX], 100 ;Replace the zero with a space
			ADD BX, 1 ;Increment pointer
			JMP REPLACE
			
NEXT:		ADD BX, 1 ;Increment pointer
			JMP REPLACE

ENDSTR:		;Processing is complete

iloop:	LOOP iloop
section .data
; put data items here
;
; variables:


section .bss
; put uninitialized data here
;
