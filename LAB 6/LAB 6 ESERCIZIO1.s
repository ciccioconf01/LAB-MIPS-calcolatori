.data
    Costante=8
.text
.globl main
.ent main

main:
    li $a0,Costante
    jal stampaTriangolo
    li $a0,Costante
    jal stampaQuadrato
    li $v0,10
    syscall
    .end main


stampaTriangolo:
    move $t0,$a0
    li $t1,0  #contatore esterno
loopEsterno:
    addi $t1,$t1,1
    li $t2,0 #contatore interno
loop:
    
    li $a0,'*'
    li $v0,11
    syscall
    addi $t2,$t2,1
    bne $t1,$t2,loop

    li $a0,'\n'
    li $v0,11
    syscall 
    bne $t1,$t0,loopEsterno

    jr $ra

#-------------------------------------------

stampaQuadrato:
    move $t0,$a0
    li $t1,0  #contatore esterno
loopEsterno2:
    
    li $t2,0 #contatore interno

loopInterno2:
    
    li $a0,'*'
    li $v0,11
    syscall
    addi $t2,$t2,1
    bne $t0,$t2,loopInterno2

    li $a0,'\n'
    li $v0,11
    syscall
    addi $t1,$t1,1
    bne $t1,$t0,loopEsterno2

    jr $ra





