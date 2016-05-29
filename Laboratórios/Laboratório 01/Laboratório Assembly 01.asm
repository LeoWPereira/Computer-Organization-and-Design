    addi $s0,$zero,1  #$variavel i
    addi $s1,$zero,21
    addi $s3,$zero,0 #somatoria do quadrado - resultado final
    addi $s5,$zero,0
    bne $s0, $s1, somatoria
somatoria:
           add $s4,$zero,$s0 #receber do i
           addi $s5,$zero,0
    bne $s4,$zero,quadrado
quadrado:
    add $s5,$s5,$s0
    addi $s4,$s4,-1
    bne $s4, $zero, quadrado

    add $s3,$s3,$s5
   
    addi $s0, $s0, 1
    bne $s0, $s1 , somatoria