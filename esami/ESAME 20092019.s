   .data
vet: .word 15, 64, 9, 2, 4, 5, 9, 1, 294, 52, -4, 5
.text 
.globl main
.ent main

main: 
    subu $sp, $sp, 4
    sw $ra, 0($sp)

    la $a0, vet 
    li $a1, 12 

    jal monotono

    move $a0,$v0
    li $v0,1
    syscall

    li $a0,'\n'
    li $v0,11
    syscall

    move $a0,$v1
    li $v0,1
    syscall

    lw $ra, 0($sp)
    addiu $sp, $sp, 4
    jr $ra 

.end main

monotono:
    move $t0,$a0 # indirizzo vet
    move $t1,$a1 # dimensioni vet

    li $t2,0 # contatore interno vet

    li $t4,0 # contatore 
    li $t5,0 # valore piu' alto

    li $t6,0 # massimo

    ciclo:
    lw $t3,($t0)
    blt $t3,$t5,riparti
    addi $t4,$t4,1
    add $t5,$0,$t3
    j salto

riparti:
    blt $t4,$t6,salto
    add $t6,$0,$t4
    li $t4,0
    li $t5,0

    sub $t8,$t2,$t6   #indice di partenza

salto:
    addi $t2,$t2,1
    addi $t0,$t0,4
    bne $t2,$t1,ciclo

    move $v0,$t6
    move $v1,$t8
    jr $ra





