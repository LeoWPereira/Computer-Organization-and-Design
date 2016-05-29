.data
   str1: .asciiz "\n\tDigite um valor para a0: "
   str2: .asciiz "\n\tDigite um valor para a1: "
   str3: .asciiz "\n\tDigite um valor para a2: "
   str4: .asciiz "\n\t$a0 + cemseno(3*$a1) - cemseno(3*$a0) + $a2 * $a1 = "
.text

main:
	jal subrotina
	
	li $v0,10      # Fim...
        syscall

subrotina: 
	li $v0,4      # Escreve o texto para pedir um valor
      	la $a0,str1
      	syscall
      	
      	li $v0,5 # armazena o valor lido em $v0
     	syscall
     	move $t0,$v0 # variável x está armazenada em $s0
     	
     	li $v0,4      # Escreve o texto para pedir um valor
      	la $a0,str2
      	syscall
      	
      	li $v0,5 # armazena o valor lido em $v0
     	syscall
     	move $t1,$v0 # variável x está armazenada em $s1
     	
     	li $v0,4      # Escreve o texto para pedir um valor
      	la $a0,str3
      	syscall
      	
      	li $v0,5 # armazena o valor lido em $v0
     	syscall
     	move $t2,$v0 # variável x está armazenada em $s2
     	
     	add $t3,$zero,$zero # Resultado Final
     	
     	add $t3,$t3,$t0
     	
     	mulo $t4,$t2,$t1
     	add $t3,$t3,$t4 # Neste momento temos o valor de a0 + $a2 * $a1
     	
     	add $a0,$t1,$zero
     	mulo $a0,$a0,3
     	
     	sub $sp,$sp,20 # reserva espaço na stack para um dado
	sw $ra,0($sp) # guarda o $ra original no topo da pilha
	sw $t0,4($sp)
	sw $t1,8($sp)
	sw $t2,12($sp)
	sw $t3,16($sp) # Armazenamos todos os valores necessarios na pilha
     	
     	# Agora vamos calcular o valor de cemseno(3*$a1)
     	jal cemseno # armazena em $ra o endereço da próxima linha

	lw $t0,4($sp) # recupera o valor original da pilha
	lw $t1,8($sp) # recupera o valor original da pilha
	lw $t2,12($sp) # recupera o valor original da pilha
	lw $t3,16($sp) # recupera o valor original da pilha

	add $t3,$t3,$v0
	
	add $a0,$t0,$zero
     	mulo $a0,$a0,3

	sw $t0,4($sp)
	sw $t1,8($sp)
	sw $t2,12($sp)
	sw $t3,16($sp) # Armazenamos todos os valores necessarios na pilha - novamente

	# Agora vamos calcular o valor de cemseno(3*$a0)
     	jal cemseno # armazena em $ra o endereço da próxima linha
     	
     	lw $t0,4($sp) # recupera o valor original da pilha
	lw $t1,8($sp) # recupera o valor original da pilha
	lw $t2,12($sp) # recupera o valor original da pilha
	lw $t3,16($sp) # recupera o valor original da pilha

	sub $t3,$t3,$v0
	
	move $a0,$t3
	li $v0,1      
        syscall
      
      	lw $ra,0($sp) # recupera o valor original da pilha
        add $sp,$sp,20   # Liberta o espaco da stack
      
        jr $ra

cemseno: # Apenas para Teste ---------- Vai apagar todos os registradores temporarios e de parametros e retornar 100*$a0 
	add $v0,$zero,$a0
	
	addi $a0,$zero,1234
	addi $a1,$zero,1234
	addi $a2,$zero,1234
	addi $a3,$zero,1234

	addi $t0,$zero,1234
	addi $t1,$zero,1234
	addi $t2,$zero,1234
	addi $t3,$zero,1234
	addi $t4,$zero,1234
	addi $t5,$zero,1234
	addi $t6,$zero,1234
	addi $t7,$zero,1234
	addi $t8,$zero,1234
	addi $t9,$zero,1234

	mulo $v0,$v0,100

	jr $ra
