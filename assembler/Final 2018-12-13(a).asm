!C500A120h = 	1100	0101	0000	0000	1010	0001	0010	0000
	
	.org 2048
x:	.dwb 20

.macro 	pop x
	ld %r14,x
	add %r14,4,%r14
.endmacro

leer_periferico:		!guarda el dato en la pila
			!usa registro 10 y 11

	sethi 11000101000000000101000,%r10
	or %r10,0100100000,%r10
	ld %r10,%r11
	st %r11,%r14
	jmpl %r14+4,%r0


main:	
	add %r0,x,%r1	!puntero a la posicion del siguiente elemento a guardar
	add %r1,80,%r2	!puntero a el siguiente de la ultima posicion del puntero

for:	
	subcc %r1,%r2,%r0
	be terminar
	ba leer
leer:
	call leer_periferico
	pop %r3

	st %r3,%r1	!guarda en vector
	
	add %r1,4,%r1	!aumenta el puntero del siguiente elemento a guardar
	ba for
