.data
parola: .asciiz "ciao"
.text
.globl main
.ent main

main:
    la $t0,parola
    li $t1,0 #contatore
loop:
    lbu $a0,($t0)
    jal Converti
    move $a0,$v0
    li $v0,11
    syscall
    addi $t0,$t0,1
    addi $t1,$t1,1
    bne $t1,4,loop

    li $v0,10
    syscall

.end main


Converti:
    addi $a0,$a0,'A'
    li $v0,'a'
    sub $v0,$a0,$v0
    jr $ra



    
    