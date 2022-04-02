.data
s0:	.byte 109 , 105 , 110 , 105 , 110 , 116 , 32 , 105 , 115 , 32 
	.align 2 
.data
s1:	.byte 10 
	.align 2 
.text
       	.globl main
main:
	addiu	$sp,$sp,-12
	li	$t9,0
	sw	$t9,4($sp)
	li	$t9,1000000
	sw	$t9,8($sp)
loop0:
	lw	$t9,4($sp)
	lw	$t8,8($sp)
	subu	$t7,$t9,$t8
	lw	$t9,4($sp)
	sgt	$t8,$t9,$t7
	beq	$t8,$0,intermediate_while0
	j	intermediate_endwhile0
intermediate_while0:
	j	while0
intermediate_endwhile0:
	lw	$t9,4($sp)
	lw	$t8,8($sp)
	addu	$t7,$t9,$t8
	sw	$t7,4($sp)
	j	loop0
while0:
	lw	$t9,4($sp)
	lw	$t8,8($sp)
	subu	$t7,$t9,$t8
	sw	$t7,4($sp)
loop1:
	li	$t9,1
	lw	$t8,4($sp)
	subu	$t7,$t8,$t9
	lw	$t9,4($sp)
	sgt	$t8,$t9,$t7
	beq	$t8,$0,intermediate_while1
	j	intermediate_endwhile1
intermediate_while1:
	j	while1
intermediate_endwhile1:
	li	$t9,1
	lw	$t8,4($sp)
	addu	$t7,$t8,$t9
	sw	$t7,4($sp)
	j	loop1
while1:
	la	$t9,s0
	li	$t8,0
	li	$t7,10
prints_begin_0:
	lb	$a0,0($t9)
	beq	$t8,$t7,prints_exit_0
	li	$v0,11
	syscall
	addi	$t8,$t8,1
	addi	$t9,$t9,1
	j	prints_begin_0
prints_exit_0:
	lw	$t9,4($sp)
	move	$a0,$t9
	li	$v0,1
	syscall
	la	$t9,s1
	li	$t8,0
	li	$t7,1
prints_begin_1:
	lb	$a0,0($t9)
	beq	$t8,$t7,prints_exit_1
	li	$v0,11
	syscall
	addi	$t8,$t8,1
	addi	$t9,$t9,1
	j	prints_begin_1
prints_exit_1:
	addiu	$sp,$sp,12
	li	$v0,10
	syscall
