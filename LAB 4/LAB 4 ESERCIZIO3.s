.data
DIMMatrice = 64
vettoreRiga:    .word 1, 1, 1, 2
vettoreColonna: .word 2, 0, 1, 0 
matrice: .space DIMMatrice
.text
.globl main
.ent main

main:
    la $a0,vettoreRiga
    la $a1,vettoreColonna
    la $t5,matrice
    li $t2,0 #contatore righe
    
    move $t0,$a0

loopRiga:
    move $t1,$a1
    li $t3,0 #contatore colonne

loopColonna:
    lw $t6,($t0)
    lw $t7,($t1)
    mul $t4,$t6,$t7
    sw $t4,($t5)
    addi $t5,$t5,4
    addi $t1,$t1,4
    addi $t3,$t3,1
    bne $t3,4,loopColonna

    addi $t2,$t2,1
    addi $t0,$t0,4
    bne $t2,4,loopRiga

    li $v0,10
    syscall
