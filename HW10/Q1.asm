org 100h
section .text
start:
; put your code here
SUB64: 	MOV AX, [0150] ;Load the value at 0150h into AX
		SUB AX, [0160] ;Sub the value at 0160h from this
		MOV [0170], AX ;Store at 0170h
		
		MOV AX, [0154] ;Do th same with the second half
		SUB AX, [0164]
		MOV [0174], AX
		
iloop:	LOOP iloop
section .data
; put data items here
;
; variables:


section .bss
; put uninitialized data here
;
