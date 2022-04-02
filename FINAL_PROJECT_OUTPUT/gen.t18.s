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
	li	$v0,12
	syscall
	move	$v0,$v0
	j	_getc_end
.data
err0:
.asciiz	"Error: Non-void function getc must return a value\n"
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
	lw	$t9,__havechar
	beq	$t9,$0,intermediate_if1
	j	intermediate_endif1
intermediate_if1:
	j	if1
intermediate_endif1:
	la	$t9,s0
	li	$t8,0
	li	$t7,33
prints_begin_0:
	lb	$a0,0($t9)
	beq	$t8,$t7,prints_exit_0
	li	$v0,11
	syscall
	addi	$t8,$t8,1
	addi	$t9,$t9,1
	j	prints_begin_0
prints_exit_0:
	li	$v0,10
	syscall
if1:
	li	$t9,1
	sw	$t9,__havechar
	lw	$t9,4($sp)
	sw	$t9,__char
_ungetc_end:
	lw	$ra,0($sp)
	addiu	$sp,$sp,8
	jr	$ra
.text
_peek:
	addiu	$sp,$sp,-4
	sw	$ra,0($sp)
	lw	$t9,__havetoken
	beq	$t9,$0,intermediate_if2
	j	intermediate_endif2
intermediate_if2:
	j	if2
intermediate_endif2:
	lw	$t9,__token
	move	$v0,$t9
	j	_peek_end
if2:
	li	$t9,1
	sw	$t9,__havetoken
	addiu	$sp,$sp,0
	jal	_scanner
	addiu	$sp,$sp,0
	move	$t9,$v0
	sw	$t9,__token
	lw	$t9,__token
	move	$v0,$t9
	j	_peek_end
.data
err1:
.asciiz	"Error: Non-void function peek must return a value\n"
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
	addiu	$sp,$sp,0
	jal	_peek
	addiu	$sp,$sp,0
	move	$t9,$v0
	lw	$t8,4($sp)
	sne	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if3
	j	intermediate_endif3
intermediate_if3:
	j	if3
intermediate_endif3:
	la	$t9,s1
	li	$t8,0
	li	$t7,16
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
	li	$v0,11
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
	li	$v0,10
	syscall
if3:
	li	$t9,0
	sw	$t9,__havetoken
_match_end:
	lw	$ra,0($sp)
	addiu	$sp,$sp,8
	jr	$ra
.text
_scanner:
	addiu	$sp,$sp,-8
	sw	$ra,0($sp)
loop0:
	addiu	$sp,$sp,0
	jal	_getc
	addiu	$sp,$sp,0
	move	$t9,$v0
	sw	$t9,4($sp)
	lw	$t9,4($sp)
	move	$a0,$t9
	addiu	$sp,$sp,0
	jal	_isspace
	addiu	$sp,$sp,0
	move	$t9,$v0
	beq	$t9,$0,intermediate_while0
	j	intermediate_endwhile0
intermediate_while0:
	j	while0
intermediate_endwhile0:
	j	loop0
while0:
	lw	$t9,4($sp)
	lw	$t8,_EOF
	seq	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if4
	j	intermediate_endif4
intermediate_if4:
	j	if4
intermediate_endif4:
	lw	$t9,_TK_EOF
	move	$v0,$t9
	j	_scanner_end
if4:
	lw	$t9,4($sp)
	lw	$t8,_ASCII_NL
	seq	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if5
	j	intermediate_endif5
intermediate_if5:
	j	if5
intermediate_endif5:
	lw	$t9,_TK_EOLN
	move	$v0,$t9
	j	_scanner_end
if5:
	lw	$t9,4($sp)
	lw	$t8,_ASCII_PLUS
	seq	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if6
	j	intermediate_endif6
intermediate_if6:
	j	if6
intermediate_endif6:
	lw	$t9,_TK_ADD
	move	$v0,$t9
	j	_scanner_end
if6:
	lw	$t9,4($sp)
	lw	$t8,_ASCII_MINUS
	seq	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if7
	j	intermediate_endif7
intermediate_if7:
	j	if7
intermediate_endif7:
	lw	$t9,_TK_SUB
	move	$v0,$t9
	j	_scanner_end
if7:
	lw	$t9,4($sp)
	lw	$t8,_ASCII_STAR
	seq	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if8
	j	intermediate_endif8
intermediate_if8:
	j	if8
intermediate_endif8:
	lw	$t9,_TK_MUL
	move	$v0,$t9
	j	_scanner_end
if8:
	lw	$t9,4($sp)
	lw	$t8,_ASCII_SLASH
	seq	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if9
	j	intermediate_endif9
intermediate_if9:
	j	if9
intermediate_endif9:
	lw	$t9,_TK_DIV
	move	$v0,$t9
	j	_scanner_end
