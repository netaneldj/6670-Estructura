! Guia 6, ejercicio 19
		.begin
ByteACambiar	.equ 0x00FF0000
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
		call intercambio
		pop %r2
		pop %r1	
		halt

intercambio:	pop %r3					! y
		pop %r4					! x
		sethi %hi(ByteACambiar), %r10
		addcc %r10, %lo(ByteACambiar), %r10
		and %r3, %r10, %r5
		and %r4, %r10, %r6
		andn %r3, %r10, %r3
		andn %r4, %r10, %r4
		addcc %r3, %r6, %r3
		addcc %r4, %r5, %r4
		push %r4					! x cambiado
		push %r3					! y cambiado
		jmpl %r15+4, %r0
		
x:		0x11111111
y:		0x22222222
		.end
