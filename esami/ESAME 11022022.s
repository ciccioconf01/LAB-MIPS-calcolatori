DIM = 6
.data
vetB: .byte 2, 14, 119, 54, 10, 41
vetN: .space DIM
 .text
 .globl main
 .ent main
main:
    subu $sp,$sp,4
    sw $ra,($sp)

    la $a0, vetB
    la $a1, vetN
    li $a2, DIM
    jal Cambio

    lw $ra,($sp)
    addiu $sp,$sp,4
    jr $ra
    
 .end main

.ent Cambio
 Cambio:
    move $t0,$a0  #indirizzo VetB
    move $t1,$a1  #indirizzo Vet risultato
    move $t2,$a2  #DIM

    li $t7,0  #contatoreParole

ciclo:
    lb $t3,($t0)
    
    li $t9,0 #contatoreTransizioni
    li $t8,0 #contatore cicli

cicloInterno:
    and $t4,$t3,1
    srl $t3,$t3,1
    and $t5,$t3,1

    addi $t8,$t8,1

    beq $t5,$t4, x
    addi $t9,$t9,1

x:

    bne $t8,7,cicloInterno

    sb $t9,($t1)
    addi $t1,$t1,1
    addi $t0,$t0,1
    addi $t7,$t7,1

    bne $t7,$t2,ciclo

    jr $ra

.end Cambio





