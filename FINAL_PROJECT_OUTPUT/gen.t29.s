.data
_a:.word 0
.data
_b:.word 0
.data
_c:.word 0
.data
s0:	.byte 101 , 118 , 97 , 108 , 117 , 97 , 116 , 101 , 100 , 32 , 65 , 10 
	.align 2 
.data
s1:	.byte 101 , 118 , 97 , 108 , 117 , 97 , 116 , 101 , 100 , 32 , 66 , 10 
	.align 2 
.data
s2:	.byte 101 , 118 , 97 , 108 , 117 , 97 , 116 , 101 , 100 , 32 , 67 , 10 
	.align 2 
.data
s3:	.byte 105 , 102 , 32 , 40 , 40 , 65 , 32 , 38 , 38 , 32 , 66 , 41 , 32 , 124 , 124 , 32 , 67 , 41 , 32 , 123 , 46 , 46 , 46 , 125 , 32 , 101 , 108 , 115 , 101 , 32 , 123 , 46 , 46 , 46 , 125 , 44 , 32 , 119 , 105 , 116 , 104 , 32 , 65 , 61 
	.align 2 
.data
s4:	.byte 32 , 66 , 61 
	.align 2 
.data
s5:	.byte 32 , 67 , 61 
	.align 2 
.data
s6:	.byte 10 
	.align 2 
.data
s7:	.byte 105 , 102 , 45 , 112 , 97 , 114 , 116 , 32 , 101 , 120 , 101 , 99 , 117 , 116 , 101 , 100 , 10 
	.align 2 
.data
s8:	.byte 101 , 108 , 115 , 101 , 45 , 112 , 97 , 114 , 116 , 32 , 101 , 120 , 101 , 99 , 117 , 116 , 101 , 100 , 10 
	.align 2 
.data
s9:	.byte 120 , 32 , 61 , 32 , 40 , 65 , 32 , 38 , 38 , 32 , 33 , 66 , 41 , 32 , 124 , 124 , 32 , 67 , 44 , 32 , 119 , 105 , 116 , 104 , 32 , 65 , 61 
	.align 2 
.data
s10:	.byte 32 , 66 , 61 
	.align 2 
.data
s11:	.byte 32 , 67 , 61 
	.align 2 
.data
s12:	.byte 10 
	.align 2 
.data
s13:	.byte 120 , 61 
	.align 2 
.data
s14:	.byte 10 
	.align 2 
.data
s15:	.byte 10 
	.align 2 
.data
s16:	.byte 10 
	.align 2 
.data
s17:	.byte 10 
	.align 2 
.data
s18:	.byte 10 
	.align 2 
.data
s19:	.byte 10 
	.align 2 
.data
s20:	.byte 10 
	.align 2 
.data
s21:	.byte 10 
	.align 2 
.data
s22:	.byte 10 
	.align 2 
.data
s23:	.byte 10 
	.align 2 
.data
s24:	.byte 10 
	.align 2 
.data
s25:	.byte 10 
	.align 2 
.data
s26:	.byte 10 
	.align 2 
.data
s27:	.byte 10 
	.align 2 
.data
s28:	.byte 10 
	.align 2 
.data
s29:	.byte 10 
	.align 2 
.text
_A:
	addiu	$sp,$sp,-4
	sw	$ra,0($sp)
	la	$t9,s0
	li	$t8,0
	li	$t7,12
prints_begin_0:
	lb	$a0,0($t9)
	beq	$t8,$t7,prints_exit_0
	li	$v0,11
	syscall
	addi	$t8,$t8,1
	addi	$t9,$t9,1
	j	prints_begin_0
prints_exit_0:
	lw	$t9,_a
	move	$v0,$t9
	j	_A_end
.data
err0:
.asciiz	"Error: function 'A' must return a value\n"
.text
	la	$a0,err0
	li	$v0,4
	syscall
	li	$v0,10
	syscall
_A_end:
	lw	$ra,0($sp)
	addiu	$sp,$sp,4
	jr	$ra
