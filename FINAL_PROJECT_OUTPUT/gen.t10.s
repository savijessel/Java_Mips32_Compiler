.data
s0:	.byte 102 , 105 , 98 , 40 
	.align 2 
.data
s1:	.byte 41 , 32 , 61 , 32 
	.align 2 
.data
s2:	.byte 10 
	.align 2 
.text
       	.globl main
main:
	addiu	$sp,$sp,-8
	li	$t9,0
	sw	$t9,4($sp)
loop0:
	li	$t9,46
	lw	$t8,4($sp)
	sle	$t7,$t8,$t9
	beq	$t7,$0,intermediate_while0
	j	intermediate_endwhile0
intermediate_while0:
	j	while0
intermediate_endwhile0:
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
	lw	$t9,4($sp)
	move	$a0,$t9
	li	$v0,1
	syscall
	la	$t9,s1
	li	$t8,0
	li	$t7,4
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
	addiu	$sp,$sp,0
	jal	_fib
	addiu	$sp,$sp,0
	move	$t9,$v0
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
	li	$t9,1
	lw	$t8,4($sp)
	addu	$t7,$t8,$t9
	sw	$t7,4($sp)
	j	loop0
while0:
	addiu	$sp,$sp,8
	li	$v0,10
	syscall
.text
_fib:
	addiu	$sp,$sp,-8
	sw	$ra,0($sp)
	sw	$a0,4($sp)
	li	$t9,0
	lw	$t8,4($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_if0
	j	intermediate_endif0
intermediate_if0:
	j	if0
intermediate_endif0:
	li	$t9,0
	move	$v0,$t9
	j	_fib_end
if0:
	li	$t9,1
	lw	$t8,4($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_if1
	j	intermediate_endif1
intermediate_if1:
	j	if1
intermediate_endif1:
	li	$t9,1
	move	$v0,$t9
	j	_fib_end
if1:
	li	$t9,1
	lw	$t8,4($sp)
	subu	$t7,$t8,$t9
	move	$a0,$t7
	addiu	$sp,$sp,-4
	sw	$t7,0($sp)
	jal	_fib
	lw	$t7,0($sp)
	addiu	$sp,$sp,4
	move	$t9,$v0
	li	$t8,2
	lw	$t7,4($sp)
	subu	$t6,$t7,$t8
	move	$a0,$t6
	addiu	$sp,$sp,-8
	sw	$t9,0($sp)
	sw	$t6,4($sp)
	jal	_fib
	lw	$t9,0($sp)
	lw	$t6,4($sp)
	addiu	$sp,$sp,8
	move	$t8,$v0
	addu	$t7,$t9,$t8
	move	$v0,$t7
	j	_fib_end
.data
err0:
.asciiz	"Error: function 'fib' must return a value\n"
.text
	la	$a0,err0
	li	$v0,4
	syscall
	li	$v0,10
	syscall
_fib_end:
	lw	$ra,0($sp)
	addiu	$sp,$sp,8
	jr	$ra
