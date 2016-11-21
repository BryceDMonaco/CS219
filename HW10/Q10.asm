org 100h
section .text
start:
; put your code here
;BX has the address

STRLEN:	MOV CX, 0 ;Set count to 0
		
		JMP COUNTR
		
COUNTR:	MOV DX, [BX] ;Load the value at BX
		
		CMP DX, 0
		JE ENDSTR
		JNE NEXT
		
NEXT:	ADD CX, 1 ;Increment count
		ADD BX, 1 ;Increment pointer
		JMP COUNTR
		
ENDSTR:	;String is done, size is in CX

iloop:	LOOP iloop
section .data
; put data items here
;
; variables:


section .bss
; put uninitialized data here
;
