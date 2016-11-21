org 100h
section .text
start:
; put your code here
FIND32:	MOV CX, [0150] ;Load the length
		MOV BX, 0 ;Set offset to zero
		MOV AH, 0 ;Set AX to zero
		
		LOOP CHECKR
		
		MOV [0154], AX ;Store highest in 154h
		
CHECKR:	MOV DX, [0160 + BX] ;Load the value
		
		CMP AX, DX
		JE NEXT ;No change
		JL NEW ;The new value is greatest
		JG NEXT ;No change
		
NEXT	ADD BX, 1 ;Increment BX
		RET
		
NEW		MOV AX, DX ;Overwrite AH with the new value
		ADD BX, 1 ;Increment BX
		


iloop:	LOOP iloop
section .data
; put data items here
;
; variables:


section .bss
; put uninitialized data here
;
