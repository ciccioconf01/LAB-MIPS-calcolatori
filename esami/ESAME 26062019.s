.data
espressione: .word 18, 25, 10, 7, -2, -3, -1, 13, -2
tabella: .word somma, sottrazione, moltiplicazione, divisione
 .text
 .globl main
 .ent main
main: 
    subu $sp, $sp, 4
    sw $ra, ($sp)
    la $a0, espressione
    li $a1, 9
    jal calcolaPolaccaInversa

    lw $ra, ($sp)
    addu $sp, $sp, 4
    jr $ra
    .end main

calcolaPolaccaInversa:
    
    subu $sp,$sp,4
    sw $ra,($sp)

    move $s0,$a0 #indirizzo vet
    move $s1,$a1 #DIMvet
    li $s2,0 #contatore

ciclo:
    

    lw $t0,($s0)
    blt $t0,$0,operatore

    subu $sp,$sp,4
    sw $t0,($sp)

    
    j salto

operatore:
    move $a0,$t0
    lw $t0,4($sp)
    move $a1,$t0
    lw $t0,0($sp)
    move $a2,$t0
    addiu $sp,$sp,8
    jal eseguiOperazione
    subu $sp,$sp,4
    sw $v0,($sp)

salto:
    addi $s2,$s2,1
    addi $s0,$s0,4

    bne $s2,$s1,ciclo

    lw $a0,($sp)
    addiu $sp,$sp,4
    li $v0,1
    syscall

    lw $ra,($sp)
    addiu $sp,$sp,4

    jr $ra



eseguiOperazione:
 subu $t0, $zero, $a0
 subu $t0, $t0, 1
 sll $t0, $t0, 2
 lw $t1, tabella($t0)
 jr $t1
somma: addu $v0, $a1, $a2
 b fine
sottrazione: subu $v0, $a1, $a2
 b fine
moltiplicazione: mulou $v0, $a1, $a2
 b fine
divisione: divu $v0, $a1, $a2
 b fine
fine: jr $ra 