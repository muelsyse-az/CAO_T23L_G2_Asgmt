        ;store  sample data
        MOV     R8, #0x2000

        MOV     R0,#0x11000000
        MOV     R1,#0x00110000
        MOV     R2,#0x00001100
        MOV     R3,#0x00000011
        ADD     R0, R0, R1
        ADD     R0, R0, R2
        ADD     R0, R0, R3
        STR     R0, [R8] ; 0x2000

        MOV     R0,#0x22000000
        MOV     R1,#0x00220000
        MOV     R2,#0x00003300
        MOV     R3,#0x00000033
        ADD     R0, R0, R1
        ADD     R0, R0, R2
        ADD     R0, R0, R3
        STR     R0, [R8, #4] ; 0x2004

        MOV     R0,#0x31000000
        MOV     R1,#0x00110000
        MOV     R2,#0x00001100
        MOV     R3,#0x00000011
        ADD     R0, R0, R1
        ADD     R0, R0, R2
        ADD     R0, R0, R3
        STR     R0, [R8, #8] ; 0x2008

        MOV     R0,#0x42000000
        MOV     R1,#0x00220000
        MOV     R2,#0x00003300
        MOV     R3,#0x00000033
        ADD     R0, R0, R1
        ADD     R0, R0, R2
        ADD     R0, R0, R3
        STR     R0, [R8, #12] ; 0x200C

        MOV     R0,#0x51000000
        MOV     R1,#0x00110000
        MOV     R2,#0x00001100
        MOV     R3,#0x00000011
        ADD     R0, R0, R1
        ADD     R0, R0, R2
        ADD     R0, R0, R3
        STR     R0, [R8, #16] ; 0x2010

        MOV     R0,#0x62000000
        MOV     R1,#0x00220000
        MOV     R2,#0x00003300
        MOV     R3,#0x00000033
        ADD     R0, R0, R1
        ADD     R0, R0, R2
        ADD     R0, R0, R3
        STR     R0, [R8, #20] ;0x2014


        ;main
        MOV     R0, #0x2000 ;R0 = data base
        MOV     R1, #6 ;6 data items

        MOV     R2, #0 ;sum low
        MOV     R3, #0 ;sum high
        MOV     R6, #0 ;max

LOOP    
        LDR     R4, [R0]

        ADD     R2, R2, R4
        CMP     R2, R4
        BHS     NOCARRY;higher or same nocarry
        ADD     R3, R3, #1
NOCARRY 

        CMP     R4, R6
        BLS     SKIPMAX;lower or same skipmax
        MOV     R6, R4
SKIPMAX 

        ADD     R0, R0, #4
        SUB     R1, R1, #1
        CMP     R1, #0
        BNE     LOOP

        ;store  sum in 2100
        MOV     R5, #0x2100
        STR     R2, [R5]
        STR     R3, [R5, #4]

        ;store  max in 2150
        LDR     R5, =0x2150
        STR     R6, [R5]
