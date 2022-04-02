.data
s0:	.byte 72 , 101 , 108 , 108 , 111 , 44 , 32 , 119 , 111 , 114 , 108 , 100 , 33 , 10 
	.align 2 
.text
       	.globl main
main:
	addiu	$sp,$sp,-4
	la	$t9,s0
	li	$t8,0
	li	$t7,14
prints_begin_0:
	lb	$a0,0($t9)
	beq	$t8,$t7,prints_exit_0
	li	$v0,11
	syscall
	addi	$t8,$t8,1
	addi	$t9,$t9,1
	j	prints_begin_0
prints_exit_0:
	addiu	$sp,$sp,4
	li	$v0,10
	syscall
