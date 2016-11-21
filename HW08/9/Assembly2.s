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
		
		LDR r1,= 0x40001004 ;Load the value address
		LDRB r1, [r1] ;Load the value at the address
		
		LDR r7,= 0 ;Set the count to 0
		LDR r8,= 0 ;Set the bit tracker to 0
		
CHECK	LDR r2, [r1] ;Set r2 equal to r1
		LDR r3, [r1] ;Set r3 equal to r1
		
		SUB r3, r3, #1 ;Subtract 1 from r3
		SUB r4, r2, r3 ;Do r2 - r3, will either be 0 - 1 or 1 - 0 at the 0th bit
		
		CMP r4, #0
		BGT ONES ;r2 - r3 had a difference of +1, meaning that r2 has a 1 in the right bit.
		BLT ZERO ;There is a 0 in the left bit
		
ONES	ADD r7, r7, #1 ;Add one to the count
		LSR r1, #1 ;Shift r1 to the right so that a new bit is at the right bit
		BAL CHECK2
		
ZERO	LSR r1, #1 ;Shift r1 to the right
		BAL CHECK2
		
CHECK2	ADD r8, r8, #1 ;Add one to the bit tracker
		
		CMP r8, #31 ;Make sure we aren't out of bounds
		BEQ STORE ;If we've checked the last bit go to STORE
		BNE CHECK ;Else continue the loop

STORE	LDR r1,= 0x40001000 ;Load the count address
		STRB r7, [r1] ;Store the count

		

;************************************************************************
;
; an infinite loop because the processor continues to fetch instructions
stop	BAL	stop
	END			;END directive to show nothing more in file
	
	