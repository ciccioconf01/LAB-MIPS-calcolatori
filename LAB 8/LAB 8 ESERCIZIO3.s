.data
Num = 5
Dim = Num * 4
Sconto = 30
Arrotonda = 1

prezzi: .word 39, 1880, 2394, 1000, 1590
scontati: .space Dim
.text
.globl main
.ent main

main:
    li $t0,Arrotonda
    subu $sp,$sp,8
    sw $ra,4($sp)
    sw $t0,0($sp)

    la $a0, prezzi
    la $a1, scontati
    li $a2, Num
    li $a3,Sconto
        

    jal calcola_sconto

    lw $t0,0($sp)
    lw $ra,4($sp)
    addiu $sp,$sp,8
    jr $ra

.end main

.ent calcola_sconto
calcola_sconto:
    move $t0,$a0  #indirizzo vettorePrezzi
    move $t1,$a1  #indirizzo vettoreScontati
    move $t2,$a2  #Num
    move $t3,$a3  #Sconto
    li $t8,100 #costante
    sub $t3,$t8,$t3 #100-sconto
    lw $t4,($sp)  #Arrotondamento

    li $t9,0 #contatore
    

ciclo:

    lw $t5,($t0)

    mul $t6,$t5,$t3
    div $t6,$t8
    mflo $s0
    beqz $t4,noarrotondamento
    mfhi $s1
    blt $s1,50,noarrotondamento
    addiu $s0,$s0,1

noarrotondamento:

    sw $s0,($t1)
    addi $t0,$t0,4
    addi $t1,$t1,4
    addi $t9,$t9,1
    bne $t9,$t2,ciclo

    jal $ra

.end calcola_sconto
