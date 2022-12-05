.data
messaggio: .asciiz"Inserisci un numero"
.text
.globl main
.ent main

main:
    subu $sp,$sp,4
    sw $ra,($sp)

    la $a0,messaggio
    li $v0,4
    syscall
    li $v0,5
    syscall
    move $a0,$v0
    jal calcolaSuccessivo
    
    lw $ra,($sp)
    addiu $sp,$sp,4
    jr $ra
.end main

.ent calcolaSuccessivo
calcolaSuccessivo:
    move $t0,$a0

    and $t1,$t0,1
    beq $t1,1,dispari
    div $t2,$t0,2
    j fine

dispari:
    mul $t2,$t0,3
    addi $t2,$t2,1

fine:
    move $a0,$t2
    li $v0,1
    syscall
    li $a0,'\n'
    li $v0,11
    syscall
    move $v0,$t2
    jr $ra
.end calcolaSuccessivo