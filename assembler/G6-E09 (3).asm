! Guia 6, ejercicio 9, parametros por stack
	.begin
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
	call suma
	pop %r3
	st %r3, [z]
	halt
	
suma:	pop %r4
	pop %r5
	addcc %r4, %r5, %r3
	push %r3
	jmpl %r15+4, %r0

x:	1
y:	2
z:	0

	.end
