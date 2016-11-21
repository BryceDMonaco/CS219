org 100h
section .text
start:
; put your code here
FIND: 	MOV AH, [0150]
		MOV AL, [0151]
		
		CMP AL, AH ;Compare the values
		JE EQUAL ;If equal
		JG FIRST ;If AL > AH
		JL SECON ;If AL < AH
		
EQUAL:	MOV [0152], AL ;Store one in the address

FIRST:	MOV [0152], AL ;Store the higher into the address

SECON:	MOV [0152], AH ;Store the higher into the address

iloop:	LOOP iloop
section .data
; put data items here
;
; variables:


section .bss
; put uninitialized data here
;
