	processor 18F8722
	config	OSC=HS, WDT=OFF, LVP=OFF
	radix	decimal

TRISJ	equ	0xF9A
LATJ	equ	0xF91
PORTJ	equ	0xF88

TRISB	equ	0xF93
PORTB	equ	0xF81
	
TRISC	equ	0xF94
PORTC	equ	0xF82
	
ADCON1	equ	0xFC1

F2	equ	18
F1	equ	17
X2	equ	15
X1	equ	11
D1	equ	13
D2	equ	12
E1	equ	14
G1	equ	16
A1	equ	10
A2	equ	9
B1	equ	8
B2	equ	7
C1	equ	6
C2	equ	5
highD1	equ	4
highD2	equ	3
lowC1	equ	2
lowC2	equ	1
Y1	equ	20
Y2	equ	21
lowB1	equ	22
lowB2	equ	23
toggle	equ	19
	
	
	MOVLW	0x0F
	MOVWF	ADCON1
	
	MOVLW	B'10111111'
	MOVWF	TRISJ
	
		
loop	
	MOVF	PORTC, W
	MOVWF	toggle
	RRNCF	toggle, F
	RRNCF	toggle, W
	ANDLW	B'00001111'
	MOVWF	toggle
	ADDLW	-1
	BZ	song_1
	BN	song_2
	BRA	loop

song_1
	
	MOVLW	192
sna1
	ADDLW	-1
	CALL	play_E, 1
	BNZ	sna1
	CALL	wait_x
	CALL	wait_y
	
	MOVF	PORTC, W
	MOVWF	toggle
	RRNCF	toggle, F
	RRNCF	toggle, W
	ANDLW	B'00001111'
	MOVWF	toggle
	ADDLW	-1
	BN	song_2
	
	
	MOVLW	64
sna2
	ADDLW	-1
	CALL	play_E, 1
	BNZ	sna2
	CALL	wait_y
	
	MOVF	PORTC, W
	MOVWF	toggle
	RRNCF	toggle, F
	RRNCF	toggle, W
	ANDLW	B'00001111'
	MOVWF	toggle
	ADDLW	-1
	BN	song_2
	
	
	MOVLW	96
sna3
	ADDLW	-1
	CALL	play_G, 1
	BNZ	sna3
	CALL	wait_x
	
	MOVF	PORTC, W
	MOVWF	toggle
	RRNCF	toggle, F
	RRNCF	toggle, W
	ANDLW	B'00001111'
	MOVWF	toggle
	ADDLW	-1
	BN	song_2
	
	
	MOVLW	96
sna4
	ADDLW	-1
	CALL	play_E, 1
	BNZ	sna4
	CALL	wait_x
	
	MOVF	PORTC, W
	MOVWF	toggle
	RRNCF	toggle, F
	RRNCF	toggle, W
	ANDLW	B'00001111'
	MOVWF	toggle
	ADDLW	-1
	BN	song_2
	
	
	MOVLW	96
sna5
	ADDLW	-1
	CALL	play_D, 1
	BNZ	sna5
	CALL	wait_y
	
	MOVF	PORTC, W
	MOVWF	toggle
	RRNCF	toggle, F
	RRNCF	toggle, W
	ANDLW	B'00001111'
	MOVWF	toggle
	ADDLW	-1
	BN	song_2
	
	
	MOVLW	255
sna6
	ADDLW	-1
	CALL	play_lowC, 1
	BNZ	sna6
	CALL	wait_x
	
	MOVF	PORTC, W
	MOVWF	toggle
	RRNCF	toggle, F
	RRNCF	toggle, W
	ANDLW	B'00001111'
	MOVWF	toggle
	ADDLW	-1
	BN	song_2
	
	
	MOVLW	255
sna7
	ADDLW	-1
	CALL	play_lowB, 1
	BNZ	sna7
	CALL	wait_x
	
	
	BRA	loop
	
	

song_2
	
	MOVLW	64
note1
	ADDLW	-1
	CALL	play_D, 1
	BNZ	note1
	CALL	wait_x
	
	MOVF	PORTC, W
	MOVWF	toggle
	RRNCF	toggle, F
	RRNCF	toggle, W
	ANDLW	B'00001111'
	MOVWF	toggle
	ADDLW	-1
	BZ	song_1
	
	
	MOVLW	64
note2
	ADDLW	-1
	CALL	play_D, 1
	BNZ	note2
	CALL	wait_x
	
	
	MOVLW	128
note3
	ADDLW	-1
	CALL	play_E, 1
	BNZ	note3	
	CALL	wait_x
	CALL	wait_x
	
	
	MOVLW	128
note4
	ADDLW	-1
	CALL	play_D, 1
	BNZ	note4
	CALL	wait_x
	CALL	wait_x	
	
	
	MOVLW	128