if9:
	lw	$t9,4($sp)
	lw	$t8,_ASCII_LPAREN
	seq	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if10
	j	intermediate_endif10
intermediate_if10:
	j	if10
intermediate_endif10:
	lw	$t9,_TK_LPAREN
	move	$v0,$t9
	j	_scanner_end
if10:
	lw	$t9,4($sp)
	lw	$t8,_ASCII_RPAREN
	seq	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if11
	j	intermediate_endif11
intermediate_if11:
	j	if11
intermediate_endif11:
	lw	$t9,_TK_RPAREN
	move	$v0,$t9
	j	_scanner_end
if11:
	lw	$t9,4($sp)
	move	$a0,$t9
	addiu	$sp,$sp,0
	jal	_isdigit
	addiu	$sp,$sp,0
	move	$t9,$v0
	beq	$t9,$0,intermediate_if12
	j	intermediate_endif12
intermediate_if12:
	j	if12
intermediate_endif12:
	li	$t9,0
	sw	$t9,_attr
loop1:
	lw	$t9,4($sp)
	move	$a0,$t9
	addiu	$sp,$sp,0
	jal	_isdigit
	addiu	$sp,$sp,0
	move	$t9,$v0
	beq	$t9,$0,intermediate_while1
	j	intermediate_endwhile1
intermediate_while1:
	j	while1
intermediate_endwhile1:
	li	$t9,10
	lw	$t8,_attr
	mul	$t7,$t8,$t9
	lw	$t9,4($sp)
	lw	$t8,_ASCII_0
	subu	$t6,$t9,$t8
	addu	$t9,$t7,$t6
	sw	$t9,_attr
	addiu	$sp,$sp,0
	jal	_getc
	addiu	$sp,$sp,0
	move	$t9,$v0
	sw	$t9,4($sp)
	j	loop1
while1:
	lw	$t9,4($sp)
	move	$a0,$t9
	addiu	$sp,$sp,0
	jal	_ungetc
	addiu	$sp,$sp,0
	move	$t9,$v0
	lw	$t9,_TK_NUMBER
	move	$v0,$t9
	j	_scanner_end
if12:
	la	$t9,s3
	li	$t8,0
	li	$t7,26
prints_begin_3:
	lb	$a0,0($t9)
	beq	$t8,$t7,prints_exit_3
	li	$v0,11
	syscall
	addi	$t8,$t8,1
	addi	$t9,$t9,1
	j	prints_begin_3
prints_exit_3:
	li	$v0,10
	syscall
.data
err2:
.asciiz	"Error: Non-void function scanner must return a value\n"
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
	lw	$t9,4($sp)
	lw	$t8,_ASCII_0
	sge	$t7,$t9,$t8
	beq	$t7,$0,and_left_false1
	lw	$t8,4($sp)
	lw	$t6,_ASCII_9
	sle	$t5,$t8,$t6
	move	$t9,$t5
	j	and_end1
and_left_false1:
	li	$t9,0
and_end1:
	move	$v0,$t9
	j	_isdigit_end
.data
err3:
.asciiz	"Error: Non-void function isdigit must return a value\n"
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
	lw	$t9,4($sp)
	lw	$t8,_ASCII_SPACE
	seq	$t7,$t9,$t8
	bne	$t7,$0,or_left_true3
	lw	$t8,4($sp)
	lw	$t6,_ASCII_TAB
	seq	$t5,$t8,$t6
	move	$t9,$t5
	j	or_end3
or_left_true3:
	li	$t9,1
or_end3:
	bne	$t9,$0,or_left_true2
	lw	$t7,4($sp)
	lw	$t6,_ASCII_CR
	seq	$t5,$t7,$t6
	move	$t8,$t5
	j	or_end2
or_left_true2:
	li	$t8,1
or_end2:
	move	$v0,$t8
	j	_isspace_end
.data
err4:
.asciiz	"Error: Non-void function isspace must return a value\n"
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
	addiu	$sp,$sp,0
	jal	_peek
	addiu	$sp,$sp,0
	move	$t9,$v0
	lw	$t8,_TK_EOF
	sne	$t7,$t9,$t8
	beq	$t7,$0,intermediate_while2
	j	intermediate_endwhile2
intermediate_while2:
	j	while2
intermediate_endwhile2:
	addiu	$sp,$sp,0
	jal	_E
	addiu	$sp,$sp,0
	move	$t9,$v0
	sw	$t9,4($sp)
	lw	$t9,_TK_EOLN
	move	$a0,$t9
	addiu	$sp,$sp,0
	jal	_match
	addiu	$sp,$sp,0
	move	$t9,$v0
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
	lw	$t9,4($sp)
	move	$a0,$t9
	li	$v0,1
	syscall
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
	addiu	$sp,$sp,0
	jal	_T
	addiu	$sp,$sp,0
	move	$t9,$v0
	sw	$t9,4($sp)
