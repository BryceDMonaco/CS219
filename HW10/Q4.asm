org 100h
section .text
start:
; put your code here
LSHIFT:	MOV AX, [0150] ;Load the value
		MOV CX, [0154] ;Load the shift count
		
		LOOP OFFSET
		
		MOV [0158], AX
		
OFFSET:	SHL AX, 1
		RET

iloop:	LOOP iloop
section .data
; put data items here
;
; variables:


section .bss
; put uninitialized data here
;
