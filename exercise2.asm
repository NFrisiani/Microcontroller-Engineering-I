	processor 18F8722
	config	OSC=HS, WDT=OFF, LVP=OFF
	radix	decimal

;Setting labels for needed memory locations
pb1	equ	14
pb2	equ	15

;Setting lables for U1 and U2 SFRs
TRISF	equ	0xF97
LATF	equ	0xF8E
	
TRISH	equ	0xF99
LATH	equ	0xF90
	
TRISJ	equ	0xF9A
PORTJ	equ	0xF88

TRISB	equ	0xF93
PORTB	equ	0xF81

ADCON1	equ	0xFC1
	
	
	MOVLW	0x0F
	MOVWF	ADCON1
	
	MOVLW	B'11111100'
	MOVWF	TRISH
	
	MOVLW	B'11111111'
	MOVWF	PORTB
	
	MOVLW	B'11111111'
	MOVWF	PORTJ
	
	MOVLW	B'00000000'
	MOVWF	TRISF
	
loop
	MOVF	PORTB, W
	ANDLW	B'00000001'
	MOVWF	pb2
	
	MOVF	PORTJ, W
	MOVWF	pb1
	RRNCF	pb1, F
	RRNCF	pb1, F
	RRNCF	pb1, F
	RRNCF	pb1, F
	RRNCF	pb1, W
	ANDLW	B'00000001'
	
	ADDLW	0
	BZ	turnon_U1
	
	MOVF	pb2, W
	ADDLW	0
	BZ	turnon_U2
	
	SETF	LATH
	
	BRA	loop
	
	
turnon_U1
	MOVF	pb2, W
	ADDLW	0
	BZ	turnon_both
	
	MOVLW	B'11111110'
	MOVWF	LATH
	
	MOVLW	B'00011100'
	MOVWF	LATF
	
	BRA	loop
	
turnon_U2
	MOVF	pb1, W
	ADDLW	0
	BZ	turnon_both
	
	MOVLW	B'11111101'
	MOVWF	LATH
	
	MOVLW	B'00011100'
	MOVWF	LATF
	
	BRA	loop
	
turnon_both
	MOVLW	B'11111100'
	MOVWF	LATH
	
	MOVLW	B'00011100'
	MOVWF	LATF
	
	BRA	loop
	
	end