! Guia 6, ejercicio 20
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
		push %r1
		call contador
		pop %r20	
		halt

contador:	pop %r2
		addcc %r0, %r0, %r3		! Acumulador
		ld [y], %r4			! Decrementador
		addcc %r0, 1, %r5		! Mascara
loop:		addcc %r4, -1, %r4
		bneg done
		andcc %r5, %r2, %r0
		bne sumo
		ba sigo
sumo:		addcc %r6, 1, %r6
sigo:		addcc %r5, %r5, %r5
		ba loop
done:		push %r6
		jmpl %r15+4, %r0
		
x:		0x88888888
y:		32
		.end
