.data
s0:	.byte 102 , 105 , 98 , 40 , 48 , 41 , 32 , 61 , 32 , 48 , 10 
	.align 2 
.data
s1:	.byte 102 , 105 , 98 , 40 , 49 , 41 , 32 , 61 , 32 , 49 , 10 
	.align 2 
.data
s2:	.byte 102 , 105 , 98 , 40 
	.align 2 
.data
s3:	.byte 41 , 32 , 61 , 32 
	.align 2 
.data
s4:	.byte 10 
	.align 2 
.text
       	.globl main
main:
	addiu	$sp,$sp,-20
	li	$t9,2
	sw	$t9,4($sp)
	li	$t9,1
	sw	$t9,12($sp)
	li	$t9,0
	sw	$t9,16($sp)
	la	$t9,s0
	li	$t8,0
	li	$t7,11
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
	li	$t7,11
prints_begin_1:
	lb	$a0,0($t9)
	beq	$t8,$t7,prints_exit_1
	li	$v0,11
	syscall
	addi	$t8,$t8,1
	addi	$t9,$t9,1
	j	prints_begin_1
prints_exit_1:
loop0:
	li	$t9,47
	lw	$t8,4($sp)
	slt	$t7,$t8,$t9
	beq	$t7,$0,intermediate_while0
	j	intermediate_endwhile0
intermediate_while0:
	j	while0
intermediate_endwhile0:
	la	$t9,s2
	li	$t8,0
	li	$t7,4
prints_begin_2:
	lb	$a0,0($t9)
	beq	$t8,$t7,prints_exit_2
	li	$v0,11
	syscall
	addi	$t8,$t8,1
	addi	$t9,$t9,1
	j	prints_begin_2
prints_exit_2:
	lw	$t9,4($sp)
	move	$a0,$t9
	li	$v0,1
	syscall
	la	$t9,s3
	li	$t8,0
	li	$t7,4
prints_begin_3:
	lb	$a0,0($t9)
	beq	$t8,$t7,prints_exit_3
	li	$v0,11
	syscall
	addi	$t8,$t8,1
	addi	$t9,$t9,1
	j	prints_begin_3
prints_exit_3:
	lw	$t9,12($sp)
	lw	$t8,16($sp)
	addu	$t7,$t9,$t8
	sw	$t7,8($sp)
	lw	$t9,8($sp)
	move	$a0,$t9
	li	$v0,1
	syscall
	lw	$t9,12($sp)
	sw	$t9,16($sp)
	lw	$t9,8($sp)
	sw	$t9,12($sp)
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
	li	$t9,1
	lw	$t8,4($sp)
	addu	$t7,$t8,$t9
	sw	$t7,4($sp)
	j	loop0
while0:
	addiu	$sp,$sp,20
	li	$v0,10
	syscall
