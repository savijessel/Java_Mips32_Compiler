.data
__havechar:.word 0
.data
__char:.word 0
.data
s0:	.byte 73 , 110 , 116 , 101 , 114 , 110 , 97 , 108 , 32 , 101 , 114 , 114 , 111 , 114 , 58 , 32 , 116 , 111 , 111 , 32 , 109 , 97 , 110 , 121 , 32 , 117 , 110 , 103 , 101 , 116 , 115 , 33 , 10 
	.align 2 
.data
__havetoken:.word 0
.data
__token:.word 0
.data
_attr:.word 0
.data
s1:	.byte 69 , 114 , 114 , 111 , 114 , 58 , 32 , 101 , 120 , 112 , 101 , 99 , 116 , 101 , 100 , 32 
	.align 2 
.data
s2:	.byte 10 
	.align 2 
.data
s3:	.byte 69 , 114 , 114 , 111 , 114 , 58 , 32 , 105 , 110 , 118 , 97 , 108 , 105 , 100 , 32 , 99 , 104 , 97 , 114 , 97 , 99 , 116 , 101 , 114 , 46 , 10 
	.align 2 
.data
s4:	.byte 32 , 61 , 32 
	.align 2 
.data
s5:	.byte 10 
	.align 2 
.data
s6:	.byte 69 , 114 , 114 , 111 , 114 , 58 , 32 , 101 , 120 , 112 , 101 , 99 , 116 , 101 , 100 , 32 , 102 , 97 , 99 , 116 , 111 , 114 , 46 , 10 
	.align 2 
.data
_EOF:.word 0
.data
_TK_EOF:.word 0
.data
_TK_EOLN:.word 0
.data
_TK_NUMBER:.word 0
.data
_TK_ADD:.word 0
.data
_TK_SUB:.word 0
.data
_TK_MUL:.word 0
.data
_TK_DIV:.word 0
.data
_TK_LPAREN:.word 0
.data
_TK_RPAREN:.word 0
.data
_ASCII_0:.word 0
.data
_ASCII_9:.word 0
.data
_ASCII_PLUS:.word 0
.data
_ASCII_MINUS:.word 0
.data
_ASCII_STAR:.word 0
.data
_ASCII_SLASH:.word 0
.data
_ASCII_LPAREN:.word 0
.data
_ASCII_RPAREN:.word 0
.data
_ASCII_SPACE:.word 0
.data
_ASCII_TAB:.word 0
.data
_ASCII_CR:.word 0
.data
_ASCII_NL:.word 0
.text
       	.globl main
main:
	addiu	$sp,$sp,-4
	addiu	$sp,$sp,0
	jal	_init
	addiu	$sp,$sp,0
	move	$t9,$v0
	addiu	$sp,$sp,0
	jal	_parser
	addiu	$sp,$sp,0
	move	$t9,$v0
	addiu	$sp,$sp,4
	li	$v0,10
	syscall
.text
_getc:
	addiu	$sp,$sp,-4
	sw	$ra,0($sp)
	lw	$t9,__havechar
	beq	$t9,$0,intermediate_if0
	j	intermediate_endif0
intermediate_if0:
	j	if0
intermediate_endif0:
	li	$t9,0
	sw	$t9,__havechar
	lw	$t9,__char
	move	$v0,$t9
	j	_getc_end
if0:
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
	move	$v0,$v0
	j	_getc_end
.data
err0:
.asciiz	"Error: function 'getc' must return a value\n"
.text
	la	$a0,err0
	li	$v0,4
	syscall
	li	$v0,10
	syscall
_getc_end:
	lw	$ra,0($sp)
	addiu	$sp,$sp,4
	jr	$ra
.text
_ungetc:
	addiu	$sp,$sp,-8
	sw	$ra,0($sp)
	sw	$a0,4($sp)
	lw	$t7,__havechar
	beq	$t7,$0,intermediate_if1
	j	intermediate_endif1
