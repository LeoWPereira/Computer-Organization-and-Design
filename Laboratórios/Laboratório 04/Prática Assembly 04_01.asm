.data
   str1: .asciiz "\n\tDigite um valor valido: "
   str2: .asciiz "\n\Valor invalido!"
   str3: .asciiz "\n\Valor em Fahrenheit: "
.text

main: 
	li $v0,4      # Escreve o texto para pedir um valor
      	la $a0,str1
      	syscall
      	
      	li $v0,5 # armazena o valor lido em $v0
     	syscall
     	move $a0,$v0
     	
     	add $s0,$a0,$zero
     	
     	jal verificaValidade # armazena em $ra o endereco da proxima linha
     	
     	add $a0,$s0,$zero
     	
     	jal converte
     	
     	li $v0,10      
        syscall

converte:
	div $t0,$a0,5
      	mulo $t0,$t0,9
      	addi $t0,$t0,32
      	
      	li $v0,4
      	la $a0,str3
      	syscall
      	
      	li $v0,1
      	add $a0,$t0,$zero
      	syscall

	jr $ra
	
verificaValidade:
	addi $v0,$a0,273
	bltz $v0,valorInvalido
	jr $ra
valorInvalido:
	li $v0,4
      	la $a0,str2
      	syscall
	
	j main
