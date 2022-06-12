.text
       	.globl main
main:
	addiu	$sp,$sp,-8
loop0:
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
	li	$t9,1
	subu	$t8,$0,$t9
	lw	$t9,4($sp)
	sne	$t7,$t9,$t8
	beq	$t7,$0,intermediate_while0
	j	intermediate_endwhile0
intermediate_while0:
	j	while0
intermediate_endwhile0:
	lw	$t9,4($sp)
	move	$a0,$t9
	li	$v0,11
	syscall
	j	loop0
while0:
	addiu	$sp,$sp,8
	li	$v0,10
	syscall