intermediate_if1:
	j	if1
intermediate_endif1:
	la	$t7,s0
	li	$t6,0
	li	$t5,33
prints_begin_0:
	lb	$a0,0($t7)
	beq	$t6,$t5,prints_exit_0
	li	$v0,11
	syscall
	addi	$t6,$t6,1
	addi	$t7,$t7,1
	j	prints_begin_0
prints_exit_0:
	li	$v0,10
	syscall
if1:
	li	$t7,1
	sw	$t7,__havechar
	lw	$t7,4($sp)
	sw	$t7,__char
_ungetc_end:
	lw	$ra,0($sp)
	addiu	$sp,$sp,8
	jr	$ra
.text
_peek:
	addiu	$sp,$sp,-4
	sw	$ra,0($sp)
	lw	$t7,__havetoken
	beq	$t7,$0,intermediate_if2
	j	intermediate_endif2
intermediate_if2:
	j	if2
intermediate_endif2:
	lw	$t7,__token
	move	$v0,$t7
	j	_peek_end
if2:
	li	$t7,1
	sw	$t7,__havetoken
	addiu	$sp,$sp,-8
	sw	$t9,0($sp)
	sw	$t8,4($sp)
	jal	_scanner
	lw	$t9,0($sp)
	lw	$t8,4($sp)
	addiu	$sp,$sp,8
	move	$t7,$v0
	sw	$t7,__token
	lw	$t7,__token
	move	$v0,$t7
	j	_peek_end
.data
err1:
.asciiz	"Error: function 'peek' must return a value\n"
.text
	la	$a0,err1
	li	$v0,4
	syscall
	li	$v0,10
	syscall
_peek_end:
	lw	$ra,0($sp)
	addiu	$sp,$sp,4
	jr	$ra
.text
_match:
	addiu	$sp,$sp,-8
	sw	$ra,0($sp)
	sw	$a0,4($sp)
	addiu	$sp,$sp,-8
	sw	$t9,0($sp)
	sw	$t8,4($sp)
	jal	_peek
	lw	$t9,0($sp)
	lw	$t8,4($sp)
	addiu	$sp,$sp,8
	move	$t7,$v0
	lw	$t6,4($sp)
	sne	$t5,$t7,$t6
	beq	$t5,$0,intermediate_if3
	j	intermediate_endif3
intermediate_if3:
	j	if3
intermediate_endif3:
	la	$t7,s1
	li	$t6,0
	li	$t5,16
prints_begin_1:
	lb	$a0,0($t7)
	beq	$t6,$t5,prints_exit_1
	li	$v0,11
	syscall
	addi	$t6,$t6,1
	addi	$t7,$t7,1
	j	prints_begin_1
prints_exit_1:
	lw	$t7,4($sp)
	move	$a0,$t7
	li	$v0,11
	syscall
	la	$t7,s2
	li	$t6,0
	li	$t5,1
prints_begin_2:
	lb	$a0,0($t7)
	beq	$t6,$t5,prints_exit_2
	li	$v0,11
	syscall
	addi	$t6,$t6,1
	addi	$t7,$t7,1
	j	prints_begin_2
prints_exit_2:
	li	$v0,10
	syscall
if3:
	li	$t7,0
	sw	$t7,__havetoken
_match_end:
	lw	$ra,0($sp)
	addiu	$sp,$sp,8
	jr	$ra
.text
_scanner:
	addiu	$sp,$sp,-8
	sw	$ra,0($sp)
loop0:
	addiu	$sp,$sp,-8
	sw	$t9,0($sp)
	sw	$t8,4($sp)
	jal	_getc
	lw	$t9,0($sp)
	lw	$t8,4($sp)
	addiu	$sp,$sp,8
	move	$t7,$v0
	sw	$t7,4($sp)
	lw	$t7,4($sp)
	move	$a0,$t7
	addiu	$sp,$sp,-8
	sw	$t9,0($sp)
	sw	$t8,4($sp)
	jal	_isspace
	lw	$t9,0($sp)
	lw	$t8,4($sp)
	addiu	$sp,$sp,8
	move	$t7,$v0
	beq	$t7,$0,intermediate_while0
	j	intermediate_endwhile0
