addi $s0,$zero,0x10001234
addi $s1,$zero,1
addi $s2,$zero,1001
adicionar:
sw $s1,0($s0)
addi $s1,$s1,1
addi $s0,$s0,4
bne $s1,$s2,adicionar