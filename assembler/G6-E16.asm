! Guia 6, ejercicio 16
		.begin
length		.equ 10
address	.equ 3000
		.org 2048
		.macro push a
			addcc %r14, -4, %r14
			st a, %r14
		.endmacro
		.macro pop b
			ld %r14, b
			addcc %r14, 4, %r14
		.endmacro
		add %r0, length, %r1
		add %r0, address, %r2
		push %r1		! Largo
		push %r2		! Donde empieza
		call maxmin
		pop %r12		! Maximo
		pop %r11		! Minimo
		halt
	
maxmin:	pop %r4		! Donde empieza
		pop %r5		! Largo
		ld %r4, %r21		! Pongo como minimo el primer elemento
		ld %r4, %r22		! Pongo como maximo el primer elemento
loop:		addcc %r5, -1, %r5
		bneg done
		ld %r4, %r26
		subcc %r22, %r26, %r0
		bneg cambioMax
		ba sigo1
cambioMax:	addcc %r26, %r0, %r22
sigo1:		subcc %r26, %r21, %r0
		bneg cambioMin
		ba sigo2
cambioMin:	addcc %r26, %r0, %r21
sigo2:		addcc %r4, 4, %r4
		ba loop

done:		push %r21		! Minimo
		push %r22		! Maximo
		jmpl %r15+4, %r0

		.org address
		-1
		6
		-15
		12
		14
		-30
		15
		10
		-30
		20
		.end
