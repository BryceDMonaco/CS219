org 100h
section .text
start:
; put your code here
FIND8: 	MOV CX, [0150] ;Load the length
		MOV BX, 0 ;Set offset to zero
		MOV AH, 0 ;Set AX to zero
		
		LOOP CHECKR
		
		MOV AH, [0152] ;Store highest in 152h
		
CHECKR:	MOV AL, [0154 + BX] ;Load the value
		
		CMP AH, AL
		JE NEXT ;No change
		JL NEW ;The new value is greatest
		JG NEXT ;No change
		
NEXT	ADD BX, 1 ;Increment BX
		RET
		
NEW		MOV AH, AL ;Overwrite AH with the new value
		ADD BX, 1 ;Increment BX
		


iloop:	LOOP iloop
section .data
; put data items here
;
; variables:


section .bss
; put uninitialized data here
;
