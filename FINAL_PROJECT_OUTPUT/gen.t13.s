.data
_NL:.word 0
.text
_reverse:
	addiu	$sp,$sp,-8
	sw	$ra,0($sp)
	li	$v0,12
	syscall
	sw	$v0,4($sp)
	lw	$t9,4($sp)
	lw	$t8,_NL
	sne	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if0
	j	intermediate_endif0
intermediate_if0:
	j	if0
intermediate_endif0:
	addiu	$sp,$sp,0
	jal	_reverse
	addiu	$sp,$sp,0
	move	$t9,$v0
	lw	$t9,4($sp)
	move	$a0,$t9
	li	$v0,11
	syscall
if0:
_reverse_end:
	lw	$ra,0($sp)
	addiu	$sp,$sp,8
	jr	$ra
.text
       	.globl main
main:
	addiu	$sp,$sp,-4
	li	$t9,10
	sw	$t9,_NL
	addiu	$sp,$sp,0
	jal	_reverse
	addiu	$sp,$sp,0
	move	$t9,$v0
	addiu	$sp,$sp,4
	li	$v0,10
	syscall
