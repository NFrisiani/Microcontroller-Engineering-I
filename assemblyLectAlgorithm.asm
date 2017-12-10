    processor 18F8722			; We must tell the assembler which processor we are planning to use since different processors have different instruction sets
    config OSC=HS, WDT=OFF, LVP=OFF	; We have to configure the processor setting at least a little bit
    radix decimal			; We tell the assembler what number base we are using by default.

    ; The algorithm is if a!=0 then b=3, otherwise b=b+1 (ie b=6 if we start with b=5)   
    ; Data Memory locations:   a=0x0,  b=0x1
    MOVLW 0	; Set the initial value for [a]
    MOVWF 0x0 ;  Put [a]=0 to start us off
    MOVLW 5	; Set the initial value for [b]
    MOVWF 0x1 ;  Put [b]=10
    
    ; The algorithm
    MOVF 0x0, W ;  Copy the contents of a into the W register
    ADDLW 0	;  Add the contents of a with 0  (to create the ALU flags)
    
    BZ L_Ais0_incB	; Jump if a==0
L_Beq3		; Code to set [b] to 3 - first use the W Reg
		; Note labels don't need to be used - here the code just flows through if B!=0
    MOVLW   3	; Put 3 into W
    MOVWF   0x1 ; Copy W value to [b]  ie. [b]=3
    BRA	    L_end ; We are done - jump to the end of the program.
    
L_Ais0_incB	     ; We will increment [b] 
    MOVF    0x1, W   ; Copy [b] into W
    ADDLW   1	     ; Increment W
    MOVWF   0x1	     ; Copy W value to [b]  ie. [b]=[b]+1
    
; We are done - flow through to the end of the program
L_end BRA L_end	; The label can be on the same line as the command
; I used 'L_' to demonstrate is a define for a label, rather than anything else
; I used hex to indicate data memory address
; I used decimal to indicate literal values. I didn't have to use D'3' since I had defined "radix decimal"
		
 end 



