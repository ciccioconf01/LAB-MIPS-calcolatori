.data
messaggio: .asciiz "inserisci un numero"
inputV: .asciiz "\nl'input e' valido"
error: .asciiz "\nl'input non e' valido"
inputF: .asciiz "\nNessun numero inserito"
magg: .asciiz "\nIl numero non e' rappresentabile su 4 byte"
.text
.globl main
.ent main

main:
    la $a0, messaggio
    li $v0, 4
    syscall
    li $t0,0 #contatore
    li $t1,0 #accumulatore
    li $t5,10 #costante
loop:
    
    li $v0,12
    syscall
    beq $v0,'\n', nonnumero
    blt $v0,'0',messaggioerrore
    bgt $v0,'9',messaggioerrore
    addi,$t0,$t0,1

    sub $t3,$v0,'0'
    multu $t1,$t5
    mfhi $t7
    bne $t7,0,supera
    mflo $t7

    add $t6,$t7,$t3
    move $t1,$t6
    j loop

messaggioerrore:
    la $a0,error
    li $v0,4
    syscall
    j fine
    
nonnumero:
    bne $t0,0,exitloop
    la $a0,inputF
    li $v0,4
    syscall  
    j fine

exitloop:
    
    la $a0,inputV
    li $v0,4
    syscall
    move $a0,$t1
    li $v0,1
    syscall
    j fine

supera:
    la $a0, magg
    li $v0,4
    syscall

fine:
    li $v0,10
    syscall

.end main