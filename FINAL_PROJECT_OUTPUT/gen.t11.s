.data
_i1:.word 0
.data
_b1:.word 0
.data
s0:	.byte 10 , 40 , 105 , 116 , 39 , 115 , 32 , 111 , 107 , 32 , 105 , 102 , 32 , 116 , 104 , 101 , 32 , 102 , 111 , 108 , 108 , 111 , 119 , 105 , 110 , 103 , 32 , 97 , 114 , 101 , 110 , 39 , 116 , 32 , 48 , 47 , 102 , 97 , 108 , 115 , 101 , 41 , 10 
	.align 2 
.data
s1:	.byte 9 , 108 , 111 , 99 , 97 , 108 , 32 , 105 , 110 , 116 , 32 , 100 , 101 , 102 , 97 , 117 , 108 , 116 , 32 , 118 , 97 , 108 , 117 , 101 , 58 , 32 
	.align 2 
.data
s2:	.byte 10 
	.align 2 
.data
s3:	.byte 9 , 108 , 111 , 99 , 97 , 108 , 32 , 98 , 111 , 111 , 108 , 101 , 97 , 110 , 32 , 100 , 101 , 102 , 97 , 117 , 108 , 116 , 32 , 118 , 97 , 108 , 117 , 101 , 58 , 32 
	.align 2 
.data
s4:	.byte 10 
	.align 2 
.data
s5:	.byte 103 , 108 , 111 , 98 , 97 , 108 , 32 , 105 , 110 , 116 , 32 , 100 , 101 , 102 , 97 , 117 , 108 , 116 , 32 , 118 , 97 , 108 , 117 , 101 , 58 , 32 
	.align 2 
.data
s6:	.byte 10 
	.align 2 
.data
s7:	.byte 103 , 108 , 111 , 98 , 97 , 108 , 32 , 98 , 111 , 111 , 108 , 101 , 97 , 110 , 32 , 100 , 101 , 102 , 97 , 117 , 108 , 116 , 32 , 118 , 97 , 108 , 117 , 101 , 58 , 32 
	.align 2 
.data
s8:	.byte 10 
	.align 2 
.text
_foo:
	addiu	$sp,$sp,-12
	sw	$ra,0($sp)
	la	$t9,s0
	li	$t8,0
	li	$t7,43
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
	li	$t7,26
prints_begin_1:
	lb	$a0,0($t9)
	beq	$t8,$t7,prints_exit_1
	li	$v0,11
	syscall
	addi	$t8,$t8,1
	addi	$t9,$t9,1
	j	prints_begin_1
prints_exit_1:
	lw	$t9,4($sp)
	move	$a0,$t9
	li	$v0,1
	syscall
	la	$t9,s2
	li	$t8,0
	li	$t7,1
prints_begin_2:
	lb	$a0,0($t9)
	beq	$t8,$t7,prints_exit_2
	li	$v0,11
	syscall
	addi	$t8,$t8,1
	addi	$t9,$t9,1
	j	prints_begin_2
prints_exit_2:
	la	$t9,s3
	li	$t8,0
	li	$t7,30
prints_begin_3:
	lb	$a0,0($t9)
	beq	$t8,$t7,prints_exit_3
	li	$v0,11
	syscall
	addi	$t8,$t8,1
	addi	$t9,$t9,1
	j	prints_begin_3
prints_exit_3:
	lw	$t9,8($sp)
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
	la	$t9,s4
	li	$t8,0
	li	$t7,1
prints_begin_4:
	lb	$a0,0($t9)
	beq	$t8,$t7,prints_exit_4
	li	$v0,11
	syscall
	addi	$t8,$t8,1
	addi	$t9,$t9,1
	j	prints_begin_4
prints_exit_4:
	li	$t9,123
	sw	$t9,4($sp)
	li	$t9,1
	sw	$t9,8($sp)
_foo_end:
	lw	$ra,0($sp)
	addiu	$sp,$sp,12
	jr	$ra
.text
       	.globl main
main:
	addiu	$sp,$sp,-4
	la	$t9,s5
	li	$t8,0
	li	$t7,26
prints_begin_5:
	lb	$a0,0($t9)
	beq	$t8,$t7,prints_exit_5
	li	$v0,11
	syscall
	addi	$t8,$t8,1
	addi	$t9,$t9,1
	j	prints_begin_5
prints_exit_5:
	lw	$t9,_i1
	move	$a0,$t9
	li	$v0,1
	syscall
	la	$t9,s6
	li	$t8,0
	li	$t7,1
prints_begin_6:
	lb	$a0,0($t9)
	beq	$t8,$t7,prints_exit_6
	li	$v0,11
	syscall
	addi	$t8,$t8,1
	addi	$t9,$t9,1
	j	prints_begin_6
prints_exit_6:
	la	$t9,s7
	li	$t8,0
	li	$t7,30
prints_begin_7:
	lb	$a0,0($t9)
	beq	$t8,$t7,prints_exit_7
	li	$v0,11
	syscall
	addi	$t8,$t8,1
	addi	$t9,$t9,1
	j	prints_begin_7
prints_exit_7:
	lw	$t9,_b1
	move	$a0,$t9
	bne	$a0,$0,print_b_else1
.data
s_print_b_false1:	.asciiz "false" 
.text
	la	$a0,s_print_b_false1
	j	print_b_end1
print_b_else1:
.data
s_print_b_true1:	.asciiz "true" 
.text
	la	$a0,s_print_b_true1
print_b_end1:
	li	$v0,4
	syscall
	la	$t9,s8
	li	$t8,0
	li	$t7,1
prints_begin_8:
	lb	$a0,0($t9)
	beq	$t8,$t7,prints_exit_8
	li	$v0,11
	syscall
	addi	$t8,$t8,1
	addi	$t9,$t9,1
	j	prints_begin_8
prints_exit_8:
	addiu	$sp,$sp,0
	jal	_foo
	addiu	$sp,$sp,0
	move	$t9,$v0
	addiu	$sp,$sp,0
	jal	_foo
	addiu	$sp,$sp,0
	move	$t9,$v0
	addiu	$sp,$sp,4
	li	$v0,10
	syscall