.text
_B:
	addiu	$sp,$sp,-4
	sw	$ra,0($sp)
	la	$t9,s1
	li	$t8,0
	li	$t7,12
prints_begin_1:
	lb	$a0,0($t9)
	beq	$t8,$t7,prints_exit_1
	li	$v0,11
	syscall
	addi	$t8,$t8,1
	addi	$t9,$t9,1
	j	prints_begin_1
prints_exit_1:
	lw	$t9,_b
	move	$v0,$t9
	j	_B_end
.data
err1:
.asciiz	"Error: function 'B' must return a value\n"
.text
	la	$a0,err1
	li	$v0,4
	syscall
	li	$v0,10
	syscall
_B_end:
	lw	$ra,0($sp)
	addiu	$sp,$sp,4
	jr	$ra
.text
_C:
	addiu	$sp,$sp,-4
	sw	$ra,0($sp)
	la	$t9,s2
	li	$t8,0
	li	$t7,12
prints_begin_2:
	lb	$a0,0($t9)
	beq	$t8,$t7,prints_exit_2
	li	$v0,11
	syscall
	addi	$t8,$t8,1
	addi	$t9,$t9,1
	j	prints_begin_2
prints_exit_2:
	lw	$t9,_c
	move	$v0,$t9
	j	_C_end
.data
err2:
.asciiz	"Error: function 'C' must return a value\n"
.text
	la	$a0,err2
	li	$v0,4
	syscall
	li	$v0,10
	syscall
_C_end:
	lw	$ra,0($sp)
	addiu	$sp,$sp,4
	jr	$ra
.text
_eval:
	addiu	$sp,$sp,-16
	sw	$ra,0($sp)
	sw	$a0,4($sp)
	sw	$a1,8($sp)
	sw	$a2,12($sp)
	lw	$t9,4($sp)
	sw	$t9,_a
	lw	$t9,8($sp)
	sw	$t9,_b
	lw	$t9,12($sp)
	sw	$t9,_c
	la	$t9,s3
	li	$t8,0
	li	$t7,44
prints_begin_3:
	lb	$a0,0($t9)
	beq	$t8,$t7,prints_exit_3
	li	$v0,11
	syscall
	addi	$t8,$t8,1
	addi	$t9,$t9,1
	j	prints_begin_3
prints_exit_3:
	lw	$t9,_a
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
	li	$t7,3
prints_begin_4:
	lb	$a0,0($t9)
	beq	$t8,$t7,prints_exit_4
	li	$v0,11
	syscall
	addi	$t8,$t8,1
	addi	$t9,$t9,1
	j	prints_begin_4
prints_exit_4:
	lw	$t9,_b
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
	la	$t9,s5
	li	$t8,0
	li	$t7,3
prints_begin_5:
	lb	$a0,0($t9)
	beq	$t8,$t7,prints_exit_5
	li	$v0,11
	syscall
	addi	$t8,$t8,1
	addi	$t9,$t9,1
	j	prints_begin_5
prints_exit_5:
	lw	$t9,_c
	move	$a0,$t9
	bne	$a0,$0,print_b_else2
.data
s_print_b_false2:	.asciiz "false" 
.text
	la	$a0,s_print_b_false2
	j	print_b_end2
print_b_else2:
.data
s_print_b_true2:	.asciiz "true" 
.text
	la	$a0,s_print_b_true2
print_b_end2:
	li	$v0,4
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
	addiu	$sp,$sp,0
	jal	_A
	addiu	$sp,$sp,0
	move	$t9,$v0
	beq	$t9,$0,and_left_false2
	addiu	$sp,$sp,-8
	sw	$t9,0($sp)
	sw	$t8,4($sp)
	jal	_B
	lw	$t9,0($sp)
	lw	$t8,4($sp)
	addiu	$sp,$sp,8
	move	$t7,$v0
	move	$t8,$t7
	j	and_end2
and_left_false2:
	li	$t8,0
