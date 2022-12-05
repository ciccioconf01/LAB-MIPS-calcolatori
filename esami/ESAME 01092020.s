DIM = 64
 .data
vetRX: .byte 0x84, 0xFA, 0x09, 0x54, 0x20, 0x42, 0x19, 0x20, 0x41,0xB1, 0x03
vetTX: .space DIM
 .text
 .globl main
 .ent main
main: 
    subu $sp,$sp,4
    sw $ra,($sp)
    la $a0, vetRX
    la $a1, vetTX
    jal SpaceRemove
    lw $ra,($sp)
    addiu $sp,$sp,4
    jr $ra
    
 .end main

 .ent SpaceRemove

 SpaceRemove:
    move $t0,$a0 #indirizzo primo vettore
    move $t1,$a1 #indirizzo vettore ris

    lb $t2,($t0)
    addi $t0,$t0,1
    lb $t3,($t0)
    addi $t0,$t0,1

    sb $t3,($t1)
    addi $t1,$t1,1
    sb $t2,($t1)
    addi $t1,$t1,1

    
ciclo:
    lb $t2,($t0)

    beq $t2,0x03,escidalciclo
    beq $t2,0x20,salto
    sb $t2,($t1)
    addi $t1,$t1,1

salto:
    addi $t0,$t0,1
    j ciclo

escidalciclo:

    jr $ra

.end SpaceRemove
