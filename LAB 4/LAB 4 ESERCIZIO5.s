.data
numeroRighe= 4
numeroColonne= 6
matrice: .word 154, 123, 109, 86, 4, 0, 412, -23, -231, 9, 50, 0, 123, -24, 12, 55, -45, 0, 0, 0, 0, 0, 0, 0
.text
.globl main
.ent main

main:
    la $a0, matrice
    li $t1,0 #contarighe
    
    move $t0,$a0

cicloRighe:
    li $t2,0 #contacolonne
    li $t3,0 #accumulatore
cicloColonne:
    lw $t4,($t0)
    add $t3,$t3,$t4
    addi $t0,$t0,4
    addi $t2,$t2,1
    bne $t2,numeroColonne,cicloColonne

    addi $t0,$t0,-4
    sw $t3,($t0)
    addi $t0,$t0,4
    addi $t1,$t1,1
    bne $t1,numeroRighe,cicloRighe


    la $a0, matrice
    li $t1,0 #contarighe
    li $t2,0 #contacolonne
    li $t3,0 #accumulatore
    

cicloColonne2:
    move $t0,$a0
    mul $t7,$t2,4
    add $t0,$t0,$t7
    li $t3,0

cicloRighe2:
    lw $t4,($t0)
    add $t3,$t3,$t4
    addi $t1,$t1,1
    addi $t0,$t0,24
    bne $t1,numeroRighe,cicloRighe2

    addi $t0,$t0,-24
    sw $t3, ($t0) 
    addi $t0,$t0,24
    li $t1,0
    addi $t2,$t2,1
    bne $t2,numeroColonne,cicloColonne2


    li $v0,10
    syscall

.end main
