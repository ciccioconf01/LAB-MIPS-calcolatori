RIGHE = 4
COLONNE = 5
.data
matrice:    .byte 0, 1, 3, 6, 2,
            .byte 7, 13, 20, 12, 21,
            .byte 11, 22, 10, 23, 9,
            .byte 24, 8, 25, 43, 62
.text
.globl main
.ent main
main:
subu $sp,$sp,4
sw $ra,($sp)

la $a0, matrice
li $a1, 0
li $a2, RIGHE
li $a3, COLONNE

jal contaVicini

move $a0,$v0
li $v0,1
syscall

lw $ra,($sp)
addiu $sp,$sp,4
jr $ra

.end main

.ent contaVicini
contaVicini:
    move $t0,$a0     #indirizzo matrice
    
    move $t1,$a1     #numero di cella
    move $t2,$a2     #righe
    move $t3,$a3     #colonne

    mul $t8,$t2,$t3
    add $t5,$t0,$t8  #indirizzo fine matrice

    add $t4,$t0,$t1 #indirizzo cella

    li $t9,0 #accumulatore

# calcolo elemento dietro

    sub $t6,$t4,1
    bgt $t6,$t5,salta
    blt $t6,$t0,salta
    lb $t7,($t6)
    add $t9,$t9,$t7

salta:

#calcolo elemento avanti
    addi $t6,$t4,1
    bgt $t6,$t5,salta2
    blt $t6,$t0,salta2
    lb $t7,($t6)
    add $t9,$t9,$t7

salta2:

#calcolo elemento sotto

    add $t6,$t4,$t3
    bgt $t6,$t5,salta3
    blt $t6,$t0,salta3
    lb $t7,($t6)
    add $t9,$t9,$t7

salta3:

# calcolo elemento sopra

    sub $t6,$t4,$t3
    bgt $t6,$t5,salta4
    blt $t6,$t0,salta4
    lb $t7,($t6)
    add $t9,$t9,$t7

salta4:

#calcolo elemento in alto a sinistra

    sub $t6,$t4,$t3
    sub $t6,$t6,1
    bgt $t6,$t5,salta5
    blt $t6,$t0,salta5
    lb $t7,($t6)
    add $t9,$t9,$t7

salta5:

#calcolo elemento in alto a destra

    sub $t6,$t4,$t3
    addi $t6,$t6,1
    bgt $t6,$t5,salta6
    blt $t6,$t0,salta6
    lb $t7,($t6)
    add $t9,$t9,$t7

salta6:

#calcolo elemento in basso a sinistra

    add $t6,$t4,$t3
    sub $t6,$t6,1
    bgt $t6,$t5,salta7
    blt $t6,$t0,salta7
    lb $t7,($t6)
    add $t9,$t9,$t7

salta7:

#calcolo elemento in basso a destra

    add $t6,$t4,$t3
    addi $t6,$t6,1
    bgt $t6,$t5,salta8
    blt $t6,$t0,salta8
    lb $t7,($t6)
    add $t9,$t9,$t7

salta8:
    move $v0,$t9
    jr $ra

.end contaVicini
        


