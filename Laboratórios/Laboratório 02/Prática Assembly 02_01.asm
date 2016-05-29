addi $s1,$zero,-1
addi $s2,$zero,-10
	
addi $s4,$zero,32	
	
sub $s2,$s2,$s4 # para utilizarmos apenas os comandos básicos

bgez $s1,s1MaiorOuIgualAZero
bltz $s1,s1MenorQueZero
s1MaiorOuIgualAZero:
	bgtz $s2,s2Maior32_1
	beq $s2,$zero,s2Igual32_1
	bltz $s2,s2Menor32_1
s1MenorQueZero:
	bgtz $s2,s2Maior32_2
	beq $s2,$zero,s2Igual32_2
	bltz $s2,s2Menor32_2
s2Maior32_1:
	addi $s3,$zero,1
	bgtz $s2,fim
s2Igual32_1:
	addi $s3,$zero,2
	beq $s2,$zero,fim
s2Menor32_1:
	addi $s3,$zero,3
	bltz $s2,fim
s2Maior32_2:
	addi $s3,$zero,4
	bgtz $s2,fim
s2Igual32_2:
	addi $s3,$zero,5
	beq $s2,$zero,fim
s2Menor32_2:
	addi $s3,$zero,6
	bltz $s2,fim
fim: