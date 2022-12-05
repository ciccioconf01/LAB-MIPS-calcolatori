.data
DIM=3
messaggio: .asciiz "inserisci il valore"
messaggioF: .asciiz"\nla media e':"
.text
.globl main
.ent main

main:
    li $t0,0 #contatore
    li $t1,0 #accumulatore
ciclo:

    la $a0,messaggio
    li $v0,4
    syscall
    li $v0,5
    syscall
    addi $t0,$t0,1
    add $t1,$t1,$v0
    bne $t0,DIM,ciclo

    div $t2,$t1,$t0
    la $a0,messaggioF
    li $v0,4
    syscall
    move $a0,$t2
    li $v0,1
    syscall

    li $v0,10
    syscall

.end main    