intermediate_while0:
	j	while0
intermediate_endwhile0:
	j	loop0
while0:
	lw	$t7,4($sp)
	lw	$t6,_EOF
	seq	$t5,$t7,$t6
	beq	$t5,$0,intermediate_if4
	j	intermediate_endif4
intermediate_if4:
	j	if4
intermediate_endif4:
	lw	$t7,_TK_EOF
	move	$v0,$t7
	j	_scanner_end
if4:
	lw	$t7,4($sp)
	lw	$t6,_ASCII_NL
	seq	$t5,$t7,$t6
	beq	$t5,$0,intermediate_if5
	j	intermediate_endif5
intermediate_if5:
	j	if5
intermediate_endif5:
	lw	$t7,_TK_EOLN
	move	$v0,$t7
	j	_scanner_end
if5:
	lw	$t7,4($sp)
	lw	$t6,_ASCII_PLUS
	seq	$t5,$t7,$t6
	beq	$t5,$0,intermediate_if6
	j	intermediate_endif6
intermediate_if6:
	j	if6
intermediate_endif6:
	lw	$t7,_TK_ADD
	move	$v0,$t7
	j	_scanner_end
if6:
	lw	$t7,4($sp)
	lw	$t6,_ASCII_MINUS
	seq	$t5,$t7,$t6
	beq	$t5,$0,intermediate_if7
	j	intermediate_endif7
intermediate_if7:
	j	if7
intermediate_endif7:
	lw	$t7,_TK_SUB
	move	$v0,$t7
	j	_scanner_end
if7:
	lw	$t7,4($sp)
	lw	$t6,_ASCII_STAR
	seq	$t5,$t7,$t6
	beq	$t5,$0,intermediate_if8
	j	intermediate_endif8
intermediate_if8:
	j	if8
intermediate_endif8:
	lw	$t7,_TK_MUL
	move	$v0,$t7
	j	_scanner_end
if8:
	lw	$t7,4($sp)
	lw	$t6,_ASCII_SLASH
	seq	$t5,$t7,$t6
	beq	$t5,$0,intermediate_if9
	j	intermediate_endif9
intermediate_if9:
	j	if9
intermediate_endif9:
	lw	$t7,_TK_DIV
	move	$v0,$t7
	j	_scanner_end
if9:
	lw	$t7,4($sp)
	lw	$t6,_ASCII_LPAREN
	seq	$t5,$t7,$t6
	beq	$t5,$0,intermediate_if10
	j	intermediate_endif10
intermediate_if10:
	j	if10
intermediate_endif10:
	lw	$t7,_TK_LPAREN
	move	$v0,$t7
	j	_scanner_end
if10:
	lw	$t7,4($sp)
	lw	$t6,_ASCII_RPAREN
	seq	$t5,$t7,$t6
	beq	$t5,$0,intermediate_if11
	j	intermediate_endif11
intermediate_if11:
	j	if11
intermediate_endif11:
	lw	$t7,_TK_RPAREN
	move	$v0,$t7
	j	_scanner_end
if11:
	lw	$t7,4($sp)
	move	$a0,$t7
	addiu	$sp,$sp,-8
	sw	$t9,0($sp)
	sw	$t8,4($sp)
	jal	_isdigit
	lw	$t9,0($sp)
	lw	$t8,4($sp)
	addiu	$sp,$sp,8
	move	$t7,$v0
	beq	$t7,$0,intermediate_if12
	j	intermediate_endif12
intermediate_if12:
	j	if12
intermediate_endif12:
	li	$t7,0
	sw	$t7,_attr
