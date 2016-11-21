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

		LDR r3,= 0 ;Set the incrementor to 0
		LDR r7,= 0 ;Set the count to 0
		
LOOP1	LDRB r4, [r0, r3] ;Load the value at r0 (address passed to the program) with offset of r3
		CMP r4, #0 ;Compare that value to the null char
		BEQ STORE ;If it is the null char then go to STORE
		BNE STRLEN ;If it is not then go to STRLEN
		
STRLEN	ADD r7, r7, #1 ;Increment the count
		ADD r3, r3, #1 ;Increment the incrementor/offset
		BAL LOOP1 ;Restart the loop
		
STORE	SUB r7, r7, #1
		BAL stop
		

;************************************************************************
;
; an infinite loop because the processor continues to fetch instructions
stop	BAL	stop
	END			;END directive to show nothing more in file
	
	