loop3:
	addiu	$sp,$sp,0
	jal	_peek
	addiu	$sp,$sp,0
	move	$t9,$v0
	lw	$t8,_TK_ADD
	seq	$t7,$t9,$t8
	bne	$t7,$0,or_left_true4
	addiu	$sp,$sp,-8
	sw	$t9,0($sp)
	sw	$t7,4($sp)
	jal	_peek
	lw	$t9,0($sp)
	lw	$t7,4($sp)
	addiu	$sp,$sp,8
	move	$t8,$v0
	lw	$t6,_TK_SUB
	seq	$t5,$t8,$t6
	move	$t9,$t5
	j	or_end4
or_left_true4:
	li	$t9,1
or_end4:
	beq	$t9,$0,intermediate_while3
	j	intermediate_endwhile3
intermediate_while3:
	j	while3
intermediate_endwhile3:
	addiu	$sp,$sp,0
	jal	_peek
	addiu	$sp,$sp,0
	move	$t9,$v0
	sw	$t9,12($sp)
	lw	$t9,12($sp)
	move	$a0,$t9
	addiu	$sp,$sp,0
	jal	_match
	addiu	$sp,$sp,0
	move	$t9,$v0
	addiu	$sp,$sp,0
	jal	_T
	addiu	$sp,$sp,0
	move	$t9,$v0
	sw	$t9,8($sp)
	lw	$t9,12($sp)
	lw	$t8,_TK_ADD
	seq	$t7,$t9,$t8
	beq	$t7,$0,intermediate_elseIf13
	j	intermediate_endelseIf13
intermediate_elseIf13:
	j	elseIf13
intermediate_endelseIf13:
	lw	$t9,4($sp)
	lw	$t8,8($sp)
	addu	$t7,$t9,$t8
	sw	$t7,4($sp)
	j	if13
elseIf13:
	lw	$t9,4($sp)
	lw	$t8,8($sp)
	subu	$t7,$t9,$t8
	sw	$t7,4($sp)
if13:
	j	loop3
while3:
	lw	$t9,4($sp)
	move	$v0,$t9
	j	_E_end
.data
err5:
.asciiz	"Error: Non-void function E must return a value\n"
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
	addiu	$sp,$sp,0
	jal	_F
	addiu	$sp,$sp,0
	move	$t9,$v0
	sw	$t9,4($sp)
loop4:
	addiu	$sp,$sp,0
	jal	_peek
	addiu	$sp,$sp,0
	move	$t9,$v0
	lw	$t8,_TK_MUL
	seq	$t7,$t9,$t8
	bne	$t7,$0,or_left_true5
	addiu	$sp,$sp,-8
	sw	$t9,0($sp)
	sw	$t7,4($sp)
	jal	_peek
	lw	$t9,0($sp)
	lw	$t7,4($sp)
	addiu	$sp,$sp,8
	move	$t8,$v0
	lw	$t6,_TK_DIV
	seq	$t5,$t8,$t6
	move	$t9,$t5
	j	or_end5
or_left_true5:
	li	$t9,1
or_end5:
	beq	$t9,$0,intermediate_while4
	j	intermediate_endwhile4
intermediate_while4:
	j	while4
intermediate_endwhile4:
	addiu	$sp,$sp,0
	jal	_peek
	addiu	$sp,$sp,0
	move	$t9,$v0
	sw	$t9,12($sp)
	lw	$t9,12($sp)
	move	$a0,$t9
	addiu	$sp,$sp,0
	jal	_match
	addiu	$sp,$sp,0
	move	$t9,$v0
	addiu	$sp,$sp,0
	jal	_F
	addiu	$sp,$sp,0
	move	$t9,$v0
	sw	$t9,8($sp)
	lw	$t9,12($sp)
	lw	$t8,_TK_MUL
	seq	$t7,$t9,$t8
	beq	$t7,$0,intermediate_elseIf14
	j	intermediate_endelseIf14
intermediate_elseIf14:
	j	elseIf14
intermediate_endelseIf14:
	lw	$t9,4($sp)
	lw	$t8,8($sp)
	mul	$t7,$t9,$t8
	sw	$t7,4($sp)
	j	if14
elseIf14:
	lw	$t9,4($sp)
	lw	$t8,8($sp)
	bne	$t8,$0,divNorm
.data
err6:
.asciiz	"Error: division by zero on line 158\n"
.text
	la	$a0,err6
	li	$v0,4
	syscall
	li	$v0,10
	syscall
divNorm:
	div	$t7,$t9,$t8
	sw	$t7,4($sp)
if14:
	j	loop4
while4:
	lw	$t9,4($sp)
	move	$v0,$t9
	j	_T_end