loop1:
	lw	$t7,4($sp)
	move	$a0,$t7
	addiu	$sp,$sp,-8
	sw	$t9,0($sp)
	sw	$t8,4($sp)
	jal	_isdigit
	lw	$t9,0($sp)
	lw	$t8,4($sp)
	addiu	$sp,$sp,8
	move	$t7,$v0
	beq	$t7,$0,intermediate_while1
	j	intermediate_endwhile1
intermediate_while1:
	j	while1
intermediate_endwhile1:
	li	$t7,10
	lw	$t6,_attr
	mul	$t5,$t6,$t7
	lw	$t7,4($sp)
	lw	$t6,_ASCII_0
	subu	$t4,$t7,$t6
	addu	$t7,$t5,$t4
	sw	$t7,_attr
	addiu	$sp,$sp,-8
	sw	$t9,0($sp)
	sw	$t8,4($sp)
	jal	_getc
	lw	$t9,0($sp)
	lw	$t8,4($sp)
	addiu	$sp,$sp,8
	move	$t7,$v0
	sw	$t7,4($sp)
	j	loop1
while1:
	lw	$t7,4($sp)
	move	$a0,$t7
	addiu	$sp,$sp,-8
	sw	$t9,0($sp)
	sw	$t8,4($sp)
	jal	_ungetc
	lw	$t9,0($sp)
	lw	$t8,4($sp)
	addiu	$sp,$sp,8
	move	$t7,$v0
	lw	$t7,_TK_NUMBER
	move	$v0,$t7
	j	_scanner_end
if12:
	la	$t7,s3
	li	$t6,0
	li	$t5,26
prints_begin_3:
	lb	$a0,0($t7)
	beq	$t6,$t5,prints_exit_3
	li	$v0,11
	syscall
	addi	$t6,$t6,1
	addi	$t7,$t7,1
	j	prints_begin_3
prints_exit_3:
	li	$v0,10
	syscall
.data
err2:
.asciiz	"Error: function 'scanner' must return a value\n"
.text
	la	$a0,err2
	li	$v0,4
	syscall
	li	$v0,10
	syscall
_scanner_end:
	lw	$ra,0($sp)
	addiu	$sp,$sp,8
	jr	$ra
.text
_isdigit:
	addiu	$sp,$sp,-8
	sw	$ra,0($sp)
	sw	$a0,4($sp)
	lw	$t7,4($sp)
	lw	$t6,_ASCII_0
	sge	$t5,$t7,$t6
	beq	$t5,$0,and_left_false1
	lw	$t6,4($sp)
	lw	$t4,_ASCII_9
	sle	$t3,$t6,$t4
	move	$t7,$t3
	j	and_end1
and_left_false1:
	li	$t7,0
and_end1:
	move	$v0,$t7
	j	_isdigit_end
.data
err3:
.asciiz	"Error: function 'isdigit' must return a value\n"
.text
	la	$a0,err3
	li	$v0,4
	syscall
	li	$v0,10
	syscall
_isdigit_end:
	lw	$ra,0($sp)
	addiu	$sp,$sp,8
	jr	$ra
.text
_isspace:
	addiu	$sp,$sp,-8
	sw	$ra,0($sp)
	sw	$a0,4($sp)
	lw	$t7,4($sp)
	lw	$t6,_ASCII_SPACE
	seq	$t5,$t7,$t6
	bne	$t5,$0,or_left_true3
	lw	$t6,4($sp)
	lw	$t4,_ASCII_TAB
	seq	$t3,$t6,$t4
	move	$t7,$t3
	j	or_end3
or_left_true3:
	li	$t7,1
or_end3:
	bne	$t7,$0,or_left_true2
	lw	$t5,4($sp)
	lw	$t4,_ASCII_CR
	seq	$t3,$t5,$t4
	move	$t6,$t3
	j	or_end2
or_left_true2:
	li	$t6,1
or_end2:
	move	$v0,$t6
	j	_isspace_end
