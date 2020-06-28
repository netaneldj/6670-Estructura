! Guia 6, ejercicio 17
		.begin
length		.equ 3
address	.equ 3000
LSB		.equ 1
posicion	.equ 0xA0100000
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
		call suma
		pop %r12		! Par o impar
		halt
	
suma:		pop %r4		! Donde empieza
		pop %r9		! Largo original
		addcc %r0, %r9, %r7	! Largo para cambiar en el primer while
		addcc %r0, %r0, %r6	! Acumulador
loop1:		addcc %r7, -1, %r7
		bneg done
		addcc %r0, %r9, %r5	! Largo para cambiar en el segundo while
loop2:		addcc %r5, -1, %r5
		bneg loop1
		ld %r4, %r26
		addcc %r26, %r6, %r6
		bcs fueraDeRango
		addcc %r4, 4, %r4
		ba loop2
done:		andcc %r6, LSB, %r0
		be esPar
		ba esImpar
esImpar:	addcc %r0, 1, %r8
		ba enviar
fueraDeRango:	addcc %r0, -1, %r13
		sethi %hi(posicion), %r17
		addcc %r17, %lo(posicion), %r17
		st %r13, %r17
esPar:		addcc %r0, %r0, %r8
enviar:	push %r8
		jmpl %r15+4, %r0

		.org address
		
		1
		2
		3
		4
		5
		6
		7
		8
		9
		.end
