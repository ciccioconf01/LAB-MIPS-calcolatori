.data 
messaggio: .asciiz "la matrice e' diagonale"
messaggio2: .asciiz "la matrice non e' simmetrica"
messaggio3: .asciiz "la matrice e' simmetrica"
DIM = 5
DIMmenoUno = 4

matrice:    .word 1, 0, 0, 0, 0
            .word 0, 2, 0, 1, 0
            .word 0, 0, 3, 0, 0
            .word 0, 1, 0, 4, 0
            .word 0, 0, 0, 0, 5

.text
.globl main
.ent main

main:
    la $t0,matrice
    li $t3,0 #contatoreriga

loopRighe:

    li $t2,0 #contatorecolonna
loopColonne:
    
    beq $t2,$t3,saltacontrollo
    lw $t1,($t0)
    bne $t1,0,noDiag

saltacontrollo:

    addi $t0,$t0,4
    addi $t2,$t2,1
    bne $t2,DIM,loopColonne

    addi $t3,$t3,1
    bne $t3,DIM,loopRighe

    la $a0,messaggio
    li $v0,4
    syscall
    j fine

noDiag:

    la $t0,matrice
    li $t3,0 #contatoreriga

loopRighe2:

    li $t2,0 #contatorecolonna
    move $t2,$t3
    mul $t4,$t3,4
    add $t0,$t0,$t4

loopColonne2:
    
    beq $t2,$t3,saltacontrollo2
    lw $t1,($t0)
    sub $t6,$t2,$t3
    mul $t6,$t6,DIMmenoUno
    mul $t6,$t6,4
    add $t5,$t0,$t6
    lw $t7,($t5)

    bne $t7,$t1,noSimm

saltacontrollo2:

    addi $t0,$t0,4
    addi $t2,$t2,1
    bne $t2,DIM,loopColonne2

    addi $t3,$t3,1
    bne $t3,DIM,loopRighe2

    la $a0, messaggio3
    li $v0,4
    syscall
    j fine

noSimm:
    la $a0, messaggio2
    li $v0,4
    syscall

fine:
    li $v0,10
    syscall

.end main

