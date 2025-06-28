         ;ASSIGNMENT2_T23L_G2 ARM PROGRAM

         ;KASHVIN GEORGE (243UC2462Z)
         ;AIDIL AMDAN BIN ZULAIME (243UC245MZ)
         ;'IZZAH IMAN MAISARAH BINTI ZAINUDDIN (1211108580)
         ;FORMIGA LINCOLN LEMOS CORREIA LANGA (243UC24674)

         ;store  sample data
         MOV     R8, #0x2000

         ;the    gist of how this sample data is stored is that
         ;1)     it moves various values into registers
         ;2)     sums up all those registers
         ;3)     stores sum into memory based on offset from R8

         ; submission file uses Input Variant GF
         MOV     R0,#0x11000000
         MOV     R1,#0x00110000
         MOV     R2,#0x00001100
         MOV     R3,#0x00000011
         ADD     R0, R0, R1
         ADD     R0, R0, R2
         ADD     R0, R0, R3
         STR     R0, [R8] ;0x2000

         MOV     R0,#0x22000000
         MOV     R1,#0x00220000
         MOV     R2,#0x00003300
         MOV     R3,#0x00000033
         ADD     R0, R0, R1
         ADD     R0, R0, R2
         ADD     R0, R0, R3
         STR     R0, [R8, #4] ;0x2004

         MOV     R0,#0xBA000000
         MOV     R1,#0x00D00000
         MOV     R2,#0x0000F000
         MOV     R3,#0x0000000D
         ADD     R0, R0, R1
         ADD     R0, R0, R2
         ADD     R0, R0, R3
         STR     R0, [R8, #8] ;0x2008

         MOV     R0,#0x42000000
         MOV     R1,#0x00220000
         MOV     R2,#0x00003300
         MOV     R3,#0x00000033
         ADD     R0, R0, R1
         ADD     R0, R0, R2
         ADD     R0, R0, R3
         STR     R0, [R8, #12] ;0x200C

         MOV     R0,#0x51000000
         MOV     R1,#0x00110000
         MOV     R2,#0x00001100
         MOV     R3,#0x00000011
         ADD     R0, R0, R1
         ADD     R0, R0, R2
         ADD     R0, R0, R3
         STR     R0, [R8, #16] ;0x2010

         MOV     R0,#0x62000000
         MOV     R1,#0x00220000
         MOV     R2,#0x00003300
         MOV     R3,#0x00000033
         ADD     R0, R0, R1
         ADD     R0, R0, R2
         ADD     R0, R0, R3
         STR     R0, [R8, #20] ;0x2014

         MOV     R0,#0xBA000000
         MOV     R1,#0x00BE0000
         MOV     R2,#0x0000FA00
         MOV     R3,#0x000000CE
         ADD     R0, R0, R1
         ADD     R0, R0, R2
         ADD     R0, R0, R3
         STR     R0, [R8, #24] ;0x2020

         MOV     R0,#0x82000000
         MOV     R1,#0x00220000
         MOV     R2,#0x00003300
         MOV     R3,#0x00000033
         ADD     R0, R0, R1
         ADD     R0, R0, R2
         ADD     R0, R0, R3
         STR     R0, [R8, #28] ;0x201C

         MOV     R0,#0xFE000000
         MOV     R1,#0x00ED0000
         MOV     R2,#0x0000BE00
         MOV     R3,#0x000000EF
         ADD     R0, R0, R1
         ADD     R0, R0, R2
         ADD     R0, R0, R3
         STR     R0, [R8, #32] ;0x2020

         MOV     R0,#0xA2000000
         MOV     R1,#0x00220000
         MOV     R2,#0x00003300
         MOV     R3,#0x00000033
         ADD     R0, R0, R1
         ADD     R0, R0, R2
         ADD     R0, R0, R3
         STR     R0, [R8, #36] ;0x2024

         ;main   program starts here
         MOV     R0, #0x2000 ;base data location
         MOV     R1, #10 ;counter for 10 data items

         MOV     R2, #0 ;sum low 32-bit (for 1a)
         MOV     R3, #0 ;sum high 32-bit (for 1a)
         MOV     R6, #0 ;maximum value (for 1b)

LOOP     
         LDR     R4, [R0] ;R4 is where we'll do the addition

         ADD     R2, R2, R4
         CMP     R2, R4
         BHS     YESCARRY ;If CMP Result is >= (then C = 1), Run YESCARRY.
         ADD     R3, R3, #1
YESCARRY 

         CMP     R4, R6
         BLS     SKIPMAX ;If CMP Result is <= (then C = 0 OR Z = 1), Run SKIPMAX.
         MOV     R6, R4
SKIPMAX  
         ADD     R0, R0, #4 ;Offset by 4 based on location in memory of sample data
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
