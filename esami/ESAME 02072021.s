DIM = 8
.data
matrice:    .byte 3, 1, 41, 5, 9, 26, 5, 35
            .byte 89, 79, 32, 3, 8, 46, 26, 4
            .byte 33, 8, 32, 79, 50, 28, 8, 4
            .byte 19, 71, 69, 39, 9, 37, 5, 10
            .byte 58, 20, 9, 74, 9, 44, 59, 2
            .byte 30, 7, 8, 16, 40, 6, 28, 6
            .byte 20, 8, 9, 98, 62, 80, 3, 48
            .byte 25, 34, 21, 1, 70, 6, 7, 9
.text
.globl main
.ent main
main:
subu $sp, $sp, 4
sw $ra, ($sp)
la $a0, matrice
li $a1, 7
li $a2, DIM
jal maxInTriangolo

move $a0,$v0
li $v0,1
syscall

lw $ra, ($sp)
addiu $sp, $sp, 4
jr $ra
.end main

.ent maxInTriangolo
maxInTriangolo:
    move $t0,$a0 #indirizzo matrice
    move $t1,$a1 #numero colonna
    move $t2,$a2 #dimensione
    sub $t3,$t2,1 #DIM-1

    li $t6,0 #max
    add $t4,$t0,$t1 #indirizzo primo termine
    lb $t5,($t4)
    add $t6,$t6,$t5

    move $t7,$t4

    li $t8,0 #contatore interno

ciclo:
    beq $t8,$t1,stop
    add $t7,$t7,$t3
    lb $t9,($t7)
    blt $t9,$t6,noOp
    move $t6,$t9

noOp:

    addi $t8,$t8,1
    j ciclo

stop:

li $t8,0 #contatore interno
ciclo2:
    beq $t8,$t1,stop2
    addi $t7,$t7,1
    lb $t9,($t7)
    blt $t9,$t6,noOp2
    move $t6,$t9
    
noOp2:
    addi $t8,$t8,1
    j ciclo2

stop2:

li $t8,0 #conta salite
sub $s0,$t1,2
bge $s0,0,vai
li $s0,0
vai:

cicloF:
    beq $t8,$s0,stop3
    sub $t7,$t7,$t2
    lb $t9,($t7)
    blt $t9,$t6,noOp3
    move $t6,$t9
    
noOp3:
    addi $t8,$t8,1
    j cicloF

stop3:

    move $v0,$t6
    jr $ra
.end maxInTriangolo
