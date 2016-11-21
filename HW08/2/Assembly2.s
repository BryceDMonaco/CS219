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
COMBINE	LDR r1,= 0x40001000
		LDR r2,= 0x40001001
		LDR r3,= 0x40001002
		LDR r4,= 0x40001003
	
		LDRB r1, [r1] ;Load the lower order of the words at each address
		LDRB r2, [r2]
		LDRB r3, [r3]
		LDRB r4, [r4]
	
		ADD r5, r1, r2 ;Combine the first two
		ADD r5, r3, r4 ;Combine the second two
		
		LDR r6,= 0x40001004
	
		STR r5, [r6] ;Store the full word at the address


;************************************************************************
;
; an infinite loop because the processor continues to fetch instructions
stop	BAL	stop
	END			;END directive to show nothing more in file
	
	