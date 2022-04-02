.data
_j:.word 0
.data
_i:.word 0
.text
       	.globl main
main:
	addiu	$sp,$sp,-4
	li	$t9,12
	sw	$t9,_j
	addiu	$sp,$sp,0
	jal	_foo
	addiu	$sp,$sp,0
	move	$t9,$v0
	li	$t9,2
	lw	$t8,_i
	subu	$t7,$t8,$t9
	lw	$t9,_j
	bne	$t7,$0,divNorm
.data
err0:
.asciiz	"Error: division by zero on line 6\n"
.text
	la	$a0,err0
	li	$v0,4
	syscall
	li	$v0,10
	syscall
divNorm:
	div	$t8,$t9,$t7
	move	$a0,$t8
	li	$v0,1
	syscall
	addiu	$sp,$sp,4
	li	$v0,10
	syscall
.text
_foo:
	addiu	$sp,$sp,-4
	sw	$ra,0($sp)
	li	$t9,2
	sw	$t9,_i
_foo_end:
	lw	$ra,0($sp)
	addiu	$sp,$sp,4
	jr	$ra
