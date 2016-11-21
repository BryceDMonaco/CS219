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

UNPACK	LDR r0,= 0x40001000
		LDR r1,= 0x40001000
		LDR r2,= 0x40001001
		LDR r3,= 0x40001001
		
		LDRB r0, [r0] ;Get the lower half of the first value
		
		LSR r1, #8 ;shift r1 to the right 8 bits
		LDRB r1, [r1] ;Get the upper half (which has been shifted down) of the first value
		
		LDRB r2, [r2] ;Get the lower half of the second value
		
		LSR r3, #8 ;Shift r3 to the right 8 bits
		LDRB r3, [r3] ;Get the value of the upper half
		
		LDR r8,= 0x40001004 ;Get the base storage address
		
		STRB r1, [r8, #0] ;Store the higher order of the first value first
		STRB r0, [r8, #1] ;Store the lower order of the first value at r8 with an offset of 1
		STRB r3, [r8, #2] ;Store the higher order of the second value at r8 with offset of 2
		STRB r2, [r8, #3] ;Store the lower order of the second value at r8 with an offset of 3

;************************************************************************
;
; an infinite loop because the processor continues to fetch instructions
stop	BAL	stop
	END			;END directive to show nothing more in file
	
	