	processor 18F8722
	config	OSC=HS, WDT=OFF, LVP=OFF
	radix	decimal

;Setting labels for toggle switches
PORTH	equ	0xF87
TRISH	equ	0xF99
	
;Setting labels for transistor Q3
TRISA	equ	0xF92
LATA	equ	0xF89
	
;Setting labels for LEDs
TRISF	equ	0xF97
LATF	equ	0xF8E
	
;Setting labels for digital IO
ADCON1	equ	0xFC1
	
;Setting lable for needed memory location
number	equ	0x10
	
	;Initializing digital IO
	MOVLW	0x0F
	MOVWF	ADCON1
	
	;Making sure LEDs are off
	CLRF	LATF
	
	;Turnign on transistor Q3
	MOVLW	B'11101111'
	MOVWF	TRISA
	MOVLW	B'11111111'
	MOVWF	LATA
	
	;Setting four MSB toggle switches as inputs
	;and making sure transistors Q1 and Q2 are off
	MOVLW	B'11111111'
	MOVWF	TRISH
	
	;Setting all LEDs as outputs
	MOVLW	B'00000000'
	MOVWF	TRISF
	

loop
	;Taking value from the MSB toggle switches
	MOVF	PORTH, W
	ANDLW	B'11110000'
	MOVWF	number
	SWAPF	number
	
	;Checkign in bit-3 is 1 or 0
	MOVF	number, W
	ADDLW	-8
	
	;if bit-3 = 0
	BN	add_0s
	
	;Checking if two's complement is = -1,
	;in which case result of x/2 = 0
	ADDLW	-7
	BZ	its_0
	
	;Else add 1s for bits 4 to 7
	ADDLW	255
	
	;To compensate for two's complement divisions with odd numbers
	ADDLW	1
	
	;Rotate right once (equals to dividing by 2)
	MOVWF	number
	RRNCF	number, W
	
	;Making sure bit-7 is still a 1
	IORLW	B'10000000'
	
	;Giving values to the LEDs
	MOVWF	LATF
	BRA	loop
	
	
add_0s
	;Adding back 8 previously subtracted
	ADDLW	8
	
	;Rotate right once (equals to dividing by 2)
	MOVWF	number
	RRNCF	number, W
	
	;Making sure bit-7 is still a 0
	ANDLW	B'01111111'
	
	;Giving values to the LEDs
	MOVWF	LATF
	BRA	loop
	
its_0
	;Turnign all LEDs off
	CLRF	LATF
	BRA	loop
	end


