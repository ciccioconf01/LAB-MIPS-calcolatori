.data
DIM = 5
vet1: .word 56, 12, 98, 129, 58
vet2: .word 1, 0, 245, 129, 12
risultato: .space DIM
.text
.globl main
.ent main

main:
    subu $sp,$sp,4
    sw $ra,($sp)

    la $a0,vet1
    la $a1,vet2
    la $a2, risultato
    li $a3, DIM
    jal calcolaDistanzaH

    lw $ra,($sp)
    addiu $sp,$sp,4
    jr $ra

.end main

.ent calcolaDistanzaH
calcolaDistanzaH:
    move $t0,$a0 #indirizzo vet1
    move $t1,$a1 #indirizzo vet2
    move $t2,$a2 #indirizzo ris
    move $t3,$a3 #DIM

  li $s0,0 #contaTotale  
    

cicloEsterno:
    lw $t4,($t0)
    lw $t5,($t1)
    li $t9,0 #contatoreDIFF
    li $t8,0 #contatoreInterno
cicloInterno:

    and $t6,$t4,1
    and $t7,$t5,1

    srl $t4,$t4,1
    srl $t5,$t5,1
    addi $t8,$t8,1
    beq $t8,16,uscita
    beq $t6,$t7,cicloInterno
    addi $t9,$t9,1
    j cicloInterno

uscita:
    addi $t0,$t0,4
    addi $t1,$t1,4
    sw $t9,($t2)
    addi $t2,$t2,4
    addi $s0,$s0,1
    bne $s0,$t3,cicloEsterno

    jr $ra

.end calcolaDistanzaH