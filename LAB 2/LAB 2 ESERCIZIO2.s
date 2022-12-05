.data

messaggio: .asciiz "introduci il primo intero"
messaggio2:.asciiz "intero il secondo intero"
messerr: .asciiz "Errore di inserimento"

.text
.globl main
.ent main

main: 
    la $a0, messaggio
    li $v0, 4
    syscall
    li $v0, 5
    syscall
    move $t0, $v0
    la $a0, messaggio2
    li $v0,4
    syscall
    li $v0,5
    syscall
    move $t1, $v0
    li $t2, 255
    slt		$t3, $t0, $t2
    beq $t3,$0,errore
    slt $t3, $t1,$t2
    beq $t3, $0, errore

    not $t4, $t1
    and $t5,$t0,$t4
    not $t4, $t5
    xor $t5, $t0,$t1
    or $t6, $t4, $t5
    
    li $t7, 0x000000FF
    and $t6, $t6, $t7
    move $a0, $t6
    li $v0,1
    syscall
    j fine

errore:
    la $a0, messerr
    li $v0, 4
    syscall

fine:
    li $v0, 10
    syscall

.end main

    