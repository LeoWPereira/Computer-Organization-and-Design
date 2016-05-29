addi $s0,$zero,0x10000000
addi $s1,$zero,1
addi $s2,$zero,0x1000FFFC # 1001000 = 1000FFFC + 4
adicionar:
sw $s1,0($s0)
addi $s1,$s1,1
addi $s0,$s0,4
bne $s0,$s2,adicionar

# Fim da escrita das 400 words

addi $s0,$zero,0x10000000
lw $s4,0($s0) # $s4 armazena o valor da atual posição de memória
add $s5,$zero,$s4 # $s5 armazena a soma total

somar:
addi $s0,$s0,4
lw $s4,0($s0)
add $s5,$s5,$s4
bne $s0,$s2,somar