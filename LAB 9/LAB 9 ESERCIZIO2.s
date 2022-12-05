.data
str_orig: .asciiz "% nella citta' dolente, % nell'eterno dolore, % tra la perduta gente"
str_sost: .asciiz "per me si va"
str_new: .space 200
.text
.globl main
.ent main

main: 
    subu $sp,$sp,4
    sw $ra,($sp)

    la $a0, str_orig
    la $a1, str_sost
    la $a2, str_new
    jal sostituisci
    
    lw $ra,($sp)
    addiu $sp,$sp,4
    jr $ra
.end main

.ent sostituisci
sostituisci:
    move $t0,$a0  #indirizzo stringa originale
    move $t1,$a1  #indirizzo stringa da inserire
    move $t2,$a2  #indirizzo dove salvare la stringa

    li $t9,0x00 #costante

ciclo:
    lb $t3,($t0)
    beq $t3,'%',modifica

    sb $t3,($t2)
    addi $t2,$t2,1

    addi $t0,$t0,1
    bne $t3,$t9,ciclo
    j fine

modifica:

ciclo2:
    lb $t4,($t1)
    sb $t4,($t2)
    addi $t2,$t2,1
    addi $t1,$t1,1
    lb $t4,($t1)
    bne $t4,$t9,ciclo2

    move $t1,$a1
    addi $t0,$t0,1
    j ciclo

fine:
    jr $ra

.end sostituisci

