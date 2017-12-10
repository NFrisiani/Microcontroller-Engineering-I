	processor 18F8722
	config	OSC=HS, WDT=OFF, LVP=OFF
	radix	decimal
	
;Setting labels for LEDs SFR	
LATF	equ	0xF8E
TRISF	equ	0xF97
	
;Setting labels for Transistor Q3 SFR
LATA	equ	0xF89
TRISA	equ	0xF92
	
;Setting labels for switches' four MSB SFR
PORTH	equ	0xF87
LATH	equ	0xF90
TRISH	equ	0xF99

;Setting labels for switches' four LSB SFR
PORTC	equ	0xF82
TRISC	equ	0xF94
	
;Setting labels for digital IO SFR
ADCON1	equ	0xFC1
	
;Setting labels for the temporary varibles needed for operations	
N1	equ	14
N2	equ	15
	
	;Initializing digital IO
	MOVLW	0x0F
	MOVWF	ADCON1
	
	;Setting all LEDs as output and making sure they are turned off
	MOVLW	B'00000000'
	MOVWF	LATF
	MOVLW	B'00000000'
	MOVWF	TRISF
	
	;Turing on transistor Q3
	MOVLW	B'11101111'
	MOVWF	TRISA
	MOVLW	B'11111111'
	MOVWF	LATA
	
	;Setting four MSB as input 
	;and making sure U1 and U2 are off (by setting transistor Q1 and Q2 as inputs) 
	MOVLW	B'11111111'
	MOVWF	TRISH
	
	;Setting four LSB as input
	MOVLW	B'11111111'
	MOVWF	TRISC

	
loop
	;Getting input from the four MSB and storing it in N2
	MOVF	PORTH, W
	ANDLW	B'11110000'
	MOVWF	N2
	
	;Getting input from the four LSB and storing it in N1
	;making sure the bits are in position 0 to 3
	MOVF	PORTC, W
	MOVWF	N1
	RRNCF   N1, F
	RRNCF	N1, W
	ANDLW	B'00001111'
	
	;Adding N1 and N2
	ADDWF	N2, W
	
	;Checking if the number is greater than (or equal to) 7
	ADDLW	-7
	BNN	first_range
	
	;Else turnign LEDs off
	MOVLW	B'00000000'
	MOVWF	LATF
	
	BRA	loop
	
first_range
	;Checking if it is also less than (or equal to) 31 (31-7 = 24)
	ADDLW	-24
	BN	second_range
	BZ	second_range
	
	;Else turning LEDs off
	MOVLW	B'00000000'
	MOVWF	LATF
	
	BRA	loop
	
second_range
	;Turing LED1 on
	MOVLW	B'00000001'
	MOVWF	LATF
	BRA	loop
	
	end


