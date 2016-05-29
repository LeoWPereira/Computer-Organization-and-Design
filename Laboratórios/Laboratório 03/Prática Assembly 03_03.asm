Em Assembly, os saltos condicionais estão limitados para 8 bits (com sinal)

Endereços sempre "pulam" dem 4 em 4 bytes (32 bits)

Desta forma, os saltos conseguem alcançar distâncias de -128 bytes <- Posição da instrução atual -> + 127 bytes

Assim, podemos afirmar que a distância máxima de salto é de 127 bytes.

O pulo pode saltar no máximo 32 instruções!