	.begin
dir	.equ B0100000h
num	.equ FFFFFFFFh
start	.equ 3000
	.org 2048
	.macro push a
		addcc %r14, -4, %r14
		st a, %r14
	.endmacro
	.macro pop b
		ld %r14, b
		addcc %r14, 4, %r14
	.endmacro

	add %r0, start, %r18
	push %r18
	call prom
	pop %r19
	halt

prom:	pop %r1
	add %r0, %r0, %r2
	add %r0, 8, %r3
loop:	addcc %r3, -1, %r3
	bneg fin
	ld %r1, %r4
	addcc %r2, %r4, %r2
	bvs fueraDeRango
	!bcs fueraDeRango
	addcc %r1, 4, %r1
	ba loop

fueraDeRango:	push %r15
		call fueraDeRango2
		pop %r15
		push %r0
		jmpl %r15+4, %r0

fin:	sra %r2, 3, %r2
	push %r2
	jmpl %r15+4, %r0

fueraDeRango2:sethi %hi(dir), %r20
		addcc %r20, %lo(dir), %r20
		sethi %hi(num), %r21
		addcc %r21, %lo(num), %r21
		st %r21, %r20
		jmpl %r15+4, %r0

	.org start
	-1
	-2
	-3
	-2147483648
	5
	6
	7
	8

	.end
