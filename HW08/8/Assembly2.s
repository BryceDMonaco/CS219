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

		LDR r1,= 0x40001000 ;The key address
		LDRB r1, [r1] ;Load the key value
		
		LDR r2,= 0x40001010 ;The address of the start of the string
		LDR r3,= 0 ;Set the incrementor to 0
		LDR r4,= 0 ;Set the count to 0
		
LOOP1	LDRB r7, [r2, r3] ;Load the value at r2 with the offset r3
		CMP r7, #0 ;Compare that value to the null char
		BEQ STORE ;If it is the null char then go to STORE
		
		CMP r7, r1 ;Compare that value to the key
		BEQ COUNT ;If it is the key go to COUNT
		BNE NEXT ;Else go to NEXT
		
COUNT	ADD r4, r4, #1 ;Increment the count
		ADD r3, r3, #1 ;Increment the incrementor/offset
		BAL LOOP1 ;Restart the loop
		
NEXT	ADD r3, r3, #1 ;Increment the incrementor/offset
		BAL LOOP1 ;Restart the loop
		
STORE	LDR r2,= 0x40001004 ;Load the count address
		STRB r4, [r2] ;Store the count
		BAL stop
		

;************************************************************************
;
; an infinite loop because the processor continues to fetch instructions
stop	BAL	stop
	END			;END directive to show nothing more in file
	
	