note5
	ADDLW	-1
	CALL	play_G, 1
	BNZ	note5
	CALL	wait_x
	CALL	wait_x
	
	
	MOVLW	255
note6
	ADDLW	-1
	CALL	play_F, 1
	BNZ	note6
	CALL	wait_x
	CALL	wait_x
	CALL	wait_x
	CALL	wait_x
	
	
	MOVLW	64
note7
	ADDLW	-1
	CALL	play_D, 1
	BNZ	note7
	CALL	wait_x
	
	
	MOVLW	64
note8
	ADDLW	-1
	CALL	play_D, 1
	BNZ	note8
	CALL	wait_x
	
	
	MOVLW	128
note9
	ADDLW	-1
	CALL	play_E, 1
	BNZ	note9
	CALL	wait_x
	CALL	wait_x
	
	
	MOVLW	128
note10
	ADDLW	-1
	CALL	play_D, 1
	BNZ	note10
	CALL	wait_x
	CALL	wait_x
	
	
	MOVLW	128
note11
	ADDLW	-1
	CALL	play_A, 1
	BNZ	note11
	CALL	wait_x
	CALL	wait_x
	
	
	MOVLW	255
note12
	ADDLW	-1
	CALL	play_G, 1
	BNZ	note12
	CALL	wait_x
	CALL	wait_x
	CALL	wait_x
	CALL	wait_x
	
	
	MOVLW	64
note13
	ADDLW	-1
	CALL	play_D, 1
	BNZ	note13
	CALL	wait_x
	
	
	MOVLW	64
note14
	ADDLW	-1
	CALL	play_D, 1
	BNZ	note14
	CALL	wait_x
	
	
	MOVLW	128
note15
	ADDLW	-1
	CALL	play_highD, 1
	BNZ	note15
	CALL	wait_x
	CALL	wait_x
	
	
	MOVLW	128
note16
	ADDLW	-1
	CALL	play_B, 1
	BNZ	note16
	CALL	wait_x
	CALL	wait_x
	
	
	MOVLW	128
note17
	ADDLW	-1
	CALL	play_G, 1
	BNZ	note17
	CALL	wait_x
	CALL	wait_x
	
	
	MOVLW	128
note18
	ADDLW	-1
	CALL	play_F, 1
	BNZ	note18
	CALL	wait_x
	CALL	wait_x
	
	
	MOVLW	128
note19
	ADDLW	-1
	CALL	play_E, 1
	BNZ	note19
	CALL	wait_x
	CALL	wait_x
	
	
	MOVLW	64
note20
	ADDLW	-1
	CALL	play_C, 1
	BNZ	note20
	CALL	wait_x
	
	
	MOVLW	64
note21
	ADDLW	-1
	CALL	play_C, 1
	BNZ	note21
	CALL	wait_x
	
	
	MOVLW	128
note22
	ADDLW	-1
	CALL	play_B, 1
	BNZ	note22
	CALL	wait_x
	CALL	wait_x
	
	
	MOVLW	128
note23
	ADDLW	-1
	CALL	play_G, 1
	BNZ	note23
	CALL	wait_x
	CALL	wait_x
	
	
	MOVLW	128
note24
	ADDLW	-1
	CALL	play_A, 1
	BNZ	note24
	CALL	wait_x
	CALL	wait_x
	
	
	MOVLW	255
note25
	ADDLW	-1
	CALL	play_G, 1
	BNZ	note25
	CALL	wait_x
	CALL	wait_x
	CALL	wait_x
	CALL	wait_x
	
	BRA	loop
	
	
	
play_B	
	MOVLW	B'11111111'
	MOVWF	LATJ
	
	CALL	dly_B
	
	MOVLW	B'00000000'
	MOVWF	LATJ
	
	CALL	dly_B
	
	RETURN	1

play_C	
	MOVLW	B'11111111'
	MOVWF	LATJ
	
	CALL	dly_C
	
	MOVLW	B'00000000'
	MOVWF	LATJ
	
	CALL	dly_C
	
	RETURN	1
	
play_highD	
	MOVLW	B'11111111'
	MOVWF	LATJ
	
	CALL	dly_highD
	
	MOVLW	B'00000000'
	MOVWF	LATJ
	
	CALL	dly_highD
	
	RETURN	1
	
play_A	
	MOVLW	B'11111111'
	MOVWF	LATJ
	
	CALL	dly_A
	
	MOVLW	B'00000000'
	MOVWF	LATJ
	
	CALL	dly_A
	
	RETURN	1
	
play_F	
	MOVLW	B'11111111'
	MOVWF	LATJ
	
	CALL	dly_F
	
	MOVLW	B'00000000'
	MOVWF	LATJ
	
	CALL	dly_F
	
	RETURN	1
	
