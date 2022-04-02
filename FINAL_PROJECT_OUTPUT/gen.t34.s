.data
_d:.word 0
.data
s0:	.byte 10 
	.align 2 
.text
_foo:
	addiu	$sp,$sp,-20
	sw	$ra,0($sp)
	sw	$a0,4($sp)
	sw	$a1,8($sp)
	sw	$a2,12($sp)
	sw	$a3,16($sp)
	lw	$t9,4($sp)
	lw	$t8,8($sp)
	mul	$t7,$t9,$t8
	lw	$t9,12($sp)
	mul	$t8,$t7,$t9
	lw	$t9,16($sp)
	mul	$t7,$t8,$t9
	move	$v0,$t7
	j	_foo_end
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
	addiu	$sp,$sp,20
	jr	$ra
.text
_bar:
	addiu	$sp,$sp,-16
	sw	$ra,0($sp)
	sw	$a0,4($sp)
	sw	$a1,8($sp)
	sw	$a2,12($sp)
	li	$t9,3
	lw	$t8,_d
	subu	$t7,$t8,$t9
	lw	$t9,4($sp)
	move	$a0,$t9
	lw	$t9,8($sp)
	move	$a1,$t9
	lw	$t9,12($sp)
	move	$a2,$t9
	move	$a3,$t7
	addiu	$sp,$sp,-4
	sw	$t7,0($sp)
	jal	_foo
	lw	$t7,0($sp)
	addiu	$sp,$sp,4
	move	$t9,$v0
	move	$v0,$t9
	j	_bar_end
.data
err1:
.asciiz	"Error: Non-void function bar must return a value\n"
.text
	la	$a0,err1
	li	$v0,4
	syscall
	li	$v0,10
	syscall
_bar_end:
	lw	$ra,0($sp)
	addiu	$sp,$sp,16
	jr	$ra
.text
_baz:
	addiu	$sp,$sp,-8
	sw	$ra,0($sp)
	sw	$a0,4($sp)
	li	$t9,1
	lw	$t8,_d
	addu	$t7,$t8,$t9
	sw	$t7,_d
	lw	$t9,4($sp)
	move	$v0,$t9
	j	_baz_end
.data
err2:
.asciiz	"Error: Non-void function baz must return a value\n"
.text
	la	$a0,err2
	li	$v0,4
	syscall
	li	$v0,10
	syscall
_baz_end:
	lw	$ra,0($sp)
	addiu	$sp,$sp,8
	jr	$ra
.text
       	.globl main
main:
	addiu	$sp,$sp,-4
	li	$t9,10
	sw	$t9,_d
	li	$t9,1
	li	$t8,2
	li	$t7,3
	move	$a0,$t7
	addiu	$sp,$sp,-12
	sw	$t9,0($sp)
	sw	$t8,4($sp)
	sw	$t7,8($sp)
	jal	_baz
	lw	$t9,0($sp)
	lw	$t8,4($sp)
	lw	$t7,8($sp)
	addiu	$sp,$sp,12
	move	$t7,$v0
	li	$t6,4
	move	$a0,$t8
	move	$a1,$t7
	move	$a2,$t6
	addiu	$sp,$sp,-16
	sw	$t9,0($sp)
	sw	$t8,4($sp)
	sw	$t7,8($sp)
	sw	$t6,12($sp)
	jal	_bar
	lw	$t9,0($sp)
	lw	$t8,4($sp)
	lw	$t7,8($sp)
	lw	$t6,12($sp)
	addiu	$sp,$sp,16
	move	$t8,$v0
	li	$t7,5
	li	$t6,6
	move	$a0,$t6
	addiu	$sp,$sp,-16
	sw	$t9,0($sp)
	sw	$t8,4($sp)
	sw	$t7,8($sp)
	sw	$t6,12($sp)
	jal	_baz
	lw	$t9,0($sp)
	lw	$t8,4($sp)
	lw	$t7,8($sp)
	lw	$t6,12($sp)
	addiu	$sp,$sp,16
	move	$t6,$v0
	li	$t5,7
	move	$a0,$t7
	move	$a1,$t6
	move	$a2,$t5
	addiu	$sp,$sp,-20
	sw	$t9,0($sp)
	sw	$t8,4($sp)
	sw	$t7,8($sp)
	sw	$t6,12($sp)
	sw	$t5,16($sp)
	jal	_bar
	lw	$t9,0($sp)
	lw	$t8,4($sp)
	lw	$t7,8($sp)
	lw	$t6,12($sp)
	lw	$t5,16($sp)
	addiu	$sp,$sp,20
	move	$t7,$v0
	li	$t6,8
	move	$a0,$t6
	addiu	$sp,$sp,-16
	sw	$t9,0($sp)
	sw	$t8,4($sp)
	sw	$t7,8($sp)
	sw	$t6,12($sp)
	jal	_baz
	lw	$t9,0($sp)
	lw	$t8,4($sp)
	lw	$t7,8($sp)
	lw	$t6,12($sp)
	addiu	$sp,$sp,16
	move	$t6,$v0
	move	$a0,$t9
	move	$a1,$t8
	move	$a2,$t7
	move	$a3,$t6
	addiu	$sp,$sp,-16
	sw	$t9,0($sp)
	sw	$t8,4($sp)
	sw	$t7,8($sp)
	sw	$t6,12($sp)
	jal	_foo
	lw	$t9,0($sp)
	lw	$t8,4($sp)
	lw	$t7,8($sp)
	lw	$t6,12($sp)
	addiu	$sp,$sp,16
	move	$t9,$v0
	move	$a0,$t9
	li	$v0,1
	syscall
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
	addiu	$sp,$sp,4
	li	$v0,10
	syscall
