! Guia 6, ejercicio 9, parametros por area reservada en memoria
	.begin
	.org 2048
	ld [x], %r1
	ld [y], %r2
	st %r1, [param]
	st %r2, [param+4]
	sethi param, %r5
	srl %r5, 10, %r5
	call suma
	ld [param+8], %r3
	st %r3, [z]
	halt

x:	1
y:	2
z:	0

suma:	ld %r5, %r8
	ld %r5 + 4, %r9
	addcc %r8, %r9, %r10
	st %r10, %r5+8
	jmpl %r15+4, %r0

param:	.dwb 3
	.end
