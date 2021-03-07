@R0
D=M

@n
M=D

@R1
D=M

@v
M=D

@i
M=1

(LOOP)
	@i
	D=M
	@n
	D=D-M
	@STOP
	D;JEQ
	
	@n
	D = M

	@v
	M=M+D

	@i
	M=M+1

	@LOOP
	0;JMP

(STOP)
	@v
	D=M
	@R2
	M=D

(END)
	@END
	0;JMP
