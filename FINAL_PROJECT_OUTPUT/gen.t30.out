.text
_foo:
	addiu	$sp,$sp,-8
	sw	$ra,0($sp)
	sw	$a0,4($sp)
	lw	$t9,4($sp)
	lw	$t8,4($sp)
	mul	$t7,$t9,$t8
	li	$t9,0
	slt	$t8,$t7,$t9
	beq	$t8,$0,intermediate_if0
	j	intermediate_endif0
intermediate_if0:
	j	if0
intermediate_endif0:
	li	$t9,123
	move	$v0,$t9
	j	_foo_end
if0:
.data
err0:
.asciiz	"Error: Non-void function foo must return a value\n"
.text
	la	$a0,err0
	li	$v0,4
	syscall
	li	$v0,10
	syscall
_foo_end:
	lw	$ra,0($sp)
	addiu	$sp,$sp,8
	jr	$ra
.text
       	.globl main
main:
	addiu	$sp,$sp,-4
	li	$t9,1
	subu	$t8,$0,$t9
	move	$a0,$t8
	addiu	$sp,$sp,-4
	sw	$t8,0($sp)
	jal	_foo
	lw	$t8,0($sp)
	addiu	$sp,$sp,4
	move	$t9,$v0
	addiu	$sp,$sp,4
	li	$v0,10
	syscall
