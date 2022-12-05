.data
n: .half 1000
.text
.globl main
.ent main

main:
    lh $t0, n
    li $t1,1
    li $t2,0   #indice
    li $t4,0   #contatore

ciclo:
    
    and $t3, $t0, $t1
    beq $t3,0,next
    addi $t4,$t4,1
next:
    srl $t0, $t0,1
    addi $t2,$t2,1
    bne $t2,16,ciclo

    move $a0,$t4
    li $v0,1
    syscall
    li $v0,10
    syscall
.end main