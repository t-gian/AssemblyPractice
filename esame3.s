




.ent monotono

monotono:
addi $t0,$a0,0
li $t1,1 #numeri letti
li $v0,1 #monotona
li $v1,1 #max monotona


ciclomonotona:
li $t3,1 
lw $t2,($t0)    #contatore monotona
leggovalori:
addi $t0,$t0,4
lw $t3,($t0)
addi $t1,$t1,1
ble $t3,$t2,ciclomonotona #riinizio sequenza monotona
beq $t1,$a1,fine
continuomonotona:
move $t2,$t3
j leggovalori

fine:

