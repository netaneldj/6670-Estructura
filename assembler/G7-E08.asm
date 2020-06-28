! Guia 7, ejercicio 8
	.begin
	.org 2048
	ld [x], %r1			! Multiplicando
	ld [y], %r2			! Multiplicador
	addcc %r0, 0, %r3		! i
	addcc %r0, 1, %r4		! Mascara
	addcc %r0, %r0, %r5		! Resultado
	ld [i], %r6			! Decremento
loop:	addcc %r6, -1, %r6
	bneg done
	sll %r4, %r3, %r7 
	andcc %r2, %r7, %r0
	bne sumar
	ba fin
sumar:	sll %r1, %r3, %r8
	addcc %r5, %r8, %r5
fin:	addcc %r3, 1, %r3
	ba loop	
done:	halt

x:	-5
y:	6
i:	8
	.end
