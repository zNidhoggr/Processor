,.data
array: .word 23, 45, 67, 12, 60, 34, 56, 78, 21, 57     

msg1: .asciiz "O maior número é: "
nl: .asciiz "\n"

.text
main:
    la $s0, array       	# carrega o endereço do primeiro elemento da lista em $s0
    lw $t0, ($s0)         	# carrega o primeiro número em $t0
    addi $t1, $zero, 9 		# comprimento da lista
    addi $s0, $s0, 4    	# aponta para o segundo elemento da lista
loop1:
    beq $t1, $zero, print   	# verifica se chegou ao final da lista
    lw $t2, ($s0)       	# carrega o próximo número em $t2
    bge $t0, $t2, loop2     	# compara com o maior número atual
    move $t0, $t2       	# se for maior, atualiza o maior número
loop2:
    addi $t1, $t1, -1   	# decrementa o comprimento da lista
    addi $s0, $s0, 4    	# aponta para o próximo elemento da lista
    j loop1         		# continua no loop

print:
    li $v0, 4           	# número de sistema para escrever na tela
    la $a0, msg1        	# carrega o endereço da mensagem inicial em $a0
    syscall

    li $v0, 1           	# número de sistema para escrever na tela
    move $a0, $t0       	# carrega o maior número em $a0
    syscall

    li $v0, 4           	# número de sistema para escrever na tela
    la $a0, nl      		# carrega o endereço da nova linha em $a0
    syscall

    li $v0, 10          	# número de sistema para sair
    syscall
