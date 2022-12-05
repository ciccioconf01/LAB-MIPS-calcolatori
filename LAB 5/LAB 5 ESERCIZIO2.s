.data
messaggio: .asciiz "intruduci una stringa\n"
messaggioF1: .asciiz "\nla stringa e' palindroma"
messaggioF2: .asciiz "\nla stringa non e' palindroma"
.text
.globl main
.ent main

main:
    la $a0,messaggio
    li $v0,4
    syscall
    li $t0,0 #contatore
    move $t1,$sp #salva l'inizio dello stack

ciclo:

    li $v0,12
    syscall
    subu $sp,$sp,4
    sw $v0,($sp)
    addu $t0,$t0,1
    bne $v0,'\n',ciclo

verifica:
    subu $t1,$t1,4
    addu $sp,$sp,4
    lw $t2,($t1)
    lw $t3,($sp)
    subu $t0,$t0,1
    beq $t2,$t3,verifica
    beq $t0,0,fine

    la $a0,messaggioF2
    li $v0,4
    syscall
    j endd

fine:
    la $a0,messaggioF1
    li $v0,4
    syscall

endd:
    li $v0,10
    syscall

.end main



