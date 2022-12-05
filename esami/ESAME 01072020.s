DIM = 11
 .data
veta: .word 2, 14, 8, 54, 0, 42, 9, 24, 0, 91, 23
vetb: .byte 4*DIM
 .text
 .globl main
 .ent main
main:
    subu $sp,$sp,4
    sw $ra,($sp)
    la $a0, veta
    la $a1, vetb
    li $a2, DIM
    jal media

    lw $ra,($sp)
    addiu $sp,$sp,4
 
 .end main 

 .ent media
 media:
    move $t0,$a0 #vet A
    move $t1,$a1 #vet B
    move $t2,$a2 #DIM

    beq $t2,1,casoParticolare
    beq $t2,2,casoParticolare
    beq $t2,3,casoParticolare


    
    lw $t3,($t0)
    sw $t3,($t1)

    addi $t0,$t0,4
    addi $t1,$t1,4

    lw $t3,($t0)
    sw $t3,($t1)

    addi $t0,$t0,4
    addi $t1,$t1,4

    sub $t4,$t2,3 #dim - 3

    
    li $t8,0 #contatore

ciclo:
    li $t5,0 #accumulatore
    lw $t6,-8($t0)
    add $t5,$t5,$t6

    lw $t6,-4($t0)
    add $t5,$t5,$t6

    lw $t6,0($t0)
    add $t5,$t5,$t6

    lw $t6,4($t0)
    add $t5,$t5,$t6
    
    addi $t0,$t0,4


    div $t7,$t5,4
    sw $t7,($t1)
    addi $t1,$t1,4

    addi $t8,$t8,1

    bne $t8,$t4,ciclo

    lw $t6, ($t0)
    sw $t6,($t1)
    j fine

li $t8,0 #contatore
casoParticolare:
    lw $t5,($t0)
    sw $t5,($t1)
    addi $t0,$t0,4
    addi $t1,$t1,4
    addi $t8,$t8,1
    bne $t8,$t2,casoParticolare

fine:

    jr $ra







