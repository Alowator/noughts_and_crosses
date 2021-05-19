asect  0x00

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