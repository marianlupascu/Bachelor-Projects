#1. Determina�i dac� �ntr-unul din regi�trii $t1 - $t5 se g�se�te valoarea 7. 

#Dac� da, introduce�i valoarea 1 �n registrul $t0. Dac� nu, introduce�i 

#valoarea 0 �n registrul $t0.


.data
	x:.word 5
        y:.word 9
        z:.word 10
.text
main:

lw $t1,x
lw $t2,y
lw $t3,z

li $t0,1

beq $t1,7,sfarsit
beq $t2,7,sfarsit
beq $t3,7,sfarsit
li $t0,0


sfarsit:
li $v0,10
syscall