.data
   str1: .asciiz "\n\tDigite um valor: "
.text

main: # Ponto de entrada
      li $v0,4      # Pede ao utilizador o valor N
      la $a0,str1
      syscall            
      
      li $v0,5
      syscall
                  
      addi $a0,$v0,0   # Valor lido fica em a0 ===== Igual ao move
      
      jal fact      # chama a funcao fact
      
      addi $a0,$v0,0   # Escreve o resultado
      li $v0,1      
      syscall
      
      li $v0,10      # Fim...
      syscall
 
fact:
      sub $sp,$sp,8   # Ajusta a stack para 2 items
      sw $ra, 4($sp)   # Guarda endereco de retorno na segunda posicao da pilha (Pilha e LIFO)
      sw $a0, 0($sp)   # Guarda argumento n
      
      slti $t0,$a0,1   # testa se n < 1
      beq $t0,$zero,L1   # Se n >= 1, vai fazer outra chamada
 
      li $v0,1      # Se nao for devolve 1
      add $sp,$sp,8   # libera o espaco da stack antes de
      jr $ra      # retornar
 
L1:   sub $a0,$a0,1   # Nova chamada: novo argumento (n - 1)
      jal fact      # chama fact com (n - 1)
 
      # Ponto de retorno da chamada recursiva:
      lw $a0, 0($sp)   # Recupera o argumento passado
      lw $ra, 4($sp)   # Recupera o endereco de retorno
 
      add $sp,$sp,8   # Liberta o espaco da stack
 
      mul $v0,$a0,$v0   # Calcula n * fact (n - 1)
      jr $ra            # Retorna com o resultado