.data
err7:
.asciiz	"Error: Non-void function T must return a value\n"
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
	addiu	$sp,$sp,0
	jal	_peek
	addiu	$sp,$sp,0
	move	$t9,$v0
	sw	$t9,8($sp)
	lw	$t9,8($sp)
	lw	$t8,_TK_LPAREN
	seq	$t7,$t9,$t8
	beq	$t7,$0,intermediate_elseIf15
	j	intermediate_endelseIf15
intermediate_elseIf15:
	j	elseIf15
intermediate_endelseIf15:
	lw	$t9,_TK_LPAREN
	move	$a0,$t9
	addiu	$sp,$sp,0
	jal	_match
	addiu	$sp,$sp,0
	move	$t9,$v0
	addiu	$sp,$sp,0
	jal	_E
	addiu	$sp,$sp,0
	move	$t9,$v0
	sw	$t9,4($sp)
	lw	$t9,_TK_RPAREN
	move	$a0,$t9
	addiu	$sp,$sp,0
	jal	_match
	addiu	$sp,$sp,0
	move	$t9,$v0
	j	if15
elseIf15:
	lw	$t9,8($sp)
	lw	$t8,_TK_SUB
	seq	$t7,$t9,$t8
	beq	$t7,$0,intermediate_elseIf16
	j	intermediate_endelseIf16
intermediate_elseIf16:
	j	elseIf16
intermediate_endelseIf16:
	lw	$t9,_TK_SUB
	move	$a0,$t9
	addiu	$sp,$sp,0
	jal	_match
	addiu	$sp,$sp,0
	move	$t9,$v0
	addiu	$sp,$sp,0
	jal	_F
	addiu	$sp,$sp,0
	move	$t9,$v0
	subu	$t8,$0,$t9
	sw	$t8,4($sp)
	j	if16
elseIf16:
	lw	$t9,8($sp)
	lw	$t8,_TK_NUMBER
	seq	$t7,$t9,$t8
	beq	$t7,$0,intermediate_elseIf17
	j	intermediate_endelseIf17
intermediate_elseIf17:
	j	elseIf17
intermediate_endelseIf17:
	lw	$t9,_TK_NUMBER
	move	$a0,$t9
	addiu	$sp,$sp,0
	jal	_match
	addiu	$sp,$sp,0
	move	$t9,$v0
	lw	$t9,_attr
	sw	$t9,4($sp)
	j	if17
elseIf17:
	la	$t9,s6
	li	$t8,0
	li	$t7,24
prints_begin_6:
	lb	$a0,0($t9)
	beq	$t8,$t7,prints_exit_6
	li	$v0,11
	syscall
	addi	$t8,$t8,1
	addi	$t9,$t9,1
	j	prints_begin_6
prints_exit_6:
	li	$v0,10
	syscall
if17:
if16:
if15:
	lw	$t9,4($sp)
	move	$v0,$t9
	j	_F_end
.data
err8:
.asciiz	"Error: Non-void function F must return a value\n"
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
	li	$t9,1
	subu	$t8,$0,$t9
	sw	$t8,_EOF
	li	$t9,48
	sw	$t9,_ASCII_0
	li	$t9,57
	sw	$t9,_ASCII_9
	li	$t9,43
	sw	$t9,_ASCII_PLUS
	li	$t9,45
	sw	$t9,_ASCII_MINUS
	li	$t9,42
	sw	$t9,_ASCII_STAR
	li	$t9,47
	sw	$t9,_ASCII_SLASH
	li	$t9,40
	sw	$t9,_ASCII_LPAREN
	li	$t9,41
	sw	$t9,_ASCII_RPAREN
	li	$t9,32
	sw	$t9,_ASCII_SPACE
	li	$t9,9
	sw	$t9,_ASCII_TAB
	li	$t9,13
	sw	$t9,_ASCII_CR
	li	$t9,10
	sw	$t9,_ASCII_NL
	li	$t9,256
	sw	$t9,_TK_EOF
	li	$t9,257
	sw	$t9,_TK_NUMBER
	lw	$t9,_ASCII_PLUS
	sw	$t9,_TK_ADD
	lw	$t9,_ASCII_MINUS
	sw	$t9,_TK_SUB
	lw	$t9,_ASCII_STAR
	sw	$t9,_TK_MUL
	lw	$t9,_ASCII_SLASH
	sw	$t9,_TK_DIV
	lw	$t9,_ASCII_LPAREN
	sw	$t9,_TK_LPAREN
	lw	$t9,_ASCII_RPAREN
	sw	$t9,_TK_RPAREN
	lw	$t9,_ASCII_NL
	sw	$t9,_TK_EOLN
_init_end:
	lw	$ra,0($sp)
	addiu	$sp,$sp,4
	jr	$ra
