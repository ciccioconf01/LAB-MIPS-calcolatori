.data
messaggio1: .asciiz "Inserisci a"
messaggio2: .asciiz "Inserisci b"
messaggio3: .asciiz "Inserisci c"
messaggioF1: .asciiz "Esistono 2 soluzioni reali distinte"
messaggioF2: .asciiz "Esistono 2 soluzioni reali coincidenti"
messaggioF3: .asciiz "Non esistono soluzioni reali"

.text
.globl main
.ent main

main:
    la $a0,messaggio1
    li $v0,4
    syscall
    li $v0,5
    syscall
    move $t0,$v0
    la $a0,messaggio2
    li $v0,4
    syscall
    li $v0,5
    syscall
    move $t1,$v0
    la $a0,messaggio3
    li $v0,4
    syscall
    li $v0,5
    syscall
    move $t2,$v0

    mul $t3, $t1,$t1  #b al quadrato

    mul $t4,$t0,$t2
    mul $t4,$t4,4     #4ac

    slt $t5,$t3,$t4
    beq $t5,1,NoSol
    beq $t3,$t4,SolC
    la $a0, messaggioF1
    li $v0,4
    syscall
    j fine

NoSol:
    la $a0, messaggioF3
    li $v0,4
    syscall
    j fine

SolC:
    la $a0, messaggioF2
    li $v0,4
    syscall

fine:
    li $v0,10
    syscall

.end main

