.data
   str1: .asciiz "\n\tDigite um valor para x: "
   str2: .asciiz "\n\ty = 3*x^5 + 2*x^3 -6*x = "
.text

main: 
	li $v0,4      # Escreve o texto para pedir um valor
      	la $a0,str1
      	syscall
      	
      	li $v0,5 # armazena o valor lido em $v0
     	syscall
     	move $a0,$v0 # variável x está armazenada em $a0
     	
     	jal calcula # armazena em $ra o endereço da próxima linha
     	
     	add $a0,$v0,$zero
     	
     	jal imprimeResultado
     	
     	li $v0,10      
        syscall
     	
calcula:
	sub $sp,$sp,12 # reserva espaço na stack para um dado
	sw $ra,0($sp) # guarda o $ra original no topo da pilha
	
	add $t1,$zero,$zero # resultado final
	sw $t1,4($sp)
	
	addi $t2,$zero,5 # potêncial atual (5, 3, 1)
	add $a1,$t2,$zero
	sw $t2,8($sp)
	jal pow
	
	lw $t1,4($sp) # recupera o valor original da pilha
	lw $t2,8($sp) # recupera o valor original da pilha
	
	add $t1,$t1,$v0
	mulo $t1,$t1,3
	
	sub $t2,$t2,2
	
	sw $t1,4($sp)
	sw $t2,8($sp)
	add $a1,$t2,$zero
	
	jal pow
	
	lw $t1,4($sp) # recupera o valor original da pilha
	lw $t2,8($sp) # recupera o valor original da pilha
	
	add $t5,$zero,$v0
	mulo $t5,$t5,2
	add $t1,$t1,$t5
	
	mulo $t5,$a0,-6
	add $t1,$t1,$t5 # aqui encontramos o resultado da equação y = 3x^5 + 2x^3 - 6x
	
	add $v0,$t1,$zero
	
	lw $ra,0($sp) # recupera o valor original da pilha
	addi $sp,$sp,12 # libera o espaço reservado para o $ra
	
	jr $ra # pula para o primeiro $ra, imprimeResultado

pow:
	add $t3,$a1,$zero
	addi $v0,$zero,1 # valor da potência
	
loop:	mulo $v0, $v0,$a0
	sub $t3,$t3,1
	bgtz $t3,loop
	
	jr $ra

imprimeResultado:
	add $t0,$a0,$zero

	li $v0,4
      	la $a0,str2
      	syscall

	li $v0,1
      	add $a0,$t0,$zero
      	syscall
	
	jr $ra
