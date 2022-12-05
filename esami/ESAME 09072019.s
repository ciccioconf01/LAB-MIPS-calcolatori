DIM = 4
 .data
matrice:    .word 126, -988, 65, 52
            .word 7, 0, 2, 643
            .word 66, 532, 43, 9254
            .word 5, -51, 4352, -452
 .text
 .globl main
 .ent main
main: subu $sp, $sp, 4
 sw $ra, ($sp)
 la $a0, matrice
 li $a1, DIM
 jal calcolaTrasp
 lw $ra, ($sp)
 addiu $sp, $sp, 4
 jr $ra 

.ent calcolaTrasp
 calcolaTrasp:
    move $t0,$a0 #indirizzo matrice
    move $t1,$a1 #DIM
    sub $t9,$t1,1 #DIM-1

    li $t7,0 #contatore cicli totali

    

cicloTotale:
    li $t2,1 #contatore cicli
    move $t0,$a0
    mul $t8,$a1,$t7
    mul $t8,$t8,4
    add $t0,$t0,$t8

    mul $s0,$t7,4
    add $t0,$t0,$s0
ciclo:
    

    addi $t0,$t0,4
    lw $t3,($t0)

    mul $t5,$t9,$t2
    mul $t5,$t5,4

    add $t0,$t0,$t5
    lw $t4,($t0)

    sw $t3,($t0)

    sub $t0,$t0,$t5
    sw $t4,($t0)

    addi $t2,$t2,1
    bne $t2,$t1,ciclo

    sub $t1,$t1,1

    addi $t7,$t7,1

    bne $t1,1,cicloTotale

    jr $ra

.end calcolaTrasp