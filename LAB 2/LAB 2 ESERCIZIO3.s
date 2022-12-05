.data

n0: .word 7
n1: .word 3
n2: .word 5

.text
.globl main
.ent main

main: 
    lw $t0, n0
    lw $t1, n1
    lw $t2, n2

    blt $t0,$t1,notswap
    move $t3,$t1
    move $t1,$t0
    move $t0,$t3

notswap:
    blt $t0,$t2,notswap2
    move $t3, $t2
    move $t2,$t0
    move $t0,$t3

notswap2:
    blt $t1,$t2,notswap3
    move $t3, $t2
    move $t2, $t1
    move $t1,$t3

notswap3:
    move $a0,$t0
    li $v0, 1
    syscall
    move $a0,$t1
    syscall
    move $a0,$t2
    syscall

    li $v0, 10
    syscall

.end main
