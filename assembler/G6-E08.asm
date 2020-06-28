! Guia 6, ejercicio 8
	.begin
	.org 2048
	ld [x], %r1
	ld [y], %r2
	add %r2, %r0, %r3
	add %r1, %r0, %r2
	add %r3, %r0, %r1
	st %r1, [x]
	st %r2, [y]
	halt

x:	0xFFFFFFFF
y:	0xEEEEEEEE
	
	.end

