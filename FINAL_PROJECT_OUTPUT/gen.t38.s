.data
_i:.word 0
.text
_bar:
	addiu	$sp,$sp,-4
	sw	$ra,0($sp)
	li	$t9,12345
	sw	$t9,_i
_bar_end:
	lw	$ra,0($sp)
	addiu	$sp,$sp,4
	jr	$ra
.text
       	.globl main
main:
	addiu	$sp,$sp,-8
	addiu	$sp,$sp,0
	jal	_bar
	addiu	$sp,$sp,0
	move	$t9,$v0
	lw	$t9,_i
	move	$a0,$t9
	li	$v0,1
	syscall
	li	$t9,0
	sw	$t9,4($sp)
	lw	$t9,4($sp)
	move	$a0,$t9
	bne	$a0,$0,print_b_else0
.data
s_print_b_false0:	.asciiz "false" 
.text
	la	$a0,s_print_b_false0
	j	print_b_end0
print_b_else0:
.data
s_print_b_true0:	.asciiz "true" 
.text
	la	$a0,s_print_b_true0
print_b_end0:
	li	$v0,4
	syscall
	addiu	$sp,$sp,8
	li	$v0,10
	syscall
