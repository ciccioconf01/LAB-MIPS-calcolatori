.data
messaggio: .asciiz "inserisci un numero"
inputV: .asciiz "\nl'input e' valido"
error: .asciiz "\nl'input non e' valido"
inputF: .asciiz "\nNessun numero inserito"
.text
.globl main
.ent main

main:
    la $a0, messaggio
    li $v0, 4
    syscall
    li $t0,0 #contatore
loop:
    
    li $v0,12
    syscall
    beq $v0,'\n', nonnumero
    blt $v0,'0',messaggioerrore
    bgt $v0,'9',messaggioerrore
    addi,$t0,$t0,1
    
    j loop
messaggioerrore:
    la $a0,error
    li $v0,4
    syscall
    j fine
    
nonnumero:
    bne $t0,'0',exitloop
    la $a0,inputF
    li $v0,4
    syscall  
    j fine

exitloop:
    la $a0,inputV
    li $v0,4
    syscall

fine:
    li $v0,10
    syscall

.end main