.data
ingresso:   .byte 12, 47
uscita:     .byte 18, 14
X:          .byte 2
Y:          .byte 40
.text
.globl main
.ent main

main:
    subu $sp,$sp,4
    sw $ra,($sp)

    la $a0,ingresso
    la $a1,uscita
    lb $a2,X
    lb $a3,Y
    jal costoParcheggio
    move $a0,$v0
    li $v0,1
    syscall

    lw $ra,($sp)
    addiu $sp,$sp,4
    jr $ra
.end main


#-----------------------------------------------------------------------


.ent costoParcheggio
costoParcheggio:
    move $t0,$a0
    move $t1,$a1
    move $t2,$a2 #X
    move $t3,$a3 #Y

    lb $t4,($t0) #ora ingresso
    lb $t5,1($t0)#minuto ingresso
    lb $t6,($t1) #ora uscita
    lb $t7,1($t1)#minuto uscita

    li $t8,0 #contatore ciclo

ciclo:
    addi $t8,$t8,1

    add $t5,$t5,$t3
    ble	$t5, 60 , noOp
    addi $t5,$t5,-60
    addi $t4,$t4,1

noOp:
    bgt $t4,$t6,fine
    beq $t4,$t6,controllaMin
    
    j ciclo

controllaMin:
    bgt $t5,$t7,fine
    j ciclo

fine:
     mul $v0,$t8,$t2
     
     jr $ra

.end costoParcheggio


    
