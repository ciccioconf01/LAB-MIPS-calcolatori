.data
valore: .word 3141592653
.text
.globl main
.ent main

main:
    lw,$t0,valore
    li $t1,10 #costante
    li $t5,0 #contatore

ciclo:
    divu $t0,$t1
    mflo $t0 #quoto
    mfhi $t3 #resto
    subu $sp,$sp,4
    sw $t3,($sp)
    addu $t5,$t5,1
    bne $t3,0,ciclo

    addu $sp,$sp,4


ciclo2:
    lw $a0,($sp)
    addu $a0,$a0,'0'
    li $v0,11
    syscall
    addu $sp,$sp,4
    subu $t5,$t5,1
    bne $t5,0,ciclo2

    li $v0,10
    syscall
    
.end main
