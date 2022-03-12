// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// Put your code here.

	// i = R1
	@R1
	D = M
	@i
	M = D

	// res = 0
	@res
	M = 0

(LOOP)
	@i
	D=M

	@RESULT
	D;JEQ //i==0 -> end loop

	@i
	M=D-1 //i=i-1

	//res = res + R0
	@res
	D = M
	@R0
	D = D + M
	@res
	M = D
	
	@LOOP
	0;JMP
		
	

(RESULT)
	// put result in R2
	@res
	D = M
	@R2
	M = D
(END)
	@END
	0;JMP

	
