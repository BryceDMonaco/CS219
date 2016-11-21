org 100h
section .text
start:
; put your code here
COMBINE:	MOV CX, 4 ;Set offset to 4
			MOV AL, 0 ;Set AL to 0
			MOV BX, 0 ;Load the base address (loop adds 1-4)
			
			LOOP ACTION
			
ACTION:		MOV DX, [150 + BX] ;Load the value into DX
			ADD AX, DX ;COMBINE
			ADD BX, 1 ;Increment BX
			RET



iloop:	LOOP iloop
section .data
; put data items here
;
; variables:


section .bss
; put uninitialized data here
;
