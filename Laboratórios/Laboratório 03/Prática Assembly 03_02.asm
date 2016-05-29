start:
j final
beq $zero,$zero,final
la $t6,final
jr $t6
final:
bne $0,$0,final


# j final = 000010 00000100000000000000000101
#	   opcode     endereço de destino

# beq $zero,$zero,final = 000100 00000 00000 0000000000000011
#			  opcode   rs    rt      immediate

# la $t6,final = 001111 0000000001  0000000001000000
#		 001101 00001 01110 0000000000010100
#		 opcode  rs    rt     immediate
# como la lê um endereço de até 32 bits (o que é o caso) temos que separar em dois outros comandos lui e ori

# jr $t6 = 000000 01110000000000000000001000
#	   opcode     endereço de destino

# bne $0,$0,final = 000101  00000   00000    1111111111111111
#		    opcode rs($s0) rt($s0)      immediate