and_end2:
	bne	$t8,$0,or_left_true1
	addiu	$sp,$sp,-8
	sw	$t9,0($sp)
	sw	$t8,4($sp)
	jal	_C
	lw	$t9,0($sp)
	lw	$t8,4($sp)
	addiu	$sp,$sp,8
	move	$t7,$v0
	move	$t9,$t7
	j	or_end1
or_left_true1:
	li	$t9,1
or_end1:
	beq	$t9,$0,intermediate_elseIf0
	j	intermediate_endelseIf0
intermediate_elseIf0:
	j	elseIf0
intermediate_endelseIf0:
	la	$t9,s7
	li	$t8,0
	li	$t7,17
prints_begin_7:
	lb	$a0,0($t9)
	beq	$t8,$t7,prints_exit_7
	li	$v0,11
	syscall
	addi	$t8,$t8,1
	addi	$t9,$t9,1
	j	prints_begin_7
prints_exit_7:
	j	if0
elseIf0:
	la	$t9,s8
	li	$t8,0
	li	$t7,19
prints_begin_8:
	lb	$a0,0($t9)
	beq	$t8,$t7,prints_exit_8
	li	$v0,11
	syscall
	addi	$t8,$t8,1
	addi	$t9,$t9,1
	j	prints_begin_8
prints_exit_8:
if0:
_eval_end:
	lw	$ra,0($sp)
	addiu	$sp,$sp,16
	jr	$ra
.text
_assign:
	addiu	$sp,$sp,-20
	sw	$ra,0($sp)
	sw	$a0,4($sp)
	sw	$a1,8($sp)
	sw	$a2,12($sp)
	lw	$t9,4($sp)
	sw	$t9,_a
	lw	$t9,8($sp)
	sw	$t9,_b
	lw	$t9,12($sp)
	sw	$t9,_c
	la	$t9,s9
	li	$t8,0
	li	$t7,27
prints_begin_9:
	lb	$a0,0($t9)
	beq	$t8,$t7,prints_exit_9
	li	$v0,11
	syscall
	addi	$t8,$t8,1
	addi	$t9,$t9,1
	j	prints_begin_9
prints_exit_9:
	lw	$t9,_a
	move	$a0,$t9
	bne	$a0,$0,print_b_else3
.data
s_print_b_false3:	.asciiz "false" 
.text
	la	$a0,s_print_b_false3
	j	print_b_end3
print_b_else3:
.data
s_print_b_true3:	.asciiz "true" 
.text
	la	$a0,s_print_b_true3
print_b_end3:
	li	$v0,4
	syscall
	la	$t9,s10
	li	$t8,0
	li	$t7,3
prints_begin_10:
	lb	$a0,0($t9)
	beq	$t8,$t7,prints_exit_10
	li	$v0,11
	syscall
	addi	$t8,$t8,1
	addi	$t9,$t9,1
	j	prints_begin_10
prints_exit_10:
	lw	$t9,_b
	move	$a0,$t9
	bne	$a0,$0,print_b_else4
.data
s_print_b_false4:	.asciiz "false" 
.text
	la	$a0,s_print_b_false4
	j	print_b_end4
print_b_else4:
.data
s_print_b_true4:	.asciiz "true" 
.text
	la	$a0,s_print_b_true4
print_b_end4:
	li	$v0,4
	syscall
	la	$t9,s11
	li	$t8,0
	li	$t7,3
prints_begin_11:
	lb	$a0,0($t9)
	beq	$t8,$t7,prints_exit_11
	li	$v0,11
	syscall
	addi	$t8,$t8,1
	addi	$t9,$t9,1
	j	prints_begin_11
prints_exit_11:
	lw	$t9,_c
	move	$a0,$t9
	bne	$a0,$0,print_b_else5
.data
s_print_b_false5:	.asciiz "false" 
.text
	la	$a0,s_print_b_false5
	j	print_b_end5
