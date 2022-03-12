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

(INFINITE)

	// read keyboard register
	@KBD
	D = M

	@WHITE
	D; JEQ // whiten screen if keyboard register is 0 (no key pressed)

	@BLACK
	0; JMP // Make screen black otherwise (keyboard register != 0)	 

(WHITE)
	@8192
	D = A // D = 8192
	@i
	M = D //8192 == (256*512)/16 (number of rows in the memory map)

	@addr // pointer to loop over registers of screen memory map
	M = 0

	@WRITEWHITE
	0;JMP

(BLACK)
	@8192
	D = A
	@i
	M = D
	
	@addr
	M = 0
	
	@WRITEBLACK
	0;JMP

(WRITEWHITE)

	@i
	D = M
	@INFINITE
	D;JEQ // if i == 0; return infinite

	@i
	M = M - 1
	
	@SCREEN
	D = A
	@addr
	D = D + M
	A = D
	M = 0

	@addr
	M = M + 1

	@WRITEWHITE
	0;JMP


(WRITEBLACK)

	@i
	D = M
	@INFINITE
	D;JEQ // if i == 0; return infinite
	
	@i
	M = M - 1

	@SCREEN
	D = A
	@addr
	D = D + M
	A = D
	M = -1
	
	@addr
	M = M + 1

	@WRITEBLACK
	0;JMP
	

