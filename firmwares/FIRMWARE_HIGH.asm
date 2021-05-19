asect  0x00

# ldi r0, b0
# ldi r1, 0b11000000
# st r0, r1

# ldi r0, b1
# ldi r1, 0b11000000
# st r0, r1

# ldi r0, b8
# ldi r1, 0b10000000
# st r0, r1
# delete upper


ldi r1, 0
ldi r2, 1
ldi r3, 2
jsr check
ldi r1, 3
ldi r2, 4
ldi r3, 5
jsr check
ldi r1, 6
ldi r2, 7
ldi r3, 8
jsr check


ldi r1, 0
ldi r2, 3
ldi r3, 6
jsr check
ldi r1, 1
ldi r2, 4
ldi r3, 7
jsr check
ldi r1, 2
ldi r2, 5
ldi r3, 8
jsr check


ldi r1, 0
ldi r2, 4
ldi r3, 8
jsr check
ldi r1, 2
ldi r2, 4
ldi r3, 6
jsr check

ldi r3, 9
do	
	dec r3
	
	ldi r0, b0
	add r3, r0
	ld r0, r0
	
	if 
		tst r0
	is z
	then
		ldi r0, res
		st r0, r3
		halt
	fi	

	tst r3
until z

halt

check:
	ldi r0, b0
	add r1, r0
	ld r0, r0
	or r0, r1
	
	ldi r0, b0
	add r2, r0
	ld r0, r0
	or r0, r2
	
	ldi r0, b0
	add r3, r0
	ld r0, r0
	or r0, r3
	
	ldi r0, 0
	st r0, r1
	inc r0
	st r0, r2
	inc r0
	st r0, r3
	
	ldi r0, 0
	ldi r2, 3
	ldi r3, 0b01000000
	do 
		dec r2
		ld r2, r1
		if 
			and r3, r1
		is nz
		then
			inc r0
		fi
		tst r2
	until z
	
	if 
		ldi r1, 2
		cmp r0, r1
	is z
	then
		ldi r2, 3
		do 
			dec r2
			ld r2, r1
			if 
				ldi r3, 0b11000000
				and r1, r3
			is z
			then
				ldi r2, res
				st r2, r1
				halt
			fi
			tst r2
		until z
	fi
	
	rts
	
	
halt


asect  0xe0
inputs>
	b0:		ds 1
	b1:		ds 1
	b2:		ds 1
	b3:		ds 1
	b4:		ds 1
	b5:		ds 1
	b6:		ds 1
	b7:		ds 1
	b8:		ds 1
	
outputs>
	res:	ds 1
end