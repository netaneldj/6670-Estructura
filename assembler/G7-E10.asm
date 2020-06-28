! Guia 7, ejercicio 10
	.begin
	.org 2048
	ld [x], %r1
	ld [y], %r2
	subcc %r1, %r2, %r0
	bneg xMin
	ba yMin
xMin:	addcc %r0, %r1, %r3
	ba fin
yMin:	addcc %r0, %r2, %r3
fin:	halt
x:	8
y:	5
	.end