print_b_else5:
.data
s_print_b_true5:	.asciiz "true" 
.text
	la	$a0,s_print_b_true5
print_b_end5:
	li	$v0,4
	syscall
	la	$t9,s12
	li	$t8,0
	li	$t7,1
prints_begin_12:
	lb	$a0,0($t9)
	beq	$t8,$t7,prints_exit_12
	li	$v0,11
	syscall
	addi	$t8,$t8,1
	addi	$t9,$t9,1
	j	prints_begin_12
prints_exit_12:
	addiu	$sp,$sp,0
	jal	_A
	addiu	$sp,$sp,0
	move	$t9,$v0
	beq	$t9,$0,and_left_false4
	addiu	$sp,$sp,-8
	sw	$t9,0($sp)
	sw	$t8,4($sp)
	jal	_B
	lw	$t9,0($sp)
	lw	$t8,4($sp)
	addiu	$sp,$sp,8
	move	$t7,$v0
	beq	$t7,$0,not_0
	li	$t6,0
	j	not_end_0
not_0:
	li	$t6,1
not_end_0:
	move	$t8,$t6
	j	and_end4
and_left_false4:
	li	$t8,0
and_end4:
	bne	$t8,$0,or_left_true3
	addiu	$sp,$sp,-8
	sw	$t9,0($sp)
	sw	$t8,4($sp)
	jal	_C
	lw	$t9,0($sp)
	lw	$t8,4($sp)
	addiu	$sp,$sp,8
	move	$t7,$v0
	move	$t9,$t7
	j	or_end3
or_left_true3:
	li	$t9,1
or_end3:
	sw	$t9,16($sp)
	la	$t9,s13
	li	$t8,0
	li	$t7,2
prints_begin_13:
	lb	$a0,0($t9)
	beq	$t8,$t7,prints_exit_13
	li	$v0,11
	syscall
	addi	$t8,$t8,1
	addi	$t9,$t9,1
	j	prints_begin_13
prints_exit_13:
	lw	$t9,16($sp)
	move	$a0,$t9
	bne	$a0,$0,print_b_else6
.data
s_print_b_false6:	.asciiz "false" 
.text
	la	$a0,s_print_b_false6
	j	print_b_end6
print_b_else6:
.data
s_print_b_true6:	.asciiz "true" 
.text
	la	$a0,s_print_b_true6
print_b_end6:
	li	$v0,4
	syscall
	la	$t9,s14
	li	$t8,0
	li	$t7,1
prints_begin_14:
	lb	$a0,0($t9)
	beq	$t8,$t7,prints_exit_14
	li	$v0,11
	syscall
	addi	$t8,$t8,1
	addi	$t9,$t9,1
	j	prints_begin_14
prints_exit_14:
_assign_end:
	lw	$ra,0($sp)
	addiu	$sp,$sp,20
	jr	$ra
.text
       	.globl main
main:
	addiu	$sp,$sp,-4
	li	$t9,0
	li	$t8,0
	li	$t7,0
	move	$a0,$t9
	move	$a1,$t8
	move	$a2,$t7
	addiu	$sp,$sp,-12
	sw	$t9,0($sp)
	sw	$t8,4($sp)
	sw	$t7,8($sp)
	jal	_eval
	lw	$t9,0($sp)
	lw	$t8,4($sp)
	lw	$t7,8($sp)
	addiu	$sp,$sp,12
	move	$t9,$v0
	la	$t9,s15
	li	$t8,0
	li	$t7,1
prints_begin_15:
	lb	$a0,0($t9)
	beq	$t8,$t7,prints_exit_15
	li	$v0,11
	syscall
	addi	$t8,$t8,1
	addi	$t9,$t9,1
	j	prints_begin_15
