DIM = 3
DIM_RIGA = DIM * 4
.data
mat1:   .word 4, -45, 15565,
        .word 6458, 4531, 124,
        .word -548, 2124, 31000

mat2:   .word 6, -5421, -547,
        .word -99, 4531, 1456,
        .word 4592, 118, 31999
indice: .word 2
vet_out: .space DIM_RIGA
.text
.globl main
.ent main
main: 
    la $a0, mat1
    la $a1, mat2
    la $a2, vet_out
    li $a3, DIM
    lw $t0, indice

    subu $sp, $sp, 8
    sw $ra,4($sp)
    sw $t0,0($sp)
    jal ProceduraVariazione
    addiu $sp, $sp, 8
    lw $t0,0($sp)
    lw $ra,4($sp)
    addiu $sp,$sp,8
    jr $ra
.end main

.ent ProceduraVariazione
ProceduraVariazione:
    move $t0,$a0  #indirizzo matrice1
    move $t1,$a1  #indirizzo matrice2
    move $t2,$a2  #indirizzo vettore ris
    move $t3,$a3  #DIM
    lw $t4,($sp)  #indice

    mul $t5,$t3,$t4
    mul $t5,$t5,4 
    add $t0,$t0,$t5  #nuovo indirizzo matrice 1

    mul $t6,$t4,4
    add $t1,$t1,$t6 #nuovo indirizzo matrice 2
    mul $t9,$t3,4   #fattore di spostamento

    li $s0,0  #contatore

ciclo:
    lw $t5,($t0)
    lw $t6,($t1)
    sub $t7,$t6,$t5
    mul $t7,$t7,100
    div $t8,$t7,$t5
    sw $t8,($t2)
    
    addi $s0,$s0,1

    beq $s0,$t3,fine

    addi $t2,$t2,4
    addi $t0,$t0,4
    add $t1,$t1,$t9
    j ciclo

    
fine:


    jr $ra

.end ProceduraVariazione
