#1. Declara�i un �ir oarecare de caractere. Determina�i lungimea �irului, prin 

#parcurgerea �i contorizarea loca�iilor de memorie, p�n� c�nd �nt�lni�i 

#caracterul delimitator de final.

.data
	string:.asciiz "ana are mere."
.text
main:

la $a0,string
li $t0,-1 #elimina caracterul final: 0

citire:
	lb $s1,($a0)
    addi $a0,1
    addi $t0,1
    bnez $s1, citire

li $v0,10
syscall
