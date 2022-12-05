.data
matrice: .word 10, 6, 7, 4
.text
.globl main
.ent main

main:
    subu $sp,$sp,4
    sw $ra,($sp)
    la $t0,matrice
    lw $a0,($t0)
    addi $t0,$t0,4
    lw $a1,($t0)
    addi $t0,$t0,4
    lw $a2,($t0)
    addi $t0,$t0,4
    lw $a3,($t0)
    addi $t0,$t0,4
    jal determinante2x2

    move $a0,$v0
    li $v0,1
    syscall

    lw $ra,($sp)
    addiu $sp,$sp,4
    jr $ra
.end main

.ent determinante2x2
determinante2x2:
    mul $t0,$a0,$a3
    mul $t1,$a1,$a2
    sub $v0,$t0,$t1
    jr $ra

.end determinante2x2