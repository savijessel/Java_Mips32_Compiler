.data
_i:.word 0
.data
_k:.word 0
.text
       	.globl main
main:
	addiu	$sp,$sp,-12
	li	$t9,123
	sw	$t9,_i
	li	$t9,456
	sw	$t9,4($sp)
	li	$t9,789
	sw	$t9,_k
	li	$t9,42
	sw	$t9,_k
	lw	$t9,_k
	sw	$t9,4($sp)
	lw	$t9,4($sp)
	sw	$t9,_i
	li	$t9,10
	sw	$t9,8($sp)
	lw	$t9,_i
	move	$a0,$t9
	li	$v0,1
	syscall
	lw	$t9,8($sp)
	move	$a0,$t9
	li	$v0,11
	syscall
	lw	$t9,4($sp)
	move	$a0,$t9
	li	$v0,1
	syscall
	lw	$t9,8($sp)
	move	$a0,$t9
	li	$v0,11
	syscall
	lw	$t9,_k
	move	$a0,$t9
	li	$v0,1
	syscall
	lw	$t9,8($sp)
	move	$a0,$t9
	li	$v0,11
	syscall
	addiu	$sp,$sp,12
	li	$v0,10
	syscall
