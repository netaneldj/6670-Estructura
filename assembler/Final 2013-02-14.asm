	.begin
dir	.equ 9A0000h
	.org 2048
	.macro push a
		addcc %r14, -4, %r14
		st a, %r14
	.endmacro
	.macro pop b
		ld %r14, b
		addcc %r14, 4, %r14
	.endmacro
	ld [x], %r1
	ld [y], %r2
	push %r1
	push %r2
	call subrut
	pop %r7
	halt

subrut:pop %r3
	pop %r4
	addcc %r3, %r4, %r0
	bvs NO
	push %r0
	jmpl %r15+4, %r0

NO:	add %r0, 1, %r10
	add %r0, 12, %r11
	sethi %hi(dir), %r13
loop:	addcc %r11, -1, %r11
	bneg fin
	st %r0, %r13
	addcc %r13, 4, %r13
	ba loop
fin:	push %r10
	jmpl %r15+4, %r0

x:	-15
y:	-7
	.end
