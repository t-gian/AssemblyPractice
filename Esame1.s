
DIM = 8 
.data 
matrice:
.byte 3, 1, 41, 5, 9, 26, 5, 35 
.byte 89, 79, 32, 3, 8, 46, 26, 4 
.byte 33, 8, 32, 79, 50, 28, 8, 4 
.byte 19, 71, 69, 39, 9, 37, 5, 10 
.byte 58, 20, 9, 74, 9, 44, 59, 2 
.byte 30, 7, 8, 16, 40, 6, 28, 6 
.byte 20, 8, 9, 98, 62, 80, 3, 48 
.byte 25, 34, 21, 1, 70, 6, 7, 9 
.text
.globl main 
.ent main
main:
la $a0,matrice
li $a1,5
li $a2,DIM
jal maxInTriangolo
move $a0,$v0
li $v0,1
syscall
li $v0,10
syscall
.end main

#a0 indirizzo matrice #a1 vertice triangolo #a2 simensione
.ent maxInTriangolo
maxInTriangolo:

add $t0,$a0,$a1 #indirizzo vertice
lb $v0,($t0)
li $t1,0 #contatore posizioni lato
cicloaltezza:
add $t0,$t0,$a2
lb $t2,($t0)   #leggo elemento su altezza
ble $t2,$v0,noMax
aggiornoMax: 
move $v0,$t2
noMax:
addi $t1,$t1,1
blt $t1,$a1,cicloaltezza
#una volta uscito da ciclo altezza sono su inizio casella per base
#con v0 che conterrà il max temporane della altezza
li $t1,0
ciclobase:
addi $t0,$t0,-1
lb $t2,($t0)
ble $t2,$v0,noMax1
aggiornoMax1: move $v0,$t2
noMax1:
addi $t1,$t1,1
blt $t1,$a1,ciclobase

#stesso procedimento ciclo ipotenusa tolgo il valore di a2-1 per trovare cella sopra nella diagonale dell'ipotenusa
li $t1,0
cicloipotenusa:
sub  $t0,$t0,$a2
addi $t0,$t0,1
lb $t2,($t0)
ble $t2,$v0,noMax2
aggiornoMax2:
move $v0,$t2
noMax2:
addi $t1,$t1,1
blt $t1,$a1,cicloipotenusa
jr $ra
.end maxInTriangolo





