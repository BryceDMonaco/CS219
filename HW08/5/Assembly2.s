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

		LDR r1,= 0x40001000 ;Load the count address
		LDRB r1, [r1] ;Load the count value from the address
		
		LDR r2,= 0 ;Set the tracked value to 0
		LDR r3,= 0 ;Set the greatest storage to 0
		
		LDR r4,= 0x40001004 ;Load the list start address

LOOP1	CMP r1, r2 ;Compare the count to the tracked value
		BEQ STORE ;If r1 equal r2 then the loop is done, jump to STORE
		BGT FIND8 ;If r1 is still greater then the loop must go again, go to LOOP2

FIND8	LDRB r5, [r4, r2] ;Load the value at r4 with an offset of the incrementor
		CMP r5, r3 ;Compare the loaded value to the current greatest value
		BGT GREAT ;If the new value is greater than the greatest go to GREAT
		BLT LESS ;IF the new value is less then go to LESS

GREAT	LDR r3, [r5] ;Replace the value at r3 with the new value at r5
		ADD r2, r2, #1 ;Add one to the incrementor
		BAL LOOP1 ;Restart the main loop

LESS	ADD r2, r2, #1 ;Add one to the incrementor
		BAL LOOP1 ;Restart the main loop
		
STORE	LDR r1,= 0x40001002 ;Load the storage address
		STRB r3, [r1] ;Store the greatest value into the address
		BAL stop
		

;************************************************************************
;
; an infinite loop because the processor continues to fetch instructions
stop	BAL	stop
	END			;END directive to show nothing more in file
	
	