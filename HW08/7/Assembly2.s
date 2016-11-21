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

		LDR r1,= 0x40001002 ;Load the count address
		LDRB r1, [r1] ;Load the count value
		
		LDR r4,= 0x40001010 ;Load the start of the list
		
		LDR r2,= 0; ;Set the incrementor to 0
		
		LDR r5,= 0x40001000 ;Smallest address
		LDR r6,= 0x40001001 ;Largest address
		
LOOP1	CMP r1, r2 ;Compare the count to the incrementor
		BEQ stop ;If the count has reached the incrementor then end the program
		BGT SCAN ;Else do SCAN
		
SCAN	LDRB r7, [r4, r2] ;Load the value at the address r4 with an offset of r2
		CMP r7, r5 ;Compare r7 to the lowest value
		BLS LESS ;If less than, go to LESS
		
		CMP r7, r6 ;Compare r7 to the greatest value
		BHI GREAT ;If greater, go to GREAT
		
		BAL NONE ;Else always go to none (neither greatest nor least)
		
LESS	STRB r7, [r5] ;Store r7 as the new smallest value
		ADD r2, r2, #1 ;Increment the incrementor
		BAL LOOP1 ;Restart the loop

GREAT	STRB r7, [r6] ;STore r7 as the new greatest value
		ADD r2, r2, #1 ;Increment the incrementor
		BAL LOOP1 ;Restart the loop
		
NONE	ADD r2, r2, #1 ;Increment the incrementor and go again
		BAL LOOP1

;************************************************************************
;
; an infinite loop because the processor continues to fetch instructions
stop	BAL	stop
	END			;END directive to show nothing more in file
	
	