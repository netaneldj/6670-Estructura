		.begin
dir		.equ 9FAf0000h
bit28		.equ 10000000h
		.org 2048
		.macro push a
			add %r14, -4, %r14
			st a, %r14
		.endmacro
		.macro pop b
			ld %r14, b
			add %r14, 4, %r14
		.endmacro
		sethi %hi(dir), %r1
loop:		ld %r1, %r2
		ld %r1+4, %r3
		ld %r1+8, %r4
		push %r15
		push %r2
		push %r3
		push %r4
		call verif
		pop %r10
		pop %r15
		addcc %r10, %r10, %r0
		be loop
		halt

		.org 3048
verif:		sethi %hi(bit28), %r5
		pop %r6
		pop %r7
		pop %r8
		andcc %r5, %r6, %r0
		be mal
		andcc %r5, %r7, %r0
		be mal
		andcc %r5, %r8, %r0
		be mal
		add %r0, %r0, %r9
		ba fin
mal:		add %r0, 1, %r9
fin:		push %r9
		jmpl %r15+4, %r0
		.end