prints_exit_15:
	li	$t9,0
	li	$t8,0
	li	$t7,1
	move	$a0,$t9
	move	$a1,$t8
	move	$a2,$t7
	addiu	$sp,$sp,-12
	sw	$t9,0($sp)
	sw	$t8,4($sp)
	sw	$t7,8($sp)
	jal	_eval
	lw	$t9,0($sp)
	lw	$t8,4($sp)
	lw	$t7,8($sp)
	addiu	$sp,$sp,12
	move	$t9,$v0
	la	$t9,s16
	li	$t8,0
	li	$t7,1
prints_begin_16:
	lb	$a0,0($t9)
	beq	$t8,$t7,prints_exit_16
	li	$v0,11
	syscall
	addi	$t8,$t8,1
	addi	$t9,$t9,1
	j	prints_begin_16
prints_exit_16:
	li	$t9,0
	li	$t8,1
	li	$t7,0
	move	$a0,$t9
	move	$a1,$t8
	move	$a2,$t7
	addiu	$sp,$sp,-12
	sw	$t9,0($sp)
	sw	$t8,4($sp)
	sw	$t7,8($sp)
	jal	_eval
	lw	$t9,0($sp)
	lw	$t8,4($sp)
	lw	$t7,8($sp)
	addiu	$sp,$sp,12
	move	$t9,$v0
	la	$t9,s17
	li	$t8,0
	li	$t7,1
prints_begin_17:
	lb	$a0,0($t9)
	beq	$t8,$t7,prints_exit_17
	li	$v0,11
	syscall
	addi	$t8,$t8,1
	addi	$t9,$t9,1
	j	prints_begin_17
prints_exit_17:
	li	$t9,0
	li	$t8,1
	li	$t7,1
	move	$a0,$t9
	move	$a1,$t8
	move	$a2,$t7
	addiu	$sp,$sp,-12
	sw	$t9,0($sp)
	sw	$t8,4($sp)
	sw	$t7,8($sp)
	jal	_eval
	lw	$t9,0($sp)
	lw	$t8,4($sp)
	lw	$t7,8($sp)
	addiu	$sp,$sp,12
	move	$t9,$v0
	la	$t9,s18
	li	$t8,0
	li	$t7,1
prints_begin_18:
	lb	$a0,0($t9)
	beq	$t8,$t7,prints_exit_18
	li	$v0,11
	syscall
	addi	$t8,$t8,1
	addi	$t9,$t9,1
	j	prints_begin_18
prints_exit_18:
	li	$t9,1
	li	$t8,0
	li	$t7,0
	move	$a0,$t9
	move	$a1,$t8
	move	$a2,$t7
	addiu	$sp,$sp,-12
	sw	$t9,0($sp)
	sw	$t8,4($sp)
	sw	$t7,8($sp)
	jal	_eval
	lw	$t9,0($sp)
	lw	$t8,4($sp)
	lw	$t7,8($sp)
	addiu	$sp,$sp,12
	move	$t9,$v0
	la	$t9,s19
	li	$t8,0
	li	$t7,1
prints_begin_19:
	lb	$a0,0($t9)
	beq	$t8,$t7,prints_exit_19
	li	$v0,11
	syscall
	addi	$t8,$t8,1
	addi	$t9,$t9,1
	j	prints_begin_19
prints_exit_19:
	li	$t9,1
	li	$t8,0
	li	$t7,1
	move	$a0,$t9
	move	$a1,$t8
	move	$a2,$t7
	addiu	$sp,$sp,-12
	sw	$t9,0($sp)
	sw	$t8,4($sp)
	sw	$t7,8($sp)
	jal	_eval
	lw	$t9,0($sp)
	lw	$t8,4($sp)
	lw	$t7,8($sp)
	addiu	$sp,$sp,12
	move	$t9,$v0
	la	$t9,s20
	li	$t8,0
	li	$t7,1
prints_begin_20:
	lb	$a0,0($t9)
	beq	$t8,$t7,prints_exit_20
	li	$v0,11
	syscall
	addi	$t8,$t8,1
	addi	$t9,$t9,1
	j	prints_begin_20
