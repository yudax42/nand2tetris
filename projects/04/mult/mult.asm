@R0
D=M

@v
M=0

@ZERO
D;JEQ

@add
M=D

@R1
D=M

@ZERO
D;JEQ

@loopcount
M=D

@i
M=1

(LOOP)
	@i
	D=M
	@loopcount
	D=D-M
	@STOP
	D;JGT
	
	@add
	D=M
	@v
	M=M+D
	
	@i
	M=M+1

	@LOOP
	0;JMP		


(ZERO)
	@R2
	M=0
	@END
	0;JMP

(STOP)
	@v
	D=M
	@R2
	M=D

(END)
	@END
	0;JMP
