.data
messaggio: .asciiz "digita:\n0 per somma\n1 per sottrazione\n2 per moltiplicazione\n3 per divisione\n"
messaggioeError: .asciiz "Errore di inserimento"
opa: .word 8
opb: .word 5
res: .space 4
tab: .word somma,sottrazione,moltiplicazione,divisione
.text
.globl main
.ent main

main:
    la $a0,messaggio
    li $v0,4
    syscall
    li $v0,5
    syscall
    bgt $v0,4,Errore
    blt $v0,0,Errore
    
    lw $t4,opa
    lw $t5,opb

    la $t2,tab
    move $t0,$v0
    sll $t0,$t0,2
    add $t1,$t0,$t2
    lw $t3,($t1)
    jr $t3

somma:
    add $t6,$t4,$t5
    move $a0,$t6
    li $v0,1
    syscall
    sw $t6, res
    j fine

sottrazione:
    sub $t6,$t4,$t5
    move $a0,$t6
    li $v0,1
    syscall
    sw $t6,res
    j fine

moltiplicazione:
    mul $t6,$t4,$t5
    move $a0,$t6
    li $v0,1
    syscall
    sw $t6,res
    j fine

divisione:
    div $t6,$t4,$t5
    move $a0,$t6
    li $v0,1
    syscall
    sw $t6,res
    j fine



Errore:
    la $a0,messaggioeError
    li $v0,4
    syscall
    j fine

fine:
    li $v0,10
    syscall

