.data
s0:	.byte 10 
	.align 2 
.text
_nl:
	addiu	$sp,$sp,-4
	sw	$ra,0($sp)
	la	$t9,s0
	li	$t8,0
	li	$t7,1
prints_begin_0:
	lb	$a0,0($t9)
	beq	$t8,$t7,prints_exit_0
	li	$v0,11
	syscall
	addi	$t8,$t8,1
	addi	$t9,$t9,1
	j	prints_begin_0
prints_exit_0:
_nl_end:
	lw	$ra,0($sp)
	addiu	$sp,$sp,4
	jr	$ra
.text
       	.globl main
main:
	addiu	$sp,$sp,-4
	li	$t9,123
	subu	$t8,$0,$t9
	move	$a0,$t8
	li	$v0,1
	syscall
	addiu	$sp,$sp,0
	jal	_nl
	addiu	$sp,$sp,0
	move	$t9,$v0
	li	$t9,2147483648
	subu	$t8,$0,$t9
	move	$a0,$t8
	li	$v0,1
	syscall
	addiu	$sp,$sp,0
	jal	_nl
	addiu	$sp,$sp,0
	move	$t9,$v0
	li	$t9,2147483648
	subu	$t8,$0,$t9
	subu	$t9,$0,$t8
	move	$a0,$t9
	li	$v0,1
	syscall
	addiu	$sp,$sp,0
	jal	_nl
	addiu	$sp,$sp,0
	move	$t9,$v0
	li	$t9,2147483648
	subu	$t8,$0,$t9
	subu	$t9,$0,$t8
	subu	$t8,$0,$t9
	move	$a0,$t8
	li	$v0,1
	syscall
	addiu	$sp,$sp,0
	jal	_nl
	addiu	$sp,$sp,0
	move	$t9,$v0
	addiu	$sp,$sp,4
	li	$v0,10
	syscall
