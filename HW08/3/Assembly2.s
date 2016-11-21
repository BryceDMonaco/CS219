;Simple Keil tools demonstration program
;Modified from J.R. Gibson (7/14/07)
;Modified by D. Egbert ver. 2.0 1/28/10
;
	AREA	Assembly1, CODE, READONLY
	EXPORT	__main
__main	
	ENTRY
mystart	LDR r3,= 0x40001000	;point to RAM location
;
;************************************************************************
; For other programs (projects) replace the code below with new code.
; Leave the code outside the ******* lines as is for all programs.
; begin initialize data

FIND 	LDR r1,= 0x40001000 ;Load the first address
		LDR r2,= 0x40001001 ;Load the second address
		
		LDRB r1, [r1] ;Load the value stored at the first address
		LDRB r2, [r2] ;Load the value stored the the second address
		
		CMP r1, r2 ;Compare the values
		BEQ EQUAL ;If equal go to EQUAL
		BGT FIRST ;If r1 > r2 go to FIRST
		BLT LAST ;If r2 > r1 go to LAST
		
EQUAL	BAL stop ;If equal end the program

FIRST	LDR r3,= 0x40001002 ;Load the address
		STRB r1, [r3] ;Store the value in r1 into the address at r3
		
LAST	LDR r3,= 0x40001002 ;Load the address
		STRB r2, [r3] ;Store the value in r2 into the address at r3		
		

;************************************************************************
;
; an infinite loop because the processor continues to fetch instructions
stop	BAL	stop
	END			;END directive to show nothing more in file
	
	