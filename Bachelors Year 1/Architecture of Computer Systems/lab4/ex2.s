#2. Verifica�i dac� num�rul stocat �n registrul $t1 este pozitiv. Dac� da, pune�i 

#0 �n registrul $t2, dac� nu, pune�i 1 �n registrul $t2.

.data
	x:.word -5
.text
main:

lw $t1,x
li $t2,0

bgez $t1,sfarsit
li $t2,1

sfarsit:
li $v0,10
syscall