prints_exit_20:
	li	$t9,1
	li	$t8,1
	li	$t7,0
	move	$a0,$t9
	move	$a1,$t8
	move	$a2,$t7
	addiu	$sp,$sp,-12
	sw	$t9,0($sp)
	sw	$t8,4($sp)
	sw	$t7,8($sp)
	jal	_eval
	lw	$t9,0($sp)
	lw	$t8,4($sp)
	lw	$t7,8($sp)
	addiu	$sp,$sp,12
	move	$t9,$v0
	la	$t9,s21
	li	$t8,0
	li	$t7,1
prints_begin_21:
	lb	$a0,0($t9)
	beq	$t8,$t7,prints_exit_21
	li	$v0,11
	syscall
	addi	$t8,$t8,1
	addi	$t9,$t9,1
	j	prints_begin_21
prints_exit_21:
	li	$t9,1
	li	$t8,1
	li	$t7,1
	move	$a0,$t9
	move	$a1,$t8
	move	$a2,$t7
	addiu	$sp,$sp,-12
	sw	$t9,0($sp)
	sw	$t8,4($sp)
	sw	$t7,8($sp)
	jal	_eval
	lw	$t9,0($sp)
	lw	$t8,4($sp)
	lw	$t7,8($sp)
	addiu	$sp,$sp,12
	move	$t9,$v0
	la	$t9,s22
	li	$t8,0
	li	$t7,1
prints_begin_22:
	lb	$a0,0($t9)
	beq	$t8,$t7,prints_exit_22
	li	$v0,11
	syscall
	addi	$t8,$t8,1
	addi	$t9,$t9,1
	j	prints_begin_22
prints_exit_22:
	li	$t9,0
	li	$t8,0
	li	$t7,0
	move	$a0,$t9
	move	$a1,$t8
	move	$a2,$t7
	addiu	$sp,$sp,-12
	sw	$t9,0($sp)
	sw	$t8,4($sp)
	sw	$t7,8($sp)
	jal	_assign
	lw	$t9,0($sp)
	lw	$t8,4($sp)
	lw	$t7,8($sp)
	addiu	$sp,$sp,12
	move	$t9,$v0
	la	$t9,s23
	li	$t8,0
	li	$t7,1
prints_begin_23:
	lb	$a0,0($t9)
	beq	$t8,$t7,prints_exit_23
	li	$v0,11
	syscall
	addi	$t8,$t8,1
	addi	$t9,$t9,1
	j	prints_begin_23
prints_exit_23:
	li	$t9,0
	li	$t8,0
	li	$t7,1
	move	$a0,$t9
	move	$a1,$t8
	move	$a2,$t7
	addiu	$sp,$sp,-12
	sw	$t9,0($sp)
	sw	$t8,4($sp)
	sw	$t7,8($sp)
	jal	_assign
	lw	$t9,0($sp)
	lw	$t8,4($sp)
	lw	$t7,8($sp)
	addiu	$sp,$sp,12
	move	$t9,$v0
	la	$t9,s24
	li	$t8,0
	li	$t7,1
prints_begin_24:
	lb	$a0,0($t9)
	beq	$t8,$t7,prints_exit_24
	li	$v0,11
	syscall
	addi	$t8,$t8,1
	addi	$t9,$t9,1
	j	prints_begin_24
prints_exit_24:
	li	$t9,0
	li	$t8,1
	li	$t7,0
	move	$a0,$t9
	move	$a1,$t8
	move	$a2,$t7
	addiu	$sp,$sp,-12
	sw	$t9,0($sp)
	sw	$t8,4($sp)
	sw	$t7,8($sp)
	jal	_assign
	lw	$t9,0($sp)
	lw	$t8,4($sp)
	lw	$t7,8($sp)
	addiu	$sp,$sp,12
	move	$t9,$v0
	la	$t9,s25
	li	$t8,0
	li	$t7,1
prints_begin_25:
	lb	$a0,0($t9)
	beq	$t8,$t7,prints_exit_25
	li	$v0,11
	syscall
	addi	$t8,$t8,1
	addi	$t9,$t9,1
	j	prints_begin_25