play_D	
	MOVLW	B'11111111'
	MOVWF	LATJ
	
	CALL	dly_D
	
	MOVLW	B'00000000'
	MOVWF	LATJ
	
	CALL	dly_D
	
	RETURN	1
	
play_G	
	MOVLW	B'11111111'
	MOVWF	LATJ
	
	CALL	dly_G
	
	MOVLW	B'00000000'
	MOVWF	LATJ
	
	CALL	dly_G
	
	RETURN	1
	
	
play_E	
	MOVLW	B'11111111'
	MOVWF	LATJ
	
	CALL	dly_E
	
	MOVLW	B'00000000'
	MOVWF	LATJ
	
	CALL	dly_E
	
	RETURN	1
	
	
play_lowC	
	MOVLW	B'11111111'
	MOVWF	LATJ
	
	CALL	dly_lowC
	
	MOVLW	B'00000000'
	MOVWF	LATJ
	
	CALL	dly_lowC
	
	RETURN	1
	
play_lowB	
	MOVLW	B'11111111'
	MOVWF	LATJ
	
	CALL	dly_lowB
	
	MOVLW	B'00000000'
	MOVWF	LATJ
	
	CALL	dly_lowB
	
	RETURN	1
	
	

wait_y
	MOVLW	50
	MOVWF	Y1
YY
	CALL	dly_D
	DECF	Y1
	BNZ	YY
	RETURN	

wait_x
	MOVLW	100
	MOVWF	X1
XX
	CALL	dly_D
	DECF	X1
	BNZ	XX
	RETURN


	
dly_lowB	
	MOVLW	8
	MOVWF	lowB1
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
lowBB
	CALL	dly_xus
	MOVLW	5
	MOVWF	lowB2
	NOP
	NOP
lowBBB
	NOP
	DECF	lowB2
	BNZ	lowBBB
	
	DECF	lowB1
	BNZ	lowBB
	RETURN
	
	
	
dly_lowC	
	MOVLW	7
	MOVWF	lowC1
lowCC
	CALL	dly_xus
	MOVLW	17
	MOVWF	lowC2
	NOP
	NOP
	NOP
	NOP
	NOP
lowCCC
	NOP
	DECF	lowC2
	BNZ	lowCCC
	
	DECF	lowC1
	BNZ	lowCC
	RETURN
	
	
	
dly_B	
	MOVLW	4
	MOVWF	B1
BB
	CALL	dly_xus
	MOVLW	5
	MOVWF	B2
	NOP
	NOP
BBB
	NOP
	DECF	B2
	BNZ	BBB
	
	DECF	B1
	BNZ	BB
	RETURN

	
dly_C	
	MOVLW	3
	MOVWF	C1
CC
	CALL	dly_xus
	MOVLW	45
	MOVWF	C2
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
CCC
	NOP
	DECF	C2
	BNZ	CCC
	
	DECF	C1
	BNZ	CC
	RETURN
	
	
dly_highD	
	MOVLW	3
	MOVWF	highD1
highDD
	CALL	dly_xus
	MOVLW	23
	MOVWF	highD2
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
highDDD
	NOP
	DECF	highD2
	BNZ	highDDD
	
	DECF	highD1
	BNZ	highDD
	RETURN
	
dly_A	
	MOVLW	4
	MOVWF	A1
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
AA
	CALL	dly_xus
	MOVLW	24
	MOVWF	A2
	NOP
AAA
	NOP
	DECF	A2
	BNZ	AAA
	
	DECF	A1
	BNZ	AA
	RETURN

	
	
dly_F	
	MOVLW	5
	MOVWF	F1
FF
	CALL	dly_xus
	MOVLW	16
	MOVWF	F2
	NOP
FFF
	NOP
	DECF	F2
	BNZ	FFF
	
	DECF	F1
	BNZ	FF
	RETURN
	
	
dly_X
	MOVLW	250
	MOVWF	X2
XXX
	CALL	dly_xus
	DECF	X2
	BNZ	XXX
	RETURN

dly_G	
	MOVLW	5
	MOVWF	G1
GG
	CALL	dly_xus
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	DECF	G1
	BNZ	GG
	RETURN

	
dly_E	
	MOVLW	6
	MOVWF	E1
EE
	CALL	dly_xus
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	DECF	E1
	BNZ	EE
	RETURN
	
dly_D	
	MOVLW	7
	MOVWF	D2
DD
	CALL	dly_xus
	DECF	D2
	BNZ	DD
	RETURN
	
dly_xus
	MOVLW	50
	MOVWF	D1
	
L1
	DECF	D1
	CALL	dly_2000ns
	NOP
	NOP
	NOP
	BNZ	L1
	RETURN
	
dly_2000ns
	NOP
	NOP
	RETURN
	   	   
	
	end