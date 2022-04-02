.data
s0:	.byte 97 , 115 , 100 , 102 
	.align 2 
.data
s1:	.byte 8 , 9 , 10 , 12 , 13 , 34 , 39 , 92 
	.align 2 
.data
s2:	.byte 1 , 26 
	.align 2 
.data
s3:	.byte 0 , 32 , 97 , 115 , 100 , 102 
	.align 2 
.text
       	.globl main
main:
	addiu	$sp,$sp,-4
	la	$t9,s0
	li	$t8,0
	li	$t7,4
prints_begin_0:
	lb	$a0,0($t9)
	beq	$t8,$t7,prints_exit_0
	li	$v0,11
	syscall
	addi	$t8,$t8,1
	addi	$t9,$t9,1
	j	prints_begin_0
prints_exit_0:
	la	$t9,s1
	li	$t8,0
	li	$t7,9
prints_begin_1:
	lb	$a0,0($t9)
	beq	$t8,$t7,prints_exit_1
	li	$v0,11
	syscall
	addi	$t8,$t8,1
	addi	$t9,$t9,1
	j	prints_begin_1
prints_exit_1:
	la	$t9,s2
	li	$t8,0
	li	$t7,2
prints_begin_2:
	lb	$a0,0($t9)
	beq	$t8,$t7,prints_exit_2
	li	$v0,11
	syscall
	addi	$t8,$t8,1
	addi	$t9,$t9,1
	j	prints_begin_2
prints_exit_2:
	li	$t9,1
	beq	$t9,$0,intermediate_if0
	j	intermediate_endif0
intermediate_if0:
	j	if0
intermediate_endif0:
	la	$t9,s3
	li	$t8,0
	li	$t7,6
prints_begin_3:
	lb	$a0,0($t9)
	beq	$t8,$t7,prints_exit_3
	li	$v0,11
	syscall
	addi	$t8,$t8,1
	addi	$t9,$t9,1
	j	prints_begin_3
prints_exit_3:
if0:
	li	$t9,0
	move	$a0,$t9
	li	$v0,11
	syscall
	addiu	$sp,$sp,4
	li	$v0,10
	syscall
