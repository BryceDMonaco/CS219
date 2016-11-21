org 100h
section .text
start:
; put your code here
ONES: 	MOV AX, [0154] ;Load the value
		MOV BX, 2 ;Load operand
		MOV CX, 32 ;32 bits
		MOV SI, 0 ;Set count to 0
		
		LOOP CHECKR
		
		MOV [0150], SI ;Store the final count
		
CHECKR:	DIV BX ;Stores AX % BX in DX
		
		CMP DX, 1
		JE	FOUND
		JNE NEXT
		
FOUND:	ADD SI, 1
		RET
		
NEXT:	RET

iloop:	LOOP iloop
section .data
; put data items here
;
; variables:


section .bss
; put uninitialized data here
;