.data
err4:
.asciiz	"Error: function 'isspace' must return a value\n"
.text
	la	$a0,err4
	li	$v0,4
	syscall
	li	$v0,10
	syscall
_isspace_end:
	lw	$ra,0($sp)
	addiu	$sp,$sp,8
	jr	$ra
.text
_parser:
	addiu	$sp,$sp,-8
	sw	$ra,0($sp)
loop2:
	addiu	$sp,$sp,-8
	sw	$t9,0($sp)
	sw	$t8,4($sp)
	jal	_peek
	lw	$t9,0($sp)
	lw	$t8,4($sp)
	addiu	$sp,$sp,8
	move	$t7,$v0
	lw	$t6,_TK_EOF
	sne	$t5,$t7,$t6
	beq	$t5,$0,intermediate_while2
	j	intermediate_endwhile2
intermediate_while2:
	j	while2
intermediate_endwhile2:
	addiu	$sp,$sp,-8
	sw	$t9,0($sp)
	sw	$t8,4($sp)
	jal	_E
	lw	$t9,0($sp)
	lw	$t8,4($sp)
	addiu	$sp,$sp,8
	move	$t7,$v0
	sw	$t7,4($sp)
	lw	$t7,_TK_EOLN
	move	$a0,$t7
	addiu	$sp,$sp,-8
	sw	$t9,0($sp)
	sw	$t8,4($sp)
	jal	_match
	lw	$t9,0($sp)
	lw	$t8,4($sp)
	addiu	$sp,$sp,8
	move	$t7,$v0
	la	$t7,s4
	li	$t6,0
	li	$t5,3
prints_begin_4:
	lb	$a0,0($t7)
	beq	$t6,$t5,prints_exit_4
	li	$v0,11
	syscall
	addi	$t6,$t6,1
	addi	$t7,$t7,1
	j	prints_begin_4
prints_exit_4:
	lw	$t7,4($sp)
	move	$a0,$t7
	li	$v0,1
	syscall
	la	$t7,s5
	li	$t6,0
	li	$t5,1
prints_begin_5:
	lb	$a0,0($t7)
	beq	$t6,$t5,prints_exit_5
	li	$v0,11
	syscall
	addi	$t6,$t6,1
	addi	$t7,$t7,1
	j	prints_begin_5
prints_exit_5:
	j	loop2
while2:
_parser_end:
	lw	$ra,0($sp)
	addiu	$sp,$sp,8
	jr	$ra
.text
_E:
	addiu	$sp,$sp,-16
	sw	$ra,0($sp)
	addiu	$sp,$sp,-8
	sw	$t9,0($sp)
	sw	$t8,4($sp)
	jal	_T
	lw	$t9,0($sp)
	lw	$t8,4($sp)
	addiu	$sp,$sp,8
	move	$t7,$v0
	sw	$t7,4($sp)
loop3:
	addiu	$sp,$sp,-8
	sw	$t9,0($sp)
	sw	$t8,4($sp)
	jal	_peek
	lw	$t9,0($sp)
	lw	$t8,4($sp)
	addiu	$sp,$sp,8
	move	$t7,$v0
	lw	$t6,_TK_ADD
	seq	$t5,$t7,$t6
	bne	$t5,$0,or_left_true4
	addiu	$sp,$sp,-16
	sw	$t9,0($sp)
	sw	$t8,4($sp)
	sw	$t7,8($sp)
	sw	$t5,12($sp)
	jal	_peek
	lw	$t9,0($sp)
	lw	$t8,4($sp)
	lw	$t7,8($sp)
	lw	$t5,12($sp)
	addiu	$sp,$sp,16
	move	$t6,$v0
	lw	$t4,_TK_SUB
	seq	$t3,$t6,$t4
	move	$t7,$t3
	j	or_end4
or_left_true4:
	li	$t7,1
or_end4:
	beq	$t7,$0,intermediate_while3
	j	intermediate_endwhile3
intermediate_while3:
	j	while3
