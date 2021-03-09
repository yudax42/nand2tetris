// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

(FOREVER) // PROGRAM LOOP
	@SCREEN
	D=A

	@addr // register to track the value of current pixel
	M=D 
	
	@KBD // check if the key is pressed
	D=M
	
	@WHITE // go to change the color in register to white
	D;JEQ

	@BLACK // go to change the color in register to black
	D;JNE	

	(BLACK)	// change the color to black
		@color
		M=-1 // -1 : 111111111111111 to draw black pixel
		@DRAW // jump to draw to preven from (WHITE) that change color to white
		0;JMP

	(WHITE) // change color to white
		@color
		M=0
		
	(DRAW) // loop drawing 
		@24576 // startAddressofScreenRegister + screenRows * totalregister in the row -> 16384 + 256 * 32
		D=A
		@addr
		D=M-D // check if the addr is less than total screen available memroy 
		@FOREVER // when it's completed drawing go to the top loop
		D;JGT
				
		@color // find the color value
		D=M
		
		@addr // change the value of the pixel register
		A=M 
		M=D

		@addr // increment the counter
		M=M+1 
		@DRAW // loop to draw next pixel
		0;JMP
	
