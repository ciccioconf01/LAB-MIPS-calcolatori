N = 3
M = 4
 .data
matriceA:   .word 0xAB317811, 0xCD514229, 0xEF832040, 0xA1346269
            .word 0xB2178309, 0xC3524578, 0x65702887, 0x59227465
            .word 0x14930352, 0x24157817, 0x39088169, 0x63245986

matriceB:   .word 0x39916800, 0x47900160, 0x62270208, 0x87178291
            .word 0xA7674368, 0xB2092278, 0xC3556874, 0xD6402373
            .word 0xE1216451, 0x24329020, 0x51090942, 0x11240007
matriceC: .space N * M * 4
 .text
 .globl main
 .ent main

main: 
 la $a0, matriceA
 la $a1, matriceB
 la $a2, matriceC
 li $a3, N
 li $t0, M
 
 subu $sp, $sp, 8
 sw $ra, 4($sp)
 sw $t0, 0($sp)

 jal MediaMatrice

 lw $ra, 4($sp)
 addiu $sp, $sp, 8
 jr $ra
 .end main 

.ent MediaMatrice
 MediaMatrice:
    move $t0,$a0 #indirizzo matrice1
    move $t1,$a1 #indirizzo matrice2
    move $t2,$a2 #indirizzo matriceF
    move $t3,$a3  #N
    lw $t4, ($sp) #M

    mul $s2,$t4,$t3

    li $s0,0 #contacicli

ciclo:
    lw $t5,($t0)
    lw $t6,($t1)

    slt $t7,$t5,0
    slt $t8,$t6,0

    beq $t7,$t8,sommaU
    addu $t9,$t5,$t6
    div  $t9,$t9,2
    j salta

sommaU:
    addu $t9,$t5,$t6
    div  $t9,$t9,2
    beq $t7,1,Cambio
    j salta

Cambio:
    mul $t9,$t9,-1

salta:
    sw $t9,($t2)
    addi $t0,$t0,4
    addi $t1,$t1,4
    addi $t2,$t2,4
    addi $s0,$s0,1
    bne $s0,$s2,ciclo

    jr $ra

.end MediaMatrice
    
    