intermediate_endwhile3:
	addiu	$sp,$sp,-8
	sw	$t9,0($sp)
	sw	$t8,4($sp)
	jal	_peek
	lw	$t9,0($sp)
	lw	$t8,4($sp)
	addiu	$sp,$sp,8
	move	$t7,$v0
	sw	$t7,12($sp)
	lw	$t7,12($sp)
	move	$a0,$t7
	addiu	$sp,$sp,-8
	sw	$t9,0($sp)
	sw	$t8,4($sp)
	jal	_match
	lw	$t9,0($sp)
	lw	$t8,4($sp)
	addiu	$sp,$sp,8
	move	$t7,$v0
	addiu	$sp,$sp,-8
	sw	$t9,0($sp)
	sw	$t8,4($sp)
	jal	_T
	lw	$t9,0($sp)
	lw	$t8,4($sp)
	addiu	$sp,$sp,8
	move	$t7,$v0
	sw	$t7,8($sp)
	lw	$t7,12($sp)
	lw	$t6,_TK_ADD
	seq	$t5,$t7,$t6
	beq	$t5,$0,intermediate_elseIf13
	j	intermediate_endelseIf13
intermediate_elseIf13:
	j	elseIf13
intermediate_endelseIf13:
	lw	$t7,4($sp)
	lw	$t6,8($sp)
	addu	$t5,$t7,$t6
	sw	$t5,4($sp)
	j	if13
elseIf13:
	lw	$t7,4($sp)
	lw	$t6,8($sp)
	subu	$t5,$t7,$t6
	sw	$t5,4($sp)
if13:
	j	loop3
while3:
	lw	$t7,4($sp)
	move	$v0,$t7
	j	_E_end
.data
err5:
.asciiz	"Error: function 'E' must return a value\n"
.text
	la	$a0,err5
	li	$v0,4
	syscall
	li	$v0,10
	syscall
_E_end:
	lw	$ra,0($sp)
	addiu	$sp,$sp,16
	jr	$ra
.text
_T:
	addiu	$sp,$sp,-16
	sw	$ra,0($sp)
	addiu	$sp,$sp,-8
	sw	$t9,0($sp)
	sw	$t8,4($sp)
	jal	_F
	lw	$t9,0($sp)
	lw	$t8,4($sp)
	addiu	$sp,$sp,8
	move	$t7,$v0
	sw	$t7,4($sp)
loop4:
	addiu	$sp,$sp,-8
	sw	$t9,0($sp)
	sw	$t8,4($sp)
	jal	_peek
	lw	$t9,0($sp)
	lw	$t8,4($sp)
	addiu	$sp,$sp,8
	move	$t7,$v0
	lw	$t6,_TK_MUL
	seq	$t5,$t7,$t6
	bne	$t5,$0,or_left_true5
	addiu	$sp,$sp,-16
	sw	$t9,0($sp)
	sw	$t8,4($sp)
	sw	$t7,8($sp)
	sw	$t5,12($sp)
	jal	_peek
	lw	$t9,0($sp)
	lw	$t8,4($sp)
	lw	$t7,8($sp)
	lw	$t5,12($sp)
	addiu	$sp,$sp,16
	move	$t6,$v0
	lw	$t4,_TK_DIV
	seq	$t3,$t6,$t4
	move	$t7,$t3
	j	or_end5
or_left_true5:
	li	$t7,1
or_end5:
	beq	$t7,$0,intermediate_while4
	j	intermediate_endwhile4
intermediate_while4:
	j	while4
