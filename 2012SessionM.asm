	processor 18F8722
	config OSC=HS, WDT=OFF, LVP=OFF
    
	radix   decimal  
   
;Giving labels to needed locations (z and SFRs)    
TRISA	equ	0xF92	    
LATA	equ	0xF89

TRISF	equ	0xF97
LATF	equ	0xF8E
	
ADCON1	equ	0xFC1
	
z	equ	14
   
	;Enabling pins for digital IO
	MOVLW	0x0F
	MOVWF	ADCON1
	
	;Enabling transistor Q3
	MOVLW	B'11101111'
	MOVWF	TRISA
	MOVLW	B'00010000'
	MOVWF	LATA
	
	;Enabling LEDs as outputs and clearing them from any previous value
	MOVLW	B'00000000'
	MOVWF	LATF
	MOVLW	B'00000000'
	MOVWF	TRISF
	
	;Setting z = 0
	CLRF	z
	
loop
	;Incrementing z and showing it on the LEDs
	INCF	z
	MOVF	z, W
	MOVWF	LATF
	
	;Calling nested wait subroutines
	;Total wait for each call = 123.5484 mS
	CALL	WAIT
	BRA	loop
	
WAIT	
	;Used to call the second wait subroutine 110 times
	MOVLW	110
	MOVWF	0x10
L1
	;Calling second wait subroutine
	CALL	middle_wait
	DECF	0x10
	BNZ	L1
	RETURN

middle_wait
	;Used to call the last wait subroutine 200 times
	MOVLW	200
	MOVWF	0x11
L2
	;Calling last wait subroutine
	CALL	basic_wait
	DECF	0x11
	BNZ	L2
	RETURN
	
;Subroutine that delays of approximately 3.6uS each time it's called
basic_wait
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	RETURN
	
	end


	
	
	