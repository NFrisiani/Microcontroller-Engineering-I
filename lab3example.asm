	processor 18F8722
	config OSC=HS, WDT=OFF, LVP=OFF
	org 0x0000
    
	radix decimal
 
LATF equ 0xF8E ;assignign port F --> LEDs and U1/U2
TRISF equ 0xF97 ;assignign port F --> LEDs and U1/U2
PORTF equ 0xF85 ;assigning port F --> LEDs and U1/U2

LATH equ 0xF90 ;A --> transistor Q3
TRISH equ 0xF99 ;assigning port H --> transistor Q2 and leftmost toggle switches
PORTH equ 0xF87 ;assigning port H --> transistor Q2 and leftmost toggle switches
 
small	equ	14
big	equ	15

	CALL	big_delay
	
L2	BRA	L2

delay
	MOVLW	71
	MOVWF	small
loop
	NOP
	NOP
	NOP
	NOP
	DECF	small
	BNZ		loop
	RETURN
	
big_delay
	MOVLW	99
	MOVWF	big
loop2
	CALL	delay
	DECF	big
	BNZ		loop2
	RETURN
	
	end
