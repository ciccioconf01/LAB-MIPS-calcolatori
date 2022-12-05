.data
vettore: .byte 14, 16, 18, 134, 24, 22, 23, 149, 140, 141, 145, 146
vettoreCompresso: .space 12
INTERVALLO_QUANT = 10 

.text
 .globl main
 .ent main
main:
    subu $sp, $sp, 4
    sw $ra, ($sp)
    la $a0, vettore
    li $a1, 12
    la $a2, vettoreCompresso
    jal comprimi

 lw $ra, ($sp)
 addu $sp, $sp, 4
 jr $ra
 .end main

.ent comprimi
comprimi:
    move $s0,$a0 #indirizzo vettore
    move $s1,$a1 #DIM
    move $s2,$a2 #indirizzo vettore complesso
    li $s3,0 #contatore

    subu $sp,$sp,20
    sw $ra,16($sp)
    sw $s2,12($sp)
    sw $s1,8($sp)
    sw $s0,4($sp)
    sw $s3,0($sp)

    ciclo:

        lb $a0,($s0)
        jal quantizza
        sb $v0,($s0)

        addi $s0,$s0,1
        addi $t9,$t9,1

        bne $t9,$s1,ciclo

    lw $s0,12($sp)
    lb $t0,($s0)
    sb $t0,($s2)
    addi $s2,$s2,1

    sub $t7,$s1,1 #DIM-1
    li $t8,0 #contatore
    
    ciclo2:
        lb $t0,($s0)
        addi $s0,$s0,1
        lb $t1,($s0)
        beq $t1,$t0,salta
        sb $t1,($s2)
        addi $s2,$s2,1

    salta:
        addi $t8,$t8,1
        bne $t8,$t7,ciclo2

    lw $ra,16($sp)
    lw $s2,12($sp)
    lw $s1,8($sp)
    lw $s0,4($sp)
    lw $s3,0($sp)
    addiu $sp,$sp,20
    jr $ra

.end comprimi


.ent quantizza
quantizza:
 divu $t0, $a0, INTERVALLO_QUANT
 mulou $v0, $t0, INTERVALLO_QUANT
 jr $ra
 .end quantizza