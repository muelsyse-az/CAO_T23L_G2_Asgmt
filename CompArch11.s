			;==============================================================
			;		Assignment 2 - Question 1a and 1b
			;		Name: Your Name
			;		ID: Your ID
			;==============================================================
			
			;===================	DATA INITIALIZATION ======================
			MOV		r8, #0x2000      ; r8 = start address for data
			
			MOV		r0, #10
			STR		r0, [r8], #4
			
			MOV		r0, #20
			STR		r0, [r8], #4
			
			MOV		r0, #30
			STR		r0, [r8], #4
			
			MOV		r0, #40
			STR		r0, [r8], #4
			
			MOV		r0, #50
			STR		r0, [r8], #4
			
			MOV		r0, #60
			STR		r0, [r8], #4
			
			MOV		r0, #70
			STR		r0, [r8], #4
			
			MOV		r0, #80
			STR		r0, [r8], #4
			
			MOV		r0, #90
			STR		r0, [r8], #4
			
			MOV		r0, #100
			STR		r0, [r8]         ; r8 now points beyond 0x2024
			
			;===================	Q1 PROCESSING ============================
			MOV		r8, #0x2000      ; reset pointer to start
			MOV		r9, #10          ; loop count
			
			MOV		r0, #0           ; r0 = sum low
			MOV		r1, #0           ; r1 = sum high
			MOV		r2, #0           ; r2 = max
			
LOOP_START
			LDR		r3, [r8], #4     ; load value into r3
			
			ADDS		r0, r0, r3       ; r0 = r0 + r3, update carry
			ADC		r1, r1, #0       ; r1 = r1 + carry
			
			CMP		r3, r2
			MOVHI	r2, r3           ; if r3 > r2, update max
			
			SUBS		r9, r9, #1
			BNE		LOOP_START
			
			;===================	STORE RESULTS ============================
			LDR		r4, =0x2100
			STR		r0, [r4]         ; sum low
			STR		r1, [r4, #4]     ; sum high
			
			LDR		r5, =0x2150
			STR		r2, [r5]         ; max value
			
			;===================	END ============================
			END