prints_exit_25:
	li	$t9,0
	li	$t8,1
	li	$t7,1
	move	$a0,$t9
	move	$a1,$t8
	move	$a2,$t7
	addiu	$sp,$sp,-12
	sw	$t9,0($sp)
	sw	$t8,4($sp)
	sw	$t7,8($sp)
	jal	_assign
	lw	$t9,0($sp)
	lw	$t8,4($sp)
	lw	$t7,8($sp)
	addiu	$sp,$sp,12
	move	$t9,$v0
	la	$t9,s26
	li	$t8,0
	li	$t7,1
prints_begin_26:
	lb	$a0,0($t9)
	beq	$t8,$t7,prints_exit_26
	li	$v0,11
	syscall
	addi	$t8,$t8,1
	addi	$t9,$t9,1
	j	prints_begin_26
prints_exit_26:
	li	$t9,1
	li	$t8,0
	li	$t7,0
	move	$a0,$t9
	move	$a1,$t8
	move	$a2,$t7
	addiu	$sp,$sp,-12
	sw	$t9,0($sp)
	sw	$t8,4($sp)
	sw	$t7,8($sp)
	jal	_assign
	lw	$t9,0($sp)
	lw	$t8,4($sp)
	lw	$t7,8($sp)
	addiu	$sp,$sp,12
	move	$t9,$v0
	la	$t9,s27
	li	$t8,0
	li	$t7,1
prints_begin_27:
	lb	$a0,0($t9)
	beq	$t8,$t7,prints_exit_27
	li	$v0,11
	syscall
	addi	$t8,$t8,1
	addi	$t9,$t9,1
	j	prints_begin_27
prints_exit_27:
	li	$t9,1
	li	$t8,0
	li	$t7,1
	move	$a0,$t9
	move	$a1,$t8
	move	$a2,$t7
	addiu	$sp,$sp,-12
	sw	$t9,0($sp)
	sw	$t8,4($sp)
	sw	$t7,8($sp)
	jal	_assign
	lw	$t9,0($sp)
	lw	$t8,4($sp)
	lw	$t7,8($sp)
	addiu	$sp,$sp,12
	move	$t9,$v0
	la	$t9,s28
	li	$t8,0
	li	$t7,1
prints_begin_28:
	lb	$a0,0($t9)
	beq	$t8,$t7,prints_exit_28
	li	$v0,11
	syscall
	addi	$t8,$t8,1
	addi	$t9,$t9,1
	j	prints_begin_28
prints_exit_28:
	li	$t9,1
	li	$t8,1
	li	$t7,0
	move	$a0,$t9
	move	$a1,$t8
	move	$a2,$t7
	addiu	$sp,$sp,-12
	sw	$t9,0($sp)
	sw	$t8,4($sp)
	sw	$t7,8($sp)
	jal	_assign
	lw	$t9,0($sp)
	lw	$t8,4($sp)
	lw	$t7,8($sp)
	addiu	$sp,$sp,12
	move	$t9,$v0
	la	$t9,s29
	li	$t8,0
	li	$t7,1
prints_begin_29:
	lb	$a0,0($t9)
	beq	$t8,$t7,prints_exit_29
	li	$v0,11
	syscall
	addi	$t8,$t8,1
	addi	$t9,$t9,1
	j	prints_begin_29
prints_exit_29:
	li	$t9,1
	li	$t8,1
	li	$t7,1
	move	$a0,$t9
	move	$a1,$t8
	move	$a2,$t7
	addiu	$sp,$sp,-12
	sw	$t9,0($sp)
	sw	$t8,4($sp)
	sw	$t7,8($sp)
	jal	_assign
	lw	$t9,0($sp)
	lw	$t8,4($sp)
	lw	$t7,8($sp)
	addiu	$sp,$sp,12
	move	$t9,$v0
	addiu	$sp,$sp,4
	li	$v0,10
	syscall