intermediate_endwhile4:
	addiu	$sp,$sp,-8
	sw	$t9,0($sp)
	sw	$t8,4($sp)
	jal	_peek
	lw	$t9,0($sp)
	lw	$t8,4($sp)
	addiu	$sp,$sp,8
	move	$t7,$v0
	sw	$t7,12($sp)
	lw	$t7,12($sp)
	move	$a0,$t7
	addiu	$sp,$sp,-8
	sw	$t9,0($sp)
	sw	$t8,4($sp)
	jal	_match
	lw	$t9,0($sp)
	lw	$t8,4($sp)
	addiu	$sp,$sp,8
	move	$t7,$v0
	addiu	$sp,$sp,-8
	sw	$t9,0($sp)
	sw	$t8,4($sp)
	jal	_F
	lw	$t9,0($sp)
	lw	$t8,4($sp)
	addiu	$sp,$sp,8
	move	$t7,$v0
	sw	$t7,8($sp)
	lw	$t7,12($sp)
	lw	$t6,_TK_MUL
	seq	$t5,$t7,$t6
	beq	$t5,$0,intermediate_elseIf14
	j	intermediate_endelseIf14
intermediate_elseIf14:
	j	elseIf14
intermediate_endelseIf14:
	lw	$t7,4($sp)
	lw	$t6,8($sp)
	mul	$t5,$t7,$t6
	sw	$t5,4($sp)
	j	if14
elseIf14:
	lw	$t7,4($sp)
	lw	$t6,8($sp)
	bne	$t6,$0,divNorm
.data
err6:
.asciiz	"Error: division by zero\n"
.text
	la	$a0,err6
	li	$v0,4
	syscall
	li	$v0,10
	syscall
divNorm:
	div	$t5,$t7,$t6
	sw	$t5,4($sp)
if14:
	j	loop4
while4:
	lw	$t7,4($sp)
	move	$v0,$t7
	j	_T_end
.data
err7:
.asciiz	"Error: function 'T' must return a value\n"
.text
	la	$a0,err7
	li	$v0,4
	syscall
	li	$v0,10
	syscall
_T_end:
	lw	$ra,0($sp)
	addiu	$sp,$sp,16
	jr	$ra
.text
_F:
	addiu	$sp,$sp,-12
	sw	$ra,0($sp)
	addiu	$sp,$sp,-8
	sw	$t9,0($sp)
	sw	$t8,4($sp)
	jal	_peek
	lw	$t9,0($sp)
	lw	$t8,4($sp)
	addiu	$sp,$sp,8
	move	$t7,$v0
	sw	$t7,8($sp)
	lw	$t7,8($sp)
	lw	$t6,_TK_LPAREN
	seq	$t5,$t7,$t6
	beq	$t5,$0,intermediate_elseIf15
	j	intermediate_endelseIf15
intermediate_elseIf15:
	j	elseIf15
intermediate_endelseIf15:
	lw	$t7,_TK_LPAREN
	move	$a0,$t7
	addiu	$sp,$sp,-8
	sw	$t9,0($sp)
	sw	$t8,4($sp)
	jal	_match
	lw	$t9,0($sp)
	lw	$t8,4($sp)
	addiu	$sp,$sp,8
	move	$t7,$v0
	addiu	$sp,$sp,-8
	sw	$t9,0($sp)
	sw	$t8,4($sp)
	jal	_E
	lw	$t9,0($sp)
	lw	$t8,4($sp)
	addiu	$sp,$sp,8
	move	$t7,$v0
	sw	$t7,4($sp)
	lw	$t7,_TK_RPAREN
	move	$a0,$t7
	addiu	$sp,$sp,-8
	sw	$t9,0($sp)
	sw	$t8,4($sp)
	jal	_match
	lw	$t9,0($sp)
	lw	$t8,4($sp)
	addiu	$sp,$sp,8
	move	$t7,$v0
	j	if15
elseIf15:
	lw	$t7,8($sp)
	lw	$t6,_TK_SUB
	seq	$t5,$t7,$t6
	beq	$t5,$0,intermediate_elseIf16
	j	intermediate_endelseIf16
intermediate_elseIf16:
	j	elseIf16
intermediate_endelseIf16:
	lw	$t7,_TK_SUB
	move	$a0,$t7
	addiu	$sp,$sp,-8
	sw	$t9,0($sp)
	sw	$t8,4($sp)
	jal	_match
	lw	$t9,0($sp)
	lw	$t8,4($sp)
	addiu	$sp,$sp,8
	move	$t7,$v0
	addiu	$sp,$sp,-8
	sw	$t9,0($sp)
	sw	$t8,4($sp)
	jal	_F
	lw	$t9,0($sp)
	lw	$t8,4($sp)
	addiu	$sp,$sp,8
	move	$t7,$v0
	subu	$t6,$0,$t7
	sw	$t6,4($sp)
	j	if16
elseIf16:
	lw	$t7,8($sp)
	lw	$t6,_TK_NUMBER
	seq	$t5,$t7,$t6
	beq	$t5,$0,intermediate_elseIf17
	j	intermediate_endelseIf17
intermediate_elseIf17:
	j	elseIf17
intermediate_endelseIf17:
	lw	$t7,_TK_NUMBER
	move	$a0,$t7
	addiu	$sp,$sp,-8
	sw	$t9,0($sp)
	sw	$t8,4($sp)
	jal	_match
	lw	$t9,0($sp)
	lw	$t8,4($sp)
	addiu	$sp,$sp,8
	move	$t7,$v0
	lw	$t7,_attr
	sw	$t7,4($sp)
	j	if17
elseIf17:
	la	$t7,s6
	li	$t6,0
	li	$t5,24
prints_begin_6:
	lb	$a0,0($t7)
	beq	$t6,$t5,prints_exit_6
	li	$v0,11
	syscall
	addi	$t6,$t6,1
	addi	$t7,$t7,1
	j	prints_begin_6
prints_exit_6:
	li	$v0,10
	syscall
if17:
if16:
if15:
	lw	$t7,4($sp)
	move	$v0,$t7
	j	_F_end
.data
err8:
.asciiz	"Error: function 'F' must return a value\n"
.text
	la	$a0,err8
	li	$v0,4
	syscall
	li	$v0,10
	syscall
_F_end:
	lw	$ra,0($sp)
	addiu	$sp,$sp,12
	jr	$ra
.text
_init:
	addiu	$sp,$sp,-4
	sw	$ra,0($sp)
	li	$t7,1
	subu	$t6,$0,$t7
	sw	$t6,_EOF
	li	$t7,48
	sw	$t7,_ASCII_0
	li	$t7,57
	sw	$t7,_ASCII_9
	li	$t7,43
	sw	$t7,_ASCII_PLUS
	li	$t7,45
	sw	$t7,_ASCII_MINUS
	li	$t7,42
	sw	$t7,_ASCII_STAR
	li	$t7,47
	sw	$t7,_ASCII_SLASH
	li	$t7,40
	sw	$t7,_ASCII_LPAREN
	li	$t7,41
	sw	$t7,_ASCII_RPAREN
	li	$t7,32
	sw	$t7,_ASCII_SPACE
	li	$t7,9
	sw	$t7,_ASCII_TAB
	li	$t7,13
	sw	$t7,_ASCII_CR
	li	$t7,10
	sw	$t7,_ASCII_NL
	li	$t7,256
	sw	$t7,_TK_EOF
	li	$t7,257
	sw	$t7,_TK_NUMBER
	lw	$t7,_ASCII_PLUS
	sw	$t7,_TK_ADD
	lw	$t7,_ASCII_MINUS
	sw	$t7,_TK_SUB
	lw	$t7,_ASCII_STAR
	sw	$t7,_TK_MUL
	lw	$t7,_ASCII_SLASH
	sw	$t7,_TK_DIV
	lw	$t7,_ASCII_LPAREN
	sw	$t7,_TK_LPAREN
	lw	$t7,_ASCII_RPAREN
	sw	$t7,_TK_RPAREN
	lw	$t7,_ASCII_NL
	sw	$t7,_TK_EOLN
_init_end:
	lw	$ra,0($sp)
	addiu	$sp,$sp,4
	jr	$ra
