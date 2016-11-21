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

SUB64	LDR r4,= 0x40001000 ;Load the addresses into the registers
		LDR r5,= 0x40001004
		LDR r6,= 0x40001010
		LDR r7,= 0x40001014
		
		LDRB r1, [r4] ;Load the value at the address stored in r4
		LDRB r2, [r6] ;Load the value at the address stored in r6
		
		SUB r8, r1, r2 ;Subtract the greater half
		
		LDRB r1, [r5] ;Load the value at the address stored in r5
		LDRB r2, [r7] ;Load the value at the address stored in r7
		
		SUB r9, r1, r2 ;Subtract the lesser half
		
		LDR r4,= 0x40001020 ;Load the left half address
		LDR r5,= 0x40001024 ;Load the right half address
		
		STRB r8, [r4] ;Store the differences at the respective addresses
		STRB r9, [r5]
		

;************************************************************************
;
; an infinite loop because the processor continues to fetch instructions
stop	BAL	stop
	END			;END directive to show nothing more in file
	
	