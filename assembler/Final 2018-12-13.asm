! Final 13-12-2018
		.begin
dir		.equ C500A120h
length		.equ 20
		.org 2048
		.macro push a
			add %r14, -4, %r14
			st a, %r14
		.endmacro
		.macro pop b
			ld %r14, b
			add %r14, 4, %r14
		.endmacro
		
		.macro read c
			ld %r1, c
		.endmacro
		
		sethi x, %r1
		srl %r1, 10, %r1
		!sethi %hi(x), %r1
		!addcc %r1, %lo(x), %r1
		add %r0, length, %r2
		sethi arreglo, %r5
		srl %r5, 10, %r5
loop:		!call lectura
		!pop %r3
		read %r3
		st %r3, %r5
		subcc %r2,1,%r2
		be fin
		ld %r5,4,%r5
		ba loop

fin:		halt

x:	1

lectura:	ld [%r1],%r4
		push %r4
		jmpl %r15+4, %r0

arreglo:	.dwb 20
		.end
