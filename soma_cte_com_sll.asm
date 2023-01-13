 
.text				 
	.globl	main	

main:
		xor 	$t0,$t0,$t0			# zera o 'i'

		la	$t1, n 
		lw	$t1, 0($t1)			
		sll	$t1, $t1, 2				# carrega 'n' e multiplica por 4

		la 	$t2, a					# get address of a  
		la 	$t3, b					# get address of b 

loop:		add 	$t4,$t3,$t0	 	# endereço de b[i]
		lw 	$t4, 0($t4)				# load b[i]

		addi 	$t4,$t4,10			# calcula b[i]=b[i]+10

		add 	$t5,$t2,$t0			# endereço de a[i]
		sw 	$t4,0($t5)				# armazena em a[i]

		addi 	$t0,$t0,4			# increment i (+4 pois é word)
		blt 	$t0,$t1,loop		# loop if post-test succeeds

end:	j	end

.data
n:	.word	5
a:	.word	  0x0   0x0   0x0   0x0   0x0
b:	.word	0x300 0x400 0x500 0x600 0x700