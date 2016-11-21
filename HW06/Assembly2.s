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

	LDR r4, =127			;Load the first operand, 127 (dec)
	LDR r5, =0xe45ad		;Load the second operand, 0xE45AD (hex)
	LDR r6, =2_10101110010	;Load the third operand, 10101110010 (bin)
	
	ADD r2, r4, r5			;Add the first two values, 127 and 0xE45AD, store the sum in r2
	
	ADD r2, r2, r6			;Add the sum from the previous operation to 10101110010 and store in r2
							;The final sum is stored in r2

;************************************************************************
;
; an infinite loop because the processor continues to fetch instructions
stop	BAL	stop
	END			;END directive to show nothing more in file
	
	