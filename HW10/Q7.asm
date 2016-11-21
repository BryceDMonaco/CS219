org 100h
section .text
start:
; put your code here
SCAN:	MOV CX, [0152] ;Load the length
		MOV BX, 0 ;Set offset to zero
		MOV AH, 0 ;Set high storage to zero
		MOV AL, 0 ;Set low storage to zero
		
		LOOP CHECKR
		
		MOV [0150], AL ;Store the smallest
		MOV [0151], AH ;Store the largest
		
CHECKR:	MOV Dl, [0160 + BX]; Load the value
		
		CMP AL, DL
		JG	NLOW ;There is a new min
		
		CMP AH, DL
		JL NHIGH ;There is a new max
		
		ADD BX, 1
		
NLOW:	MOV AL, DL ;Copy the new min in
		ADD BX, 1
		RET
		
NHIGH:	MOV AH, DL ;Copy the new max
		ADD BX, 1
		RET

iloop:	LOOP iloop
section .data
; put data items here
;
; variables:


section .bss
; put uninitialized data here
;
