.data
vettoreRiga:        .word 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
vettoreColonna:     .word 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
matrice:            .space 400
.text
.globl main
.ent main

main:
    la $a0,vettoreRiga
    la $a1,vettoreColonna
    la $t2,matrice
    li $t3,0  #contatore riga
    

cicloRiga:
    move $t7,$a1
    li $t4,0  #contatore colonna

cicloColonna:
    lw $t0,($a0)
    lw $t1,($t7)
    mul $t5,$t0,$t1
    sw $t5,($t2)
    addi $t2,$t2,4
    addi $t7,$t7,4
    addi $t4,$t4,1
    bne $t4,10,cicloColonna

    addi $t3,$t3,1
    addi $a0,$a0,4
    bne $t3,10,cicloRiga

    li $v0,10
    syscall

.end main