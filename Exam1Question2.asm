	processor 18F8722
	config	OSC=HS, WDT=OFF, LVP=OFF
	radix	decimal

;Setting labels for needed memory locations
first	equ	14
second	equ	15
third	equ	16

;Setting lables for LEDs' SFR
TRISF	equ	0xF97
LATF	equ	0xF8E

;Setting labels for transistor Q3's SFR
TRISA	equ	0xF92
LATA	equ	0xF89	


	;Turning on transistor Q3
	MOVLW	B'11101111'
	MOVWF	TRISA
	MOVLW	B'11111111'
	MOVWF	LATA
	
	;Setting LED8 as output
	MOVLW	B'01111111'
	MOVWF	TRISF
	
loop
	;Turing on LED8
	MOVLW	B'10000000'
	MOVWF	LATF
	
	;Waiting 1 second
	CALL	dly1s
	
	;Turning off LEDs
	CLRF	LATF
	
	;Waiting 2 seconds
	CALL	dly1s
	CALL	dly1s
	
	BRA	loop

	;Numbers chosen for the following loops and subroutines take into account
	;both the math and the additional steps required to call each subroutine
	;so that the total count adds up to approximately 1second (+- 5%)
	
;Subroutine to delay by 1 second 
dly1s
	MOVLW	4
	MOVWF	first

;Loop that calls next delay subroutine 4 times
L1
	CALL	dlyms
	DECF	first
	BNZ	L1
	RETURN
	
	
;Subroutine to delay by 250mS	
dlyms
	MOVLW	250
	MOVWF	second

;Loop that calls next delay subroutine 250 times
L2
	CALL	dlyus
	DECF	second
	BNZ	L2
	RETURN

;Subroutine to delay by 1mS
dlyus
	MOVLW	250
	MOVWF	third

;Loop that calls next delay subroutine 250 times
L3
	CALL	dlyns
	DECF	third
	BNZ	L3
	RETURN
	
;Subroutine to delay by 2us	
dlyns
	NOP
	NOP
	NOP
	RETURN
	
	end