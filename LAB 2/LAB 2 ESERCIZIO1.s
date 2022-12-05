.data

paris:       .asciiz "pari"
disparis:     .asciiz "dispari"

.text
.globl main
.ent main
main:
    li $v0, 5
    syscall
    andi $t0,$v0,1
    beq $t0,$0,salto
    la $a0, disparis
    li $v0,4
    syscall
    j fine

salto: 
    la $a0, paris
    li $v0,4
    syscall

fine: 
    li $v0, 10
    syscall
     
.end main