	processor 18F8722
	config OSC=HS, WDT=OFF, LVP=OFF
    
	radix   decimal  

;Setting up labels for Port H (Transistor Q1 and four MSB toggle switches)   
PORTH	equ	0xF87
LATH	equ	0xF90
TRISH	equ	0xF99

;Setting up labels for Port C (four LSB	toggle switches)
PORTC	equ	0xF82
TRISC	equ	0xF94

;Setting up labels for Port F (U1)
LATF	equ	0xF8E
TRISF	equ	0xF97
	
;Setting up labels for SFR ADCON1 (to initialize pins for IO)
ADCON1	equ	0XFC1
	
;Two Temporary locations used for the number operations involved in the program
N1	equ	0x11
N2	equ	0x10
	
	;Setting up pins for digital IO
	MOVLW	0x0F
	MOVWF	ADCON1
	
	;Turning on Trnasistor Q1 while setting four MSB of toggle switches as input
	MOVLW	B'11111110'
	MOVWF	TRISH
	MOVLW	B'00000000'
	MOVWF	LATH
	
	;Setting all pins for U1 as outputs
	MOVLW	B'00000000'
	MOVWF	TRISF
	
	;Setting pins for four LSB of toggle switches as input
	MOVLW	B'11111111'
	MOVWF	TRISC
	
loop
	;Taking value from the four MSB switches and masking four LSB
	;Moving content in temporary location N1
	MOVF	PORTH, W
	ANDLW	B'11110000'
	MOVWF	N1
	
	;Taking value from the four LSB switches
	;Rotating right two times because four LSB switches are pins RC2-RC5
	;Masking four MSB and adding result with content of N1
	
	MOVF	PORTC, W
	MOVWF	N2
	RRNCF	N2, F
	RRNCF	N2, W
	ANDLW	B'00001111'
	ADDWF	N1, W
	
	;Checking if 8-bit unsigned int is less than 128
	ADDLW	-128
	BN	display_L
	
	;Showing an H on the display U1
	MOVLW	B'00010101'
	MOVWF	LATF
	
	BRA	loop
	
display_L
	;Showing an L on the display U1
	MOVLW	B'10001111'
	MOVWF	LATF
	BRA	loop
	
	end