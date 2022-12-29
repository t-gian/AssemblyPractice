


.ent comprimi

comprimi:

subu $sp,$sp,20
sw $ra,($sp)
sw $s0,4($sp)
sw $s1,8($sp)
sw $s2,12($sp)
s2 $s3,16($sp)

move $s0,$a0
move $s1,$a1
move $s2,$a2
li $s3,0

ciclo:
lbu $a0,($s0)
jal quantizza
beq $s3,0,nuovo 
beq $s4,$v0,fineCiclo

nuovo:
move $s4,$v0
sb $s4, ($s2)
addi $s2,$s2,1
addi $s3,$s3,1
fineCiclo:
addi $s0,$s0,1
subu $s1,$s1,1



