addi $s0,$zero,0x10000100
addi $s1,$zero,1
addi $s2,$zero,401
adicionar:
sw $s1,0($s0)
addi $s1,$s1,1
addi $s0,$s0,4
bne $s1,$s2,adicionar

# Fim da escrita das 400 words

addi $s0,$zero,0x10000100
addi $s1,$zero,0x10001100
addi $s3,$zero,1

swapAgain:
lw $s5,0($s1)
lw $s6,0($s0)
sw $s6,0($s1)
sw $s5,0($s0)

addi $s0,$s0,4
addi $s1,$s1,4
addi $s3,$s3,1
ble $s3,$s2,swapAgain