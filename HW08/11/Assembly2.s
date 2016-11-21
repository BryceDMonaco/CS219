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

;I am assuming that r0 already has the address sent to it, no idea what it means to pass the address from a subroutine, sorry

		LDR r1,= 0 ;Set the offset to 0
		
LOOP	LDRB r2, [r0, r1] ;Load the char at r0 with offset r1
		
		CMP r2, #0 ;Compare to the null char
		BEQ stop
		
		CMP r2, #48 ;48 is the integer of the char '0'
		BGT stop ;If greater than 48 than the char is a decimal higher than zero
		BEQ REPLACE
		BNE NEXT
		
REPLACE LDR r5,= 32
		STRB r5, [r0, r1] ;Replace the value with 32 which is the decimal value of a space char ' '
		ADD r1, r1, #1 ;Increment the offset
		BAL LOOP
		
NEXT	ADD r1, r1, #1 ;Increment the offset
		BAL LOOP		

;************************************************************************
;
; an infinite loop because the processor continues to fetch instructions
stop	BAL	stop
	END			;END directive to show nothing more in file
	
	