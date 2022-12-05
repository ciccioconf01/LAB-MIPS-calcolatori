.data
vettore: .word 15, 970, 120000, -21, -1000, 15003, -1039581
.text 
.globl main
.ent main

main:
    la $a0,vettore
    li $a1,7
    jal massimo
    move $a0,$v0
    li $v0,1
    syscall
    li $v0,10
    syscall
.end main

massimo:
    move $t0,$a0
    move $t1,$a1
    li $t4,0 #contatore
    li $t5,0 #massimo
loop:
    lw $t2,($t0)
    blt $t2,$t5,continua
    move $t5,$t2

continua:
    addi $t0,$t0,4
    addi $t4,$t4,1
    bne $t4,$t1,loop

    move $v0,$t5
    jr $ra

    
