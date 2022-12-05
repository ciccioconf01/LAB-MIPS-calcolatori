.data

giorni: .byte 1
ore:    .byte 2
minuti: .byte 15
risultato: .space 4

.text
.globl main
.ent main

main:
    lb $t0,giorni
    lb $t1,ore
    lb $t2,minuti

    mul $t0,$t0,24
    mul $t0,$t0,60

    mul $t1,$t1,60

    add $t3,$t0,$t1
    add $a0,$t2,$t3
    
    sb $a0,risultato

    li $v0,10
    syscall

.end main
