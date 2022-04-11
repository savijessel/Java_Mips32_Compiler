.data
_NL:.word 0
.text
_reverse:
	addiu	$sp,$sp,-8
	sw	$ra,0($sp)
.data
char_0: .space 2
.text
	li	$v0,8
	la	$a0,char_0
	li	$a1,2
	syscall
	la	$t9,char_0
	lb	$t9,0($t9)
	li	$t8,0
	bne	$t9,$t8,char_0_end
	li	$v0,-1
	j	char_0_fin
char_0_end:
	move	$v0,$t9
char_0_fin:
	sw	$v0,4($sp)
	lw	$t7,4($sp)
	lw	$t6,_NL
	sne	$t5,$t7,$t6
	beq	$t5,$0,intermediate_if0
	j	intermediate_endif0
intermediate_if0:
	j	if0
intermediate_endif0:
	addiu	$sp,$sp,-8
	sw	$t9,0($sp)
	sw	$t8,4($sp)
	jal	_reverse
	lw	$t9,0($sp)
	lw	$t8,4($sp)
	addiu	$sp,$sp,8
	move	$t7,$v0
	lw	$t7,4($sp)
	move	$a0,$t7
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
	li	$t7,10
	sw	$t7,_NL
	addiu	$sp,$sp,-8
	sw	$t9,0($sp)
	sw	$t8,4($sp)
	jal	_reverse
	lw	$t9,0($sp)
	lw	$t8,4($sp)
	addiu	$sp,$sp,8
	move	$t7,$v0
	addiu	$sp,$sp,4
	li	$v0,10
	syscall
