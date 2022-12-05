.data
matrice:    .word 1, 0, 0
            .word 0, 5, 0
            .word 0, 0, 10

.text
.globl main
.ent main

main:
subu $sp,$sp,4
sw $ra,($sp)

la $t0,matrice
lw $a0,0($t0)
lw $a1,4($t0)
lw $a2,8($t0)
lw $a3,12($t0)

li $t2,0 #contatore ciclo

ciclo:

    lw $t1,16($t0)
    subu $sp,$sp,4
    sw $t1,($sp)
    addi $t2,$t2,1
    addi $t0,$t0,4
    bne $t2,5, ciclo

jal determinante3x3
move $a0,$v0
li $v0,1
syscall

lw $ra,20($sp)
addiu $sp,$sp,24
jr $ra


.ent determinante3x3
determinante3x3:
    move $t0,$a0
    move $t1,$a1
    move $t2,$a2
    move $t3,$a3

    subu $sp,$sp,28
    sw $ra,24($sp)
    sw,$s0,20($sp)
    sw,$s1,16($sp)
    sw,$s2,12($sp)
    sw,$a0,8($sp)
    sw,$a1,4($sp)
    sw,$a2,0($sp) 

    
    lw $a0,44($sp)
    lw $a1,40($sp)
    lw $a2,32($sp)
    lw $a3,28($sp)
    jal determinante2x2
    move $s0,$v0

    

    move $a0,$t3
    lw $a1,40($sp)
    lw $a2,36($sp)
    lw $a3,28($sp)
    jal determinante2x2
    move $s1,$v0

    

    move $a0,$t3
    lw $a1,44($sp)
    lw $a2,36($sp)
    lw $a3,32($sp)
    jal determinante2x2
    move $s2,$v0
    
    lw $a2,0($sp)
    lw $a1,4($sp)
    lw $a0,8($sp)

    mul $t5,$s0,$a0
    mul $t6,$s1,$a1
    mul $t7,$s2,$a2

    sub $t8,$t5,$t6
    add $t9,$t7,$t8

    move $v0,$t9

    lw $ra,24($sp)
    lw $s0,20($sp)
    lw $s1,16($sp)
    lw $s2,12($sp)
    addiu $sp,$sp,28
    jr $ra

.end determinante3x3
    
.ent determinante2x2
determinante2x2:
    mul $t0,$a0,$a3
    mul $t1,$a1,$a2
    sub $v0,$t0,$t1
    jr $ra

.end determinante2x2


    