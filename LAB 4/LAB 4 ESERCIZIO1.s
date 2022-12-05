.data
NUM_ELEM = 20
DIM = NUM_ELEM * 4
vettore: .space DIM
.text
.globl main
.ent main

main:
    
    li $t0,1
    li $t1,1
    la $t2,vettore
    sw $t0,0($t2)
    sw $t1,4($t2)

    addi $t2,$t2,4
    add $t2,$t2,4

    li $t7,2 #contatore
loop:
    addi $t2,$t2,-4
    lw $t3,($t2)
    addi $t2,$t2,-4
    lw $t4,($t2)
    add $t5,$t4,$t3
    addi $t2,$t2,8
    sw $t5,($t2)
    addi $t2,$t2,4
    
    addi $t7,$t7,1
    bne $t7,NUM_ELEM,loop

    li $v0,10
    syscall

.end main


    