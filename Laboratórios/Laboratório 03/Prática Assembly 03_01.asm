.data
valores: .word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
frase: .asciiz "Digite um valor de 32 bits: "

.text
la $s0,valores # carrega o endereço dos dados em $s5

addi $s1,$zero,0
addi $s2,$zero,20

leituraDeDados:
li $v0,4
la $a0,frase
syscall   

li $v0,5
syscall
sw $v0,0($s0)

addi $s0,$s0,4
addi $s1,$s1,1
bne $s1,$s2,leituraDeDados

# Fim da leitura de dados

escritaDeDados:
subi $s0,$s0,4

li $v0,1
lw $a0,0($s0)
syscall

subi $s2,$s2,1
bne $s2,$zero,escritaDeDados
