                  ;       assignment 2

                  ;       --- Set up initial data at 0x2000 ---
                  ;       These values can be changed later for testing
                  mov     r0, #0x11000000
                  mov     r1, #0x00110000
                  mov     r2, #0x00001100
                  mov     r3, #0x00000011
                  add     r0, r0, r1
                  add     r0, r0, r2
                  add     r0, r0, r3
                  ldr     r8, =0x2000 ; Base address for data
                  str     r0, [r8]

                  mov     r0, #0x22000000
                  mov     r1, #0x00220000
                  mov     r2, #0x00003300
                  mov     r3, #0x00000033
                  add     r0, r0, r1
                  add     r0, r0, r2
                  add     r0, r0, r3
                  str     r0, [r8,#4]

                  mov     r0, #0x31000000
                  mov     r1, #0x00110000
                  mov     r2, #0x00001100
                  mov     r3, #0x00000011
                  add     r0, r0, r1
                  add     r0, r0, r2
                  add     r0, r0, r3
                  str     r0, [r8,#8]

                  mov     r0, #0x42000000
                  mov     r1, #0x00220000
                  mov     r2, #0x00003300
                  mov     r3, #0x00000033
                  add     r0, r0, r1
                  add     r0, r0, r2
                  add     r0, r0, r3
                  str     r0, [r8,#12]

                  mov     r0, #0x51000000
                  mov     r1, #0x00110000
                  mov     r2, #0x00001100
                  mov     r3, #0x00000011
                  add     r0, r0, r1
                  add     r0, r0, r2
                  add     r0, r0, r3
                  str     r0, [r8,#16]

                  mov     r0, #0x62000000
                  mov     r1, #0x00220000
                  mov     r2, #0x00003300
                  mov     r3, #0x00000033
                  add     r0, r0, r1
                  add     r0, r0, r2
                  add     r0, r0, r3
                  str     r0, [r8,#20]

                  mov     r0, #0x71000000
                  mov     r1, #0x00110000
                  mov     r2, #0x00001100
                  mov     r3, #0x00000011
                  add     r0, r0, r1
                  add     r0, r0, r2
                  add     r0, r0, r3
                  str     r0, [r8,#24]

                  mov     r0, #0x82000000
                  mov     r1, #0x00220000
                  mov     r2, #0x00003300
                  mov     r3, #0x00000033
                  add     r0, r0, r1
                  add     r0, r0, r2
                  add     r0, r0, r3
                  str     r0, [r8,#28]

                  mov     r0, #0x91000000
                  mov     r1, #0x00110000
                  mov     r2, #0x00001100
                  mov     r3, #0x00000011
                  add     r0, r0, r1
                  add     r0, r0, r2
                  add     r0, r0, r3
                  str     r0, [r8,#32]

                  mov     r0, #0xA2000000
                  mov     r1, #0x00220000
                  mov     r2, #0x00003300
                  mov     r3, #0x00000033
                  add     r0, r0, r1
                  add     r0, r0, r2
                  add     r0, r0, r3
                  str     r0, [r8,#36]

                  ;       --- Assignment Start ---

                  ;       Q1a. Sum all data (unsigned 64-bit)
                  ;       Result goes to 0x2100 (low 32-bit) and 0x2104 (high 32-bit for carry)
                  ;       r4: sum low part
                  ;       r5: sum high part (carry)
                  ;       r6: loop counter
                  ;       r7: current data item
                  ;       r8: data pointer

                  mov     r4, #0 ; Initialize sum (low)
                  mov     r5, #0 ; Initialize sum (high/carry)
                  mov     r6, #10 ; 10 items to sum
                  ldr     r8, =0x2000 ; Point to start of data

sum_loop          ;       Loop for summing
                  ldr     r7, [r8] ; Get data
                  adds    r4, r4, r7 ; Add to low sum, update flags for carry
                  adc     r5, r5, #0 ; Add carry to high sum
                  add     r8, r8, #4 ; Next data item
                  subs    r6, r6, #1 ; Decrement counter, update flags
                  bne     sum_loop ; Loop if not zero

                  ldr     r9, =0x2100 ; Destination for sum
                  str     r4, [r9] ; Store low 32-bits
                  str     r5, [r9,#4] ; Store high 32-bits

                  ;       Q1b. Find the largest value
                  ;       Result goes to 0x2150
                  ;       r4: largest value found
                  ;       r6: loop counter
                  ;       r7: current data item
                  ;       r8: data pointer

                  ldr     r8, =0x2000 ; Reset data pointer to start
                  ldr     r4, [r8] ; Assume first item is largest initially
                  add     r8, r8, #4 ; Move to second item
                  mov     r6, #9 ; Only 9 items left to check

find_largest_loop ;       Loop for finding largest
                  ldr     r7, [r8] ; Get current item
                  cmp     r7, r4 ; Compare with current largest
                  movgt   r4, r7 ; If current is greater, update largest
                  add     r8, r8, #4 ; Next data item
                  subs    r6, r6, #1 ; Decrement counter
                  bne     find_largest_loop ; Loop if not zero

                  ldr     r9, =0x2150 ; Destination for largest value
                  str     r4, [r9] ; Store the largest value

                  ;       --- Program End ---
                  ;       Infinite loop to stop execution in emulator
end_program_loop  
                  b       end_program_loop ; Loop forever