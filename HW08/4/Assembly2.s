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

		LDR r1,= 0x40001000 ;Load the first address
		LDRB r1, [r1] ;Load the value at the first address
		
		LDR r2,= 0x40001004 ;Load the count address
		LDRB r2, [r2] ;Load the count value from the address
		
		LDR r3,= 0 ;Set r3 to the constant 0, for comparison
		
LOOP	CMP r2, r3 ;Compare the counter to 0
		BEQ STORE ;If the counter equals 0 store the value
		BGT LSHIFT ;If the counter does not yet equal zero go to LSHIFT
		
LSHIFT	LSL r1, #1 ;Shift the value at r1 1 position to the left
		SUB r2, r2, #1 ;Decrement the counter
		BAL LOOP ;Return to the loop 
		
STORE	LDR r4,= 0x40001008 ;Load the storage address
		STRB r1, [r4] ;Store the shifted value in r1 to r4
		BAL stop

;************************************************************************
;
; an infinite loop because the processor continues to fetch instructions
stop	BAL	stop
	END			;END directive to show nothing more in file
	
	