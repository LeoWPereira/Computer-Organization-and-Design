addi $s0,$zero,0x10010000
addi $s1,$zero,3
sw $s1,0($s0)

addi $s0,$s0,4
addi $s1,$zero,2
sw $s1,0($s0)

addi $s0,$s0,4
addi $s1,$zero,12
sw $s1,0($s0)

addi $s0,$s0,4
addi $s1,$zero,8
sw $s1,0($s0)

addi $s0,$s0,4
addi $s1,$zero,5
sw $s1,0($s0)

addi $s0,$s0,4
addi $s1,$zero,14
sw $s1,0($s0)

addi $s0,$s0,4
addi $s1,$zero,19
sw $s1,0($s0)

addi $s0,$s0,4
addi $s1,$zero,1
sw $s1,0($s0)

addi $s0,$s0,4
addi $s1,$zero,4
sw $s1,0($s0)

addi $s0,$s0,4
addi $s1,$zero,10
sw $s1,0($s0)

addi $s0,$s0,4
addi $s1,$zero,18
sw $s1,0($s0)

addi $s0,$s0,4
addi $s1,$zero,17
sw $s1,0($s0)

addi $s0,$s0,4
addi $s1,$zero,13
sw $s1,0($s0)

addi $s0,$s0,4
addi $s1,$zero,9
sw $s1,0($s0)

addi $s0,$s0,4
addi $s1,$zero,7
sw $s1,0($s0)

addi $s0,$s0,4
addi $s1,$zero,16
sw $s1,0($s0)

addi $s0,$s0,4
addi $s1,$zero,6
sw $s1,0($s0)

addi $s0,$s0,4
addi $s1,$zero,15
sw $s1,0($s0)

addi $s0,$s0,4
addi $s1,$zero,11
sw $s1,0($s0)

addi $s0,$s0,4
addi $s1,$zero,20
sw $s1,0($s0)
# Fim da escrita dos 20 valores

addi $s0,$zero,0x10010000 # Ponteiro apontando para a primeira posição de memória
addi $s1,$s0,76 # Ponteiro apontando para a última posição de memória

incrementaS0:
	addi $s2,$s0,0 # Ponteiro apontando para a  posição de memória $s0 e incrementando (até alcançar $s1)
	add $s3,$s2,$zero # Posição do menor valor do vetor (a partir de $s2)
	lw $s5,0($s0) # Lê o valor de $s0 e armazena em $s5

	bne $s2,$s1,buscaMenorValor

buscaMenorValor:
	addi $s2,$s2,4
	lw $s6,0($s2)
	bgt $s5,$s6,swap
	bne $s2,$s1,buscaMenorValor
	beq $s2,$s1,substituiValores
		
swap:
	add $s5,$zero,$s6
	add $s3,$s2,$zero # armazena a posiçào de memória do menor valor do vetor
	bgt $s5,$s6,swap
	beq $s2,$s1,substituiValores
	ble $s5,$s6,buscaMenorValor
	
substituiValores:	
	lw $s6,0($s0)
	sw $s5,0($s0)
	sw $s6,0($s3)
	
	addi $s0, $s0, 4
	bne $s0,$s1,incrementaS0