! Guia 6, ejercicio 9, parametros por registro
	.begin
	.org 2048
	ld [x], %r1
	ld [y], %r2
	call suma
	st %r3, [z]
	halt

suma:	addcc %r1, %r2, %r3
	jmpl %r15+4, %r0

x:	1
y:	2
z:	0
	.end
