asect  0x00

ldi r0, byte0
ld r0, r0

ldi r3, 0
ldi r1, 0b11000000
while 
	ldi r2, 9
	cmp r2, r3
stays nz
	
	if 
		ldi r2, 4
		cmp r2, r3
	is z
	then
		ldi r0, byte1
		ld r0, r0
		ldi r1, 0b11000000
	fi
	if 
		ldi r2, 8
		cmp r2, r3
	is z
	then
		ldi r0, byte2
		ld r0, r0
		ldi r1, 0b11000000
	fi

	move r1, r2
	and r0, r2
	
	if 
		tst r2
	is z 
	then 
		ldi r2, res
		st r2, r3 
		halt		
	fi	

	shr r1
	shr r1
	inc r3
wend

halt

asect  0xf0
inputs>
	byte0:		ds 1
	byte1:		ds 1
	byte2:		ds 1
outputs>
	res:		ds 1
end