DIM = 8
 .data
matrice:    .byte 16, -41, 36, -5, 27, 62, 55, -18
            .byte -26, 63, -54, 19, 13, -44, 33, 8
            .byte -1, 40, 45, 12, 22, -51, -58, 31
            .byte 23, -50, 59, -30, 4, -37, 48, -9
            .byte 38, -3, 10, -47, 49, -24, 29, 60
            .byte 52, -21, -32, -57, 39, 2, 11, 46
            .byte -43, 14, -7, 34, 64, 25, 20, -53
            .byte 61, -28, 17, -56, 42, -15, 6, 35
 .text
 .globl main
 .ent main
main: 
    subu $sp, $sp, 4
    sw $ra, ($sp)

    la $a0, matrice
    la $a1, DIM
    jal cornice

    move $a0,$v0
    li $v0,1
    syscall

    lw $ra, ($sp)
    addiu $sp, $sp, 4
    jr $ra
 .end main

 .ent cornice
 cornice:
    move $t0,$a0 #indirizzo
    move $t1,$a1 #DIM

    move $t2,$t0
    add $t2,$t2,$t1
    addi $t2,$t2,1
    add $t2,$t2,$t1
    addi $t2,$t2,1 #indirizzo primo termine

    sub $t3,$t1,4 #massimo spostamento
    li $t4,0 #contatore positivi
    li $t5,0 #contatore num cicli

ciclo:
    lb $t6,($t2)
    blt $t6,0,salta
    addi $t4,$t4,1

salta:
    addi $t5,$t5,1
    addi $t2,$t2,1
    bne $t5,$t3,ciclo

addi $t2,$t2,-1
add $t2,$t2,$t1
sub $t7,$t3,1 #massimo spostamento meno 1
li $t5,0 #contatore num cicli

ciclo2:
    lb $t6,($t2)
    blt $t6,0,salta2
    addi $t4,$t4,1

salta2:
    addi $t5,$t5,1
    add $t2,$t2,$t1
    bne $t5,$t7,ciclo2

sub $t2,$t2,$t1

addi $t2,$t2,-1
li $t5,0 #contatore num cicli

ciclo3:
    lb $t6,($t2)
    blt $t6,0,salta3
    addi $t4,$t4,1

salta3:
    addi $t5,$t5,1
    addi $t2,$t2,-1
    bne $t5,$t7,ciclo3

addi $t2,$t2,1

sub $t2,$t2,$t1
sub $t7,$t3,2 #massimo spostamento meno 2
li $t5,0 #contatore num cicli

ciclo4:
    lb $t6,($t2)
    blt $t6,0,salta4
    addi $t4,$t4,1

salta4:
    addi $t5,$t5,1
    sub $t2,$t2,$t1
    bne $t5,$t7,ciclo4

move $v0,$t4
jr $ra


