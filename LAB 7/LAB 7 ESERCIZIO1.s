.data
p3: .word 4
p2: .word 2
p1: .word -5
p0: .word 3
N=7
.text
.globl main
.ent main

main:
    #salvataggio indirizzo di ritorno
    #subu $sp,$sp,4
    #sw $ra,($sp)

    lw $t0,p3
    lw $t1,p2
    lw $t2,p1
    lw $t3,p0

    mul $s0,$t1,$t1
    mul $s0,$s0,$t1

    mul $s1,$t1,$t1

    mul $s2,$t3,$t3
    mul $s2,$s2,$t3

    mul $s3,$t3,$t3

    mul $s4,$t0,$t0
    mul $s4,$s4,$t0

    mul $s5,$t0,$t0

    #primo parametro
    add $t4,$t0,$t1
    add $t5,$t2,$t3
    add $a0,$t4,$t5

    #secondo parametro
    mul $t4,$t0,$s0
    mul $t5,$t1,$s1
    mul $t6,$t2,2
    add $t7, $t4,$t5
    add $t4, $t6,$t3
    add $a1,$t7,$t4

    #terzo parametro
    mul $t4,$t0,$s2
    mul $t5,$t1,$s3
    mul $t6,$t2,3
    add $t7, $t4,$t5
    add $t4, $t6,$t3
    add $a2,$t7,$t4

    #quarto parametro
    mul $t4,$t0,$s0
    mul $t5,$t1,$s1
    mul $t6,$t2,2
    add $t7, $t4,$t5
    add $t4, $t6,$t3
    add $a3,$t7,$t4

    #salvataggio registri $tx
    subu $sp,$sp,16
    sw $t0,12($sp)
    sw $t1,8($sp)
    sw $t2,4($sp)
    sw $t3,0($sp)

    #passaggio parametro N

    li $t8,N
    subu $sp,$sp,4
    sw $t8,($sp)

    jal polinomio

    #pop parameetro a vuoto (N)
    addiu $sp,$sp,4

    #ripristino parametri $tx
    lw $t3,0($sp)
    lw $t2,4($sp)
    lw $t1,8($sp)
    lw $t0,12($sp)
    addiu $sp,$sp,16

    #ripristino indirizzo di ritorno
    #lw $ra,($sp)
    #addiu $sp,$sp,4

    li $v0,10
    syscall

.end main


polinomio:
    #salvataggio registri $sx
    sub $sp,$sp,12
    sw $s0,8($sp)
    sw $s1,4($sp)
    sw $s2,0($sp)

    sub $t0,$a1,$a0
    sub $t1,$a2,$a1
    sub $t2,$a3,$a2
    sub $s0,$t1,$t0
    sub $s1,$t2,$t1
    sub $s2,$s1,$s0
    move $v0,$a3

    lw $t5,12($sp)
    addi $t5,$t5,-4 #valore stop
    li $t6,0 #contatore
ciclo:
    add $s1,$s1,$s2
    add $t2,$t2,$s1
    add $v0,$v0,$t2

    addi $t6,$t6,1
    bne $t6,$t5,ciclo

    #ripristino $sx
    lw $s2,0($sp)
    lw $s1,4($sp)
    lw $s2,8($sp)
    addiu $sp,$sp,12

    jr $ra

.end polinomio



