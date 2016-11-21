org 100h
section .text
start:
; put your code here
COUNT:	MOV AH, 0 ;Set the count to 0
		MOV AL, [0150] ;Load key
		MOV BX, 0 ;Set offset to 0
		
		JMP CHECKR
		
CHECKR:	MOV DL, [0160 + BX]
		
		CMP DL, 0
		JE ENDSTR
		
		CMP DL, AL
		JE FOUND
		JNE NEXT
		
FOUND:	ADD AH, 1 ;Inc. count
		ADD BX, 1 ;Inc. offset
		JMP CHECKR
		
NEXT:	ADD BX, 1 ;Inc. offset
		JMP CHECKR
		
ENDSTR:	MOV [0154], AH ;Store the count

iloop:	LOOP iloop
section .data
; put data items here
;
; variables:


section .bss
; put uninitialized data here
;
