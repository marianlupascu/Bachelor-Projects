#1. Pentru un sir de caractere cunoscut, s� se determine �irul de 

#caractere ob�inut prin oglindirea �irului ini�ial. De exemplu: pentru 

#�irul �sir� se va ob�ine �ris�. Utiliza�i opera�iile PUSH �i POP.


.data
string1: .asciiz "Dati sirul de caractere: "
string: .space 10 
.text
main:

la $a0,string1
li $v0,4
syscall

li $v0,8
syscall


citire:
  lb $s1,($a0)
  addi $a0,1
  subu $sp,$sp,1
  sb $s1,0($sp)
  bnez $s1,citire

addu $sp,$sp,1

la $a0,($sp)
li $v0,4
syscall

li $v0,10
syscall

