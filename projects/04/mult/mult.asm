// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.


@R0
D=M // Get the value of r0

@ZERO // go to zero if the value of R0 is 0 because x * 0 = 0
D;JEQ

@v // this register will be used to accumulate the addition of R0
M=0

@R1 // get the value of r1
D=M

@ZERO
D;JEQ

@loopcount // this register will be use to find addition loop count
M=D

@i // this register will be used to track current value of the loop cout
M=1

(LOOP)
	@i // getting the value of i
	D=M
	@loopcount // loop condition check if i - r1 > 0 to stop the loop
	D=D-M
	@STOP // go to stop when the loop is finished
	D;JGT
	
	@R0 // geeting the value of R0
	D=M
	@v // reassign the new value of the addition of R0 + the old value of v
	M=M+D
	
	@i // increment the counter
	M=M+1

	@LOOP // go to the loop
	0;JMP		


(ZERO) // this label used to assing r2 = 0 if r1 = 0 or r0 = 0
	@R2
	M=0
	@END // we jump here to the end to not continue the program and assing again the value of v to register r2
	0;JMP

(STOP) // when we finish counting we jump from the loop to here and assign the value of v to R2 register
	@v
	D=M
	@R2
	M=D

(END) // End loop 
	@END
	0;JMP
