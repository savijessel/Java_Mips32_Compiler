.data
s0:	.byte 32 , 61 , 32 , 10 
	.align 2 
.data
s1:	.byte 9 
	.align 2 
.data
s2:	.byte 32 , 40 , 98 , 97 , 115 , 101 , 32 , 50 , 41 , 10 
	.align 2 
.data
s3:	.byte 9 
	.align 2 
.data
s4:	.byte 32 , 40 , 98 , 97 , 115 , 101 , 32 , 56 , 41 , 10 
	.align 2 
.data
s5:	.byte 9 
	.align 2 
.data
s6:	.byte 32 , 40 , 98 , 97 , 115 , 101 , 32 , 49 , 48 , 41 , 10 
	.align 2 
.text
_convert:
	addiu	$sp,$sp,-12
	sw	$ra,0($sp)
	sw	$a0,4($sp)
	sw	$a1,8($sp)
	li	$t9,0
	lw	$t8,4($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_if0
	j	intermediate_endif0
intermediate_if0:
	j	if0
intermediate_endif0:
	li	$t9,0
	move	$a0,$t9
	li	$v0,1
	syscall
	j	_convert_end
if0:
	lw	$t9,4($sp)
	lw	$t8,8($sp)
	bne	$t8,$0,divNorm
.data
err0:
.asciiz	"Error: division by zero\n"
.text
	la	$a0,err0
	li	$v0,4
	syscall
	li	$v0,10
	syscall
divNorm:
	div	$t7,$t9,$t8
	move	$a0,$t7
	lw	$t9,8($sp)
	move	$a1,$t9
	addiu	$sp,$sp,-4
	sw	$t7,0($sp)
	jal	_convert
	lw	$t7,0($sp)
	addiu	$sp,$sp,4
	move	$t9,$v0
	lw	$t9,4($sp)
	lw	$t8,8($sp)
	rem	$t7,$t9,$t8
	move	$a0,$t7
	li	$v0,1
	syscall
_convert_end:
	lw	$ra,0($sp)
	addiu	$sp,$sp,12
	jr	$ra
.text
_do:
	addiu	$sp,$sp,-8
	sw	$ra,0($sp)
	sw	$a0,4($sp)
	lw	$t9,4($sp)
	move	$a0,$t9
	li	$v0,1
	syscall
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
	li	$t9,2
	lw	$t8,4($sp)
	move	$a0,$t8
	move	$a1,$t9
	addiu	$sp,$sp,-4
	sw	$t9,0($sp)
	jal	_convert
	lw	$t9,0($sp)
	addiu	$sp,$sp,4
	move	$t9,$v0
	la	$t9,s2
	li	$t8,0
	li	$t7,10
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
	li	$t7,1
prints_begin_3:
	lb	$a0,0($t9)
	beq	$t8,$t7,prints_exit_3
	li	$v0,11
	syscall
	addi	$t8,$t8,1
	addi	$t9,$t9,1
	j	prints_begin_3
prints_exit_3:
	li	$t9,8
	lw	$t8,4($sp)
	move	$a0,$t8
	move	$a1,$t9
	addiu	$sp,$sp,-4
	sw	$t9,0($sp)
	jal	_convert
	lw	$t9,0($sp)
	addiu	$sp,$sp,4
	move	$t9,$v0
	la	$t9,s4
	li	$t8,0
	li	$t7,10
prints_begin_4:
	lb	$a0,0($t9)
	beq	$t8,$t7,prints_exit_4
	li	$v0,11
	syscall
	addi	$t8,$t8,1
	addi	$t9,$t9,1
	j	prints_begin_4
prints_exit_4:
	la	$t9,s5
	li	$t8,0
	li	$t7,1
prints_begin_5:
	lb	$a0,0($t9)
	beq	$t8,$t7,prints_exit_5
	li	$v0,11
	syscall
	addi	$t8,$t8,1
	addi	$t9,$t9,1
	j	prints_begin_5
prints_exit_5:
	li	$t9,10
	lw	$t8,4($sp)
	move	$a0,$t8
	move	$a1,$t9
	addiu	$sp,$sp,-4
	sw	$t9,0($sp)
	jal	_convert
	lw	$t9,0($sp)
	addiu	$sp,$sp,4
	move	$t9,$v0
	la	$t9,s6
	li	$t8,0
	li	$t7,11
prints_begin_6:
	lb	$a0,0($t9)
	beq	$t8,$t7,prints_exit_6
	li	$v0,11
	syscall
	addi	$t8,$t8,1
	addi	$t9,$t9,1
	j	prints_begin_6
prints_exit_6:
_do_end:
	lw	$ra,0($sp)
	addiu	$sp,$sp,8
	jr	$ra
.text
       	.globl main
main:
	addiu	$sp,$sp,-4
	li	$t9,0
	move	$a0,$t9
	addiu	$sp,$sp,-4
	sw	$t9,0($sp)
	jal	_do
	lw	$t9,0($sp)
	addiu	$sp,$sp,4
	move	$t9,$v0
	li	$t9,17
	move	$a0,$t9
	addiu	$sp,$sp,-4
	sw	$t9,0($sp)
	jal	_do
	lw	$t9,0($sp)
	addiu	$sp,$sp,4
	move	$t9,$v0
	li	$t9,42
	move	$a0,$t9
	addiu	$sp,$sp,-4
	sw	$t9,0($sp)
	jal	_do
	lw	$t9,0($sp)
	addiu	$sp,$sp,4
	move	$t9,$v0
	addiu	$sp,$sp,4
	li	$v0,10
	syscall
