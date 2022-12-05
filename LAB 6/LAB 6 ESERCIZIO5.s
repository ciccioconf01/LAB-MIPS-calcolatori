.data
messaggio: .asciiz "introduci"
.text
.globl main
.ent main

main:
    la $a0,messaggio
    li $v0,4
    syscall
    li $v0,5
    syscall
    move $t0,$v0
    la $a0,messaggio
    li $v0,4
    syscall
    li $v0,5
    syscall
    move $a1,$v0
    move $a0,$t0
    jal combina
    move $a0,$v0
    li $v0,1
    syscall
    li $v0,10
    syscall

combina:
    move $t0,$a0 #n
    move $t1,$a1 #k

    sub $t2,$t1,1
calcoloDen:
    mul $t1,$t1,$t2
    sub $t2,$t2,1
    bne $t2,0,calcoloDen

#--------------------------------

    move $t3,$t0
    subu $t4,$a0,$a1
    addiu $t4, $t4,1 #valore stop
    
calcoloNum:
    subu $t3,$t3,1
    mul $t0,$t0,$t3   
    bne $t3,$t4,calcoloNum

#-------------------------------------
    divu $v0,$t0,$t1
    
    jr $ra

.end combina

    