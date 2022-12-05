.data
anni: .word 1945, 2008, 1800, 2006, 1748, 1600
risultato: .space lunghezza
lunghezza=6
.text
.globl main
.ent main

main:
    subu $sp,$sp,4
    sw $ra,($sp)

    la $a0,anni
    la $a1,risultato
    li $a2,lunghezza
    jal bisestile

    lw $ra,($sp)
    addiu $sp,$sp,4
    jr $ra
.end main

.ent bisestile
bisestile:
    move $t0,$a0 #indirizzo vetAnni
    move $t1,$a1 #indirizzo vetRis
    move $t2,$a2 # L

    li $t7,0 #contatore

    li $t6,100 #costante
    li $t5,4 #costante
    li $t8,400 #costante

    li $t9,1
    li $s0,0

ciclo:
    lw $t3,($t0)

    div $t3,$t6
    mfhi $t4
    beq $t4,0,confronta400
    j confronto4

confronta400:
    div $t3,$t8
    mfhi $t4
    beq $t4,0,bise
    j nobise

confronto4:
    div $t3,$t5
    mfhi $t4
    beq $t4,0,bise
    j nobise

bise:
    sw $t9,($t1)
    j fine

nobise:
    sw $s0,($t1)

fine:
    addi $t0,$t0,4
    addi $t1,$t1,4
    addi $t7,$t7,1

    bne $t7,$t2,ciclo

    jr $ra

.end bisestile

