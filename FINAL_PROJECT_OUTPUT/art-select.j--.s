.data
_A_0:.word 0
.data
_A_1:.word 0
.data
_A_2:.word 0
.data
_A_3:.word 0
.data
_A_4:.word 0
.data
_A_5:.word 0
.data
_A_6:.word 0
.data
_A_7:.word 0
.data
_A_8:.word 0
.data
_A_9:.word 0
.data
_A_10:.word 0
.data
_A_11:.word 0
.data
_A_12:.word 0
.data
_A_13:.word 0
.data
_A_14:.word 0
.data
_not_there:.word 0
.data
s0:	.byte 32 
	.align 2 
.data
s1:	.byte 32 
	.align 2 
.data
s2:	.byte 32 
	.align 2 
.data
s3:	.byte 32 
	.align 2 
.data
s4:	.byte 32 
	.align 2 
.data
s5:	.byte 32 
	.align 2 
.data
s6:	.byte 32 
	.align 2 
.data
s7:	.byte 32 
	.align 2 
.data
s8:	.byte 32 
	.align 2 
.data
s9:	.byte 32 
	.align 2 
.data
s10:	.byte 32 
	.align 2 
.data
s11:	.byte 32 
	.align 2 
.data
s12:	.byte 32 
	.align 2 
.data
s13:	.byte 32 
	.align 2 
.data
s14:	.byte 32 
	.align 2 
.data
s15:	.byte 10 
	.align 2 
.data
_INTERNALX:.word 0
.text
       	.globl main
main:
	addiu	$sp,$sp,-20
	li	$t9,1
	move	$a0,$t9
	addiu	$sp,$sp,-4
	sw	$t9,0($sp)
	jal	_INTERNALseed
	lw	$t9,0($sp)
	addiu	$sp,$sp,4
	move	$t9,$v0
	li	$t9,0
	sw	$t9,4($sp)
loop0:
	li	$t9,14
	lw	$t8,4($sp)
	sle	$t7,$t8,$t9
	beq	$t7,$0,intermediate_while0
	j	intermediate_endwhile0
intermediate_while0:
	j	while0
intermediate_endwhile0:
	li	$t9,0
	lw	$t8,4($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf0
	j	intermediate_endelseIf0
intermediate_elseIf0:
	j	elseIf0
intermediate_endelseIf0:
	addiu	$sp,$sp,0
	jal	_INTERNALrandom
	addiu	$sp,$sp,0
	move	$t9,$v0
	li	$t8,100
	rem	$t7,$t9,$t8
	sw	$t7,_A_0
	j	if0
elseIf0:
	li	$t9,1
	lw	$t8,4($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf1
	j	intermediate_endelseIf1
intermediate_elseIf1:
	j	elseIf1
intermediate_endelseIf1:
	addiu	$sp,$sp,0
	jal	_INTERNALrandom
	addiu	$sp,$sp,0
	move	$t9,$v0
	li	$t8,100
	rem	$t7,$t9,$t8
	sw	$t7,_A_1
	j	if1
elseIf1:
	li	$t9,2
	lw	$t8,4($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf2
	j	intermediate_endelseIf2
intermediate_elseIf2:
	j	elseIf2
intermediate_endelseIf2:
	addiu	$sp,$sp,0
	jal	_INTERNALrandom
	addiu	$sp,$sp,0
	move	$t9,$v0
	li	$t8,100
	rem	$t7,$t9,$t8
	sw	$t7,_A_2
	j	if2
elseIf2:
	li	$t9,3
	lw	$t8,4($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf3
	j	intermediate_endelseIf3
intermediate_elseIf3:
	j	elseIf3
intermediate_endelseIf3:
	addiu	$sp,$sp,0
	jal	_INTERNALrandom
	addiu	$sp,$sp,0
	move	$t9,$v0
	li	$t8,100
	rem	$t7,$t9,$t8
	sw	$t7,_A_3
	j	if3
elseIf3:
	li	$t9,4
	lw	$t8,4($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf4
	j	intermediate_endelseIf4
intermediate_elseIf4:
	j	elseIf4
intermediate_endelseIf4:
	addiu	$sp,$sp,0
	jal	_INTERNALrandom
	addiu	$sp,$sp,0
	move	$t9,$v0
	li	$t8,100
	rem	$t7,$t9,$t8
	sw	$t7,_A_4
	j	if4
elseIf4:
	li	$t9,5
	lw	$t8,4($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf5
	j	intermediate_endelseIf5
intermediate_elseIf5:
	j	elseIf5
intermediate_endelseIf5:
	addiu	$sp,$sp,0
	jal	_INTERNALrandom
	addiu	$sp,$sp,0
	move	$t9,$v0
	li	$t8,100
	rem	$t7,$t9,$t8
	sw	$t7,_A_5
	j	if5
elseIf5:
	li	$t9,6
	lw	$t8,4($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf6
	j	intermediate_endelseIf6
intermediate_elseIf6:
	j	elseIf6
intermediate_endelseIf6:
	addiu	$sp,$sp,0
	jal	_INTERNALrandom
	addiu	$sp,$sp,0
	move	$t9,$v0
	li	$t8,100
	rem	$t7,$t9,$t8
	sw	$t7,_A_6
	j	if6
elseIf6:
	li	$t9,7
	lw	$t8,4($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf7
	j	intermediate_endelseIf7
intermediate_elseIf7:
	j	elseIf7
intermediate_endelseIf7:
	addiu	$sp,$sp,0
	jal	_INTERNALrandom
	addiu	$sp,$sp,0
	move	$t9,$v0
	li	$t8,100
	rem	$t7,$t9,$t8
	sw	$t7,_A_7
	j	if7
elseIf7:
	li	$t9,8
	lw	$t8,4($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf8
	j	intermediate_endelseIf8
intermediate_elseIf8:
	j	elseIf8
intermediate_endelseIf8:
	addiu	$sp,$sp,0
	jal	_INTERNALrandom
	addiu	$sp,$sp,0
	move	$t9,$v0
	li	$t8,100
	rem	$t7,$t9,$t8
	sw	$t7,_A_8
	j	if8
elseIf8:
	li	$t9,9
	lw	$t8,4($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf9
	j	intermediate_endelseIf9
intermediate_elseIf9:
	j	elseIf9
intermediate_endelseIf9:
	addiu	$sp,$sp,0
	jal	_INTERNALrandom
	addiu	$sp,$sp,0
	move	$t9,$v0
	li	$t8,100
	rem	$t7,$t9,$t8
	sw	$t7,_A_9
	j	if9
elseIf9:
	li	$t9,10
	lw	$t8,4($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf10
	j	intermediate_endelseIf10
intermediate_elseIf10:
	j	elseIf10
intermediate_endelseIf10:
	addiu	$sp,$sp,0
	jal	_INTERNALrandom
	addiu	$sp,$sp,0
	move	$t9,$v0
	li	$t8,100
	rem	$t7,$t9,$t8
	sw	$t7,_A_10
	j	if10
elseIf10:
	li	$t9,11
	lw	$t8,4($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf11
	j	intermediate_endelseIf11
intermediate_elseIf11:
	j	elseIf11
intermediate_endelseIf11:
	addiu	$sp,$sp,0
	jal	_INTERNALrandom
	addiu	$sp,$sp,0
	move	$t9,$v0
	li	$t8,100
	rem	$t7,$t9,$t8
	sw	$t7,_A_11
	j	if11
elseIf11:
	li	$t9,12
	lw	$t8,4($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf12
	j	intermediate_endelseIf12
intermediate_elseIf12:
	j	elseIf12
intermediate_endelseIf12:
	addiu	$sp,$sp,0
	jal	_INTERNALrandom
	addiu	$sp,$sp,0
	move	$t9,$v0
	li	$t8,100
	rem	$t7,$t9,$t8
	sw	$t7,_A_12
	j	if12
elseIf12:
	li	$t9,13
	lw	$t8,4($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf13
	j	intermediate_endelseIf13
intermediate_elseIf13:
	j	elseIf13
intermediate_endelseIf13:
	addiu	$sp,$sp,0
	jal	_INTERNALrandom
	addiu	$sp,$sp,0
	move	$t9,$v0
	li	$t8,100
	rem	$t7,$t9,$t8
	sw	$t7,_A_13
	j	if13
elseIf13:
	li	$t9,14
	lw	$t8,4($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_if14
	j	intermediate_endif14
intermediate_if14:
	j	if14
intermediate_endif14:
	addiu	$sp,$sp,0
	jal	_INTERNALrandom
	addiu	$sp,$sp,0
	move	$t9,$v0
	li	$t8,100
	rem	$t7,$t9,$t8
	sw	$t7,_A_14
if14:
if13:
if12:
if11:
if10:
if9:
if8:
if7:
if6:
if5:
if4:
if3:
if2:
if1:
if0:
	li	$t9,1
	lw	$t8,4($sp)
	addu	$t7,$t8,$t9
	sw	$t7,4($sp)
	j	loop0
while0:
	addiu	$sp,$sp,0
	jal	_printarray
	addiu	$sp,$sp,0
	move	$t9,$v0
	li	$t9,0
	sw	$t9,4($sp)
loop1:
	li	$t9,13
	lw	$t8,4($sp)
	sle	$t7,$t8,$t9
	beq	$t7,$0,intermediate_while1
	j	intermediate_endwhile1
intermediate_while1:
	j	while1
intermediate_endwhile1:
	lw	$t9,4($sp)
	sw	$t9,16($sp)
	li	$t9,1
	lw	$t8,4($sp)
	addu	$t7,$t8,$t9
	sw	$t7,8($sp)
loop2:
	li	$t9,14
	lw	$t8,8($sp)
	sle	$t7,$t8,$t9
	beq	$t7,$0,intermediate_while2
	j	intermediate_endwhile2
intermediate_while2:
	j	while2
intermediate_endwhile2:
	li	$t9,1
	lw	$t8,8($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf15
	j	intermediate_endelseIf15
intermediate_elseIf15:
	j	elseIf15
intermediate_endelseIf15:
	li	$t9,0
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf16
	j	intermediate_endelseIf16
intermediate_elseIf16:
	j	elseIf16
intermediate_endelseIf16:
	lw	$t9,_A_1
	lw	$t8,_A_0
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if17
	j	intermediate_endif17
intermediate_if17:
	j	if17
intermediate_endif17:
	li	$t9,1
	sw	$t9,16($sp)
if17:
	j	if16
elseIf16:
	li	$t9,1
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf18
	j	intermediate_endelseIf18
intermediate_elseIf18:
	j	elseIf18
intermediate_endelseIf18:
	lw	$t9,_A_1
	lw	$t8,_A_1
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if19
	j	intermediate_endif19
intermediate_if19:
	j	if19
intermediate_endif19:
	li	$t9,1
	sw	$t9,16($sp)
if19:
	j	if18
elseIf18:
	li	$t9,2
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf20
	j	intermediate_endelseIf20
intermediate_elseIf20:
	j	elseIf20
intermediate_endelseIf20:
	lw	$t9,_A_1
	lw	$t8,_A_2
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if21
	j	intermediate_endif21
intermediate_if21:
	j	if21
intermediate_endif21:
	li	$t9,1
	sw	$t9,16($sp)
if21:
	j	if20
elseIf20:
	li	$t9,3
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf22
	j	intermediate_endelseIf22
intermediate_elseIf22:
	j	elseIf22
intermediate_endelseIf22:
	lw	$t9,_A_1
	lw	$t8,_A_3
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if23
	j	intermediate_endif23
intermediate_if23:
	j	if23
intermediate_endif23:
	li	$t9,1
	sw	$t9,16($sp)
if23:
	j	if22
elseIf22:
	li	$t9,4
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf24
	j	intermediate_endelseIf24
intermediate_elseIf24:
	j	elseIf24
intermediate_endelseIf24:
	lw	$t9,_A_1
	lw	$t8,_A_4
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if25
	j	intermediate_endif25
intermediate_if25:
	j	if25
intermediate_endif25:
	li	$t9,1
	sw	$t9,16($sp)
if25:
	j	if24
elseIf24:
	li	$t9,5
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf26
	j	intermediate_endelseIf26
intermediate_elseIf26:
	j	elseIf26
intermediate_endelseIf26:
	lw	$t9,_A_1
	lw	$t8,_A_5
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if27
	j	intermediate_endif27
intermediate_if27:
	j	if27
intermediate_endif27:
	li	$t9,1
	sw	$t9,16($sp)
if27:
	j	if26
elseIf26:
	li	$t9,6
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf28
	j	intermediate_endelseIf28
intermediate_elseIf28:
	j	elseIf28
intermediate_endelseIf28:
	lw	$t9,_A_1
	lw	$t8,_A_6
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if29
	j	intermediate_endif29
intermediate_if29:
	j	if29
intermediate_endif29:
	li	$t9,1
	sw	$t9,16($sp)
if29:
	j	if28
elseIf28:
	li	$t9,7
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf30
	j	intermediate_endelseIf30
intermediate_elseIf30:
	j	elseIf30
intermediate_endelseIf30:
	lw	$t9,_A_1
	lw	$t8,_A_7
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if31
	j	intermediate_endif31
intermediate_if31:
	j	if31
intermediate_endif31:
	li	$t9,1
	sw	$t9,16($sp)
if31:
	j	if30
elseIf30:
	li	$t9,8
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf32
	j	intermediate_endelseIf32
intermediate_elseIf32:
	j	elseIf32
intermediate_endelseIf32:
	lw	$t9,_A_1
	lw	$t8,_A_8
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if33
	j	intermediate_endif33
intermediate_if33:
	j	if33
intermediate_endif33:
	li	$t9,1
	sw	$t9,16($sp)
if33:
	j	if32
elseIf32:
	li	$t9,9
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf34
	j	intermediate_endelseIf34
intermediate_elseIf34:
	j	elseIf34
intermediate_endelseIf34:
	lw	$t9,_A_1
	lw	$t8,_A_9
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if35
	j	intermediate_endif35
intermediate_if35:
	j	if35
intermediate_endif35:
	li	$t9,1
	sw	$t9,16($sp)
if35:
	j	if34
elseIf34:
	li	$t9,10
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf36
	j	intermediate_endelseIf36
intermediate_elseIf36:
	j	elseIf36
intermediate_endelseIf36:
	lw	$t9,_A_1
	lw	$t8,_A_10
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if37
	j	intermediate_endif37
intermediate_if37:
	j	if37
intermediate_endif37:
	li	$t9,1
	sw	$t9,16($sp)
if37:
	j	if36
elseIf36:
	li	$t9,11
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf38
	j	intermediate_endelseIf38
intermediate_elseIf38:
	j	elseIf38
intermediate_endelseIf38:
	lw	$t9,_A_1
	lw	$t8,_A_11
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if39
	j	intermediate_endif39
intermediate_if39:
	j	if39
intermediate_endif39:
	li	$t9,1
	sw	$t9,16($sp)
if39:
	j	if38
elseIf38:
	li	$t9,12
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf40
	j	intermediate_endelseIf40
intermediate_elseIf40:
	j	elseIf40
intermediate_endelseIf40:
	lw	$t9,_A_1
	lw	$t8,_A_12
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if41
	j	intermediate_endif41
intermediate_if41:
	j	if41
intermediate_endif41:
	li	$t9,1
	sw	$t9,16($sp)
if41:
	j	if40
elseIf40:
	li	$t9,13
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf42
	j	intermediate_endelseIf42
intermediate_elseIf42:
	j	elseIf42
intermediate_endelseIf42:
	lw	$t9,_A_1
	lw	$t8,_A_13
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if43
	j	intermediate_endif43
intermediate_if43:
	j	if43
intermediate_endif43:
	li	$t9,1
	sw	$t9,16($sp)
if43:
	j	if42
elseIf42:
	li	$t9,14
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_if44
	j	intermediate_endif44
intermediate_if44:
	j	if44
intermediate_endif44:
	lw	$t9,_A_1
	lw	$t8,_A_14
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if45
	j	intermediate_endif45
intermediate_if45:
	j	if45
intermediate_endif45:
	li	$t9,1
	sw	$t9,16($sp)
if45:
if44:
if42:
if40:
if38:
if36:
if34:
if32:
if30:
if28:
if26:
if24:
if22:
if20:
if18:
if16:
	j	if15
elseIf15:
	li	$t9,2
	lw	$t8,8($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf46
	j	intermediate_endelseIf46
intermediate_elseIf46:
	j	elseIf46
intermediate_endelseIf46:
	li	$t9,0
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf47
	j	intermediate_endelseIf47
intermediate_elseIf47:
	j	elseIf47
intermediate_endelseIf47:
	lw	$t9,_A_2
	lw	$t8,_A_0
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if48
	j	intermediate_endif48
intermediate_if48:
	j	if48
intermediate_endif48:
	li	$t9,2
	sw	$t9,16($sp)
if48:
	j	if47
elseIf47:
	li	$t9,1
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf49
	j	intermediate_endelseIf49
intermediate_elseIf49:
	j	elseIf49
intermediate_endelseIf49:
	lw	$t9,_A_2
	lw	$t8,_A_1
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if50
	j	intermediate_endif50
intermediate_if50:
	j	if50
intermediate_endif50:
	li	$t9,2
	sw	$t9,16($sp)
if50:
	j	if49
elseIf49:
	li	$t9,2
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf51
	j	intermediate_endelseIf51
intermediate_elseIf51:
	j	elseIf51
intermediate_endelseIf51:
	lw	$t9,_A_2
	lw	$t8,_A_2
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if52
	j	intermediate_endif52
intermediate_if52:
	j	if52
intermediate_endif52:
	li	$t9,2
	sw	$t9,16($sp)
if52:
	j	if51
elseIf51:
	li	$t9,3
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf53
	j	intermediate_endelseIf53
intermediate_elseIf53:
	j	elseIf53
intermediate_endelseIf53:
	lw	$t9,_A_2
	lw	$t8,_A_3
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if54
	j	intermediate_endif54
intermediate_if54:
	j	if54
intermediate_endif54:
	li	$t9,2
	sw	$t9,16($sp)
if54:
	j	if53
elseIf53:
	li	$t9,4
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf55
	j	intermediate_endelseIf55
intermediate_elseIf55:
	j	elseIf55
intermediate_endelseIf55:
	lw	$t9,_A_2
	lw	$t8,_A_4
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if56
	j	intermediate_endif56
intermediate_if56:
	j	if56
intermediate_endif56:
	li	$t9,2
	sw	$t9,16($sp)
if56:
	j	if55
elseIf55:
	li	$t9,5
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf57
	j	intermediate_endelseIf57
intermediate_elseIf57:
	j	elseIf57
intermediate_endelseIf57:
	lw	$t9,_A_2
	lw	$t8,_A_5
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if58
	j	intermediate_endif58
intermediate_if58:
	j	if58
intermediate_endif58:
	li	$t9,2
	sw	$t9,16($sp)
if58:
	j	if57
elseIf57:
	li	$t9,6
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf59
	j	intermediate_endelseIf59
intermediate_elseIf59:
	j	elseIf59
intermediate_endelseIf59:
	lw	$t9,_A_2
	lw	$t8,_A_6
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if60
	j	intermediate_endif60
intermediate_if60:
	j	if60
intermediate_endif60:
	li	$t9,2
	sw	$t9,16($sp)
if60:
	j	if59
elseIf59:
	li	$t9,7
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf61
	j	intermediate_endelseIf61
intermediate_elseIf61:
	j	elseIf61
intermediate_endelseIf61:
	lw	$t9,_A_2
	lw	$t8,_A_7
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if62
	j	intermediate_endif62
intermediate_if62:
	j	if62
intermediate_endif62:
	li	$t9,2
	sw	$t9,16($sp)
if62:
	j	if61
elseIf61:
	li	$t9,8
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf63
	j	intermediate_endelseIf63
intermediate_elseIf63:
	j	elseIf63
intermediate_endelseIf63:
	lw	$t9,_A_2
	lw	$t8,_A_8
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if64
	j	intermediate_endif64
intermediate_if64:
	j	if64
intermediate_endif64:
	li	$t9,2
	sw	$t9,16($sp)
if64:
	j	if63
elseIf63:
	li	$t9,9
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf65
	j	intermediate_endelseIf65
intermediate_elseIf65:
	j	elseIf65
intermediate_endelseIf65:
	lw	$t9,_A_2
	lw	$t8,_A_9
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if66
	j	intermediate_endif66
intermediate_if66:
	j	if66
intermediate_endif66:
	li	$t9,2
	sw	$t9,16($sp)
if66:
	j	if65
elseIf65:
	li	$t9,10
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf67
	j	intermediate_endelseIf67
intermediate_elseIf67:
	j	elseIf67
intermediate_endelseIf67:
	lw	$t9,_A_2
	lw	$t8,_A_10
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if68
	j	intermediate_endif68
intermediate_if68:
	j	if68
intermediate_endif68:
	li	$t9,2
	sw	$t9,16($sp)
if68:
	j	if67
elseIf67:
	li	$t9,11
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf69
	j	intermediate_endelseIf69
intermediate_elseIf69:
	j	elseIf69
intermediate_endelseIf69:
	lw	$t9,_A_2
	lw	$t8,_A_11
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if70
	j	intermediate_endif70
intermediate_if70:
	j	if70
intermediate_endif70:
	li	$t9,2
	sw	$t9,16($sp)
if70:
	j	if69
elseIf69:
	li	$t9,12
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf71
	j	intermediate_endelseIf71
intermediate_elseIf71:
	j	elseIf71
intermediate_endelseIf71:
	lw	$t9,_A_2
	lw	$t8,_A_12
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if72
	j	intermediate_endif72
intermediate_if72:
	j	if72
intermediate_endif72:
	li	$t9,2
	sw	$t9,16($sp)
if72:
	j	if71
elseIf71:
	li	$t9,13
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf73
	j	intermediate_endelseIf73
intermediate_elseIf73:
	j	elseIf73
intermediate_endelseIf73:
	lw	$t9,_A_2
	lw	$t8,_A_13
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if74
	j	intermediate_endif74
intermediate_if74:
	j	if74
intermediate_endif74:
	li	$t9,2
	sw	$t9,16($sp)
if74:
	j	if73
elseIf73:
	li	$t9,14
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_if75
	j	intermediate_endif75
intermediate_if75:
	j	if75
intermediate_endif75:
	lw	$t9,_A_2
	lw	$t8,_A_14
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if76
	j	intermediate_endif76
intermediate_if76:
	j	if76
intermediate_endif76:
	li	$t9,2
	sw	$t9,16($sp)
if76:
if75:
if73:
if71:
if69:
if67:
if65:
if63:
if61:
if59:
if57:
if55:
if53:
if51:
if49:
if47:
	j	if46
elseIf46:
	li	$t9,3
	lw	$t8,8($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf77
	j	intermediate_endelseIf77
intermediate_elseIf77:
	j	elseIf77
intermediate_endelseIf77:
	li	$t9,0
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf78
	j	intermediate_endelseIf78
intermediate_elseIf78:
	j	elseIf78
intermediate_endelseIf78:
	lw	$t9,_A_3
	lw	$t8,_A_0
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if79
	j	intermediate_endif79
intermediate_if79:
	j	if79
intermediate_endif79:
	li	$t9,3
	sw	$t9,16($sp)
if79:
	j	if78
elseIf78:
	li	$t9,1
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf80
	j	intermediate_endelseIf80
intermediate_elseIf80:
	j	elseIf80
intermediate_endelseIf80:
	lw	$t9,_A_3
	lw	$t8,_A_1
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if81
	j	intermediate_endif81
intermediate_if81:
	j	if81
intermediate_endif81:
	li	$t9,3
	sw	$t9,16($sp)
if81:
	j	if80
elseIf80:
	li	$t9,2
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf82
	j	intermediate_endelseIf82
intermediate_elseIf82:
	j	elseIf82
intermediate_endelseIf82:
	lw	$t9,_A_3
	lw	$t8,_A_2
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if83
	j	intermediate_endif83
intermediate_if83:
	j	if83
intermediate_endif83:
	li	$t9,3
	sw	$t9,16($sp)
if83:
	j	if82
elseIf82:
	li	$t9,3
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf84
	j	intermediate_endelseIf84
intermediate_elseIf84:
	j	elseIf84
intermediate_endelseIf84:
	lw	$t9,_A_3
	lw	$t8,_A_3
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if85
	j	intermediate_endif85
intermediate_if85:
	j	if85
intermediate_endif85:
	li	$t9,3
	sw	$t9,16($sp)
if85:
	j	if84
elseIf84:
	li	$t9,4
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf86
	j	intermediate_endelseIf86
intermediate_elseIf86:
	j	elseIf86
intermediate_endelseIf86:
	lw	$t9,_A_3
	lw	$t8,_A_4
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if87
	j	intermediate_endif87
intermediate_if87:
	j	if87
intermediate_endif87:
	li	$t9,3
	sw	$t9,16($sp)
if87:
	j	if86
elseIf86:
	li	$t9,5
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf88
	j	intermediate_endelseIf88
intermediate_elseIf88:
	j	elseIf88
intermediate_endelseIf88:
	lw	$t9,_A_3
	lw	$t8,_A_5
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if89
	j	intermediate_endif89
intermediate_if89:
	j	if89
intermediate_endif89:
	li	$t9,3
	sw	$t9,16($sp)
if89:
	j	if88
elseIf88:
	li	$t9,6
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf90
	j	intermediate_endelseIf90
intermediate_elseIf90:
	j	elseIf90
intermediate_endelseIf90:
	lw	$t9,_A_3
	lw	$t8,_A_6
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if91
	j	intermediate_endif91
intermediate_if91:
	j	if91
intermediate_endif91:
	li	$t9,3
	sw	$t9,16($sp)
if91:
	j	if90
elseIf90:
	li	$t9,7
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf92
	j	intermediate_endelseIf92
intermediate_elseIf92:
	j	elseIf92
intermediate_endelseIf92:
	lw	$t9,_A_3
	lw	$t8,_A_7
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if93
	j	intermediate_endif93
intermediate_if93:
	j	if93
intermediate_endif93:
	li	$t9,3
	sw	$t9,16($sp)
if93:
	j	if92
elseIf92:
	li	$t9,8
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf94
	j	intermediate_endelseIf94
intermediate_elseIf94:
	j	elseIf94
intermediate_endelseIf94:
	lw	$t9,_A_3
	lw	$t8,_A_8
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if95
	j	intermediate_endif95
intermediate_if95:
	j	if95
intermediate_endif95:
	li	$t9,3
	sw	$t9,16($sp)
if95:
	j	if94
elseIf94:
	li	$t9,9
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf96
	j	intermediate_endelseIf96
intermediate_elseIf96:
	j	elseIf96
intermediate_endelseIf96:
	lw	$t9,_A_3
	lw	$t8,_A_9
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if97
	j	intermediate_endif97
intermediate_if97:
	j	if97
intermediate_endif97:
	li	$t9,3
	sw	$t9,16($sp)
if97:
	j	if96
elseIf96:
	li	$t9,10
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf98
	j	intermediate_endelseIf98
intermediate_elseIf98:
	j	elseIf98
intermediate_endelseIf98:
	lw	$t9,_A_3
	lw	$t8,_A_10
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if99
	j	intermediate_endif99
intermediate_if99:
	j	if99
intermediate_endif99:
	li	$t9,3
	sw	$t9,16($sp)
if99:
	j	if98
elseIf98:
	li	$t9,11
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf100
	j	intermediate_endelseIf100
intermediate_elseIf100:
	j	elseIf100
intermediate_endelseIf100:
	lw	$t9,_A_3
	lw	$t8,_A_11
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if101
	j	intermediate_endif101
intermediate_if101:
	j	if101
intermediate_endif101:
	li	$t9,3
	sw	$t9,16($sp)
if101:
	j	if100
elseIf100:
	li	$t9,12
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf102
	j	intermediate_endelseIf102
intermediate_elseIf102:
	j	elseIf102
intermediate_endelseIf102:
	lw	$t9,_A_3
	lw	$t8,_A_12
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if103
	j	intermediate_endif103
intermediate_if103:
	j	if103
intermediate_endif103:
	li	$t9,3
	sw	$t9,16($sp)
if103:
	j	if102
elseIf102:
	li	$t9,13
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf104
	j	intermediate_endelseIf104
intermediate_elseIf104:
	j	elseIf104
intermediate_endelseIf104:
	lw	$t9,_A_3
	lw	$t8,_A_13
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if105
	j	intermediate_endif105
intermediate_if105:
	j	if105
intermediate_endif105:
	li	$t9,3
	sw	$t9,16($sp)
if105:
	j	if104
elseIf104:
	li	$t9,14
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_if106
	j	intermediate_endif106
intermediate_if106:
	j	if106
intermediate_endif106:
	lw	$t9,_A_3
	lw	$t8,_A_14
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if107
	j	intermediate_endif107
intermediate_if107:
	j	if107
intermediate_endif107:
	li	$t9,3
	sw	$t9,16($sp)
if107:
if106:
if104:
if102:
if100:
if98:
if96:
if94:
if92:
if90:
if88:
if86:
if84:
if82:
if80:
if78:
	j	if77
elseIf77:
	li	$t9,4
	lw	$t8,8($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf108
	j	intermediate_endelseIf108
intermediate_elseIf108:
	j	elseIf108
intermediate_endelseIf108:
	li	$t9,0
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf109
	j	intermediate_endelseIf109
intermediate_elseIf109:
	j	elseIf109
intermediate_endelseIf109:
	lw	$t9,_A_4
	lw	$t8,_A_0
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if110
	j	intermediate_endif110
intermediate_if110:
	j	if110
intermediate_endif110:
	li	$t9,4
	sw	$t9,16($sp)
if110:
	j	if109
elseIf109:
	li	$t9,1
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf111
	j	intermediate_endelseIf111
intermediate_elseIf111:
	j	elseIf111
intermediate_endelseIf111:
	lw	$t9,_A_4
	lw	$t8,_A_1
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if112
	j	intermediate_endif112
intermediate_if112:
	j	if112
intermediate_endif112:
	li	$t9,4
	sw	$t9,16($sp)
if112:
	j	if111
elseIf111:
	li	$t9,2
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf113
	j	intermediate_endelseIf113
intermediate_elseIf113:
	j	elseIf113
intermediate_endelseIf113:
	lw	$t9,_A_4
	lw	$t8,_A_2
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if114
	j	intermediate_endif114
intermediate_if114:
	j	if114
intermediate_endif114:
	li	$t9,4
	sw	$t9,16($sp)
if114:
	j	if113
elseIf113:
	li	$t9,3
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf115
	j	intermediate_endelseIf115
intermediate_elseIf115:
	j	elseIf115
intermediate_endelseIf115:
	lw	$t9,_A_4
	lw	$t8,_A_3
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if116
	j	intermediate_endif116
intermediate_if116:
	j	if116
intermediate_endif116:
	li	$t9,4
	sw	$t9,16($sp)
if116:
	j	if115
elseIf115:
	li	$t9,4
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf117
	j	intermediate_endelseIf117
intermediate_elseIf117:
	j	elseIf117
intermediate_endelseIf117:
	lw	$t9,_A_4
	lw	$t8,_A_4
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if118
	j	intermediate_endif118
intermediate_if118:
	j	if118
intermediate_endif118:
	li	$t9,4
	sw	$t9,16($sp)
if118:
	j	if117
elseIf117:
	li	$t9,5
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf119
	j	intermediate_endelseIf119
intermediate_elseIf119:
	j	elseIf119
intermediate_endelseIf119:
	lw	$t9,_A_4
	lw	$t8,_A_5
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if120
	j	intermediate_endif120
intermediate_if120:
	j	if120
intermediate_endif120:
	li	$t9,4
	sw	$t9,16($sp)
if120:
	j	if119
elseIf119:
	li	$t9,6
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf121
	j	intermediate_endelseIf121
intermediate_elseIf121:
	j	elseIf121
intermediate_endelseIf121:
	lw	$t9,_A_4
	lw	$t8,_A_6
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if122
	j	intermediate_endif122
intermediate_if122:
	j	if122
intermediate_endif122:
	li	$t9,4
	sw	$t9,16($sp)
if122:
	j	if121
elseIf121:
	li	$t9,7
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf123
	j	intermediate_endelseIf123
intermediate_elseIf123:
	j	elseIf123
intermediate_endelseIf123:
	lw	$t9,_A_4
	lw	$t8,_A_7
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if124
	j	intermediate_endif124
intermediate_if124:
	j	if124
intermediate_endif124:
	li	$t9,4
	sw	$t9,16($sp)
if124:
	j	if123
elseIf123:
	li	$t9,8
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf125
	j	intermediate_endelseIf125
intermediate_elseIf125:
	j	elseIf125
intermediate_endelseIf125:
	lw	$t9,_A_4
	lw	$t8,_A_8
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if126
	j	intermediate_endif126
intermediate_if126:
	j	if126
intermediate_endif126:
	li	$t9,4
	sw	$t9,16($sp)
if126:
	j	if125
elseIf125:
	li	$t9,9
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf127
	j	intermediate_endelseIf127
intermediate_elseIf127:
	j	elseIf127
intermediate_endelseIf127:
	lw	$t9,_A_4
	lw	$t8,_A_9
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if128
	j	intermediate_endif128
intermediate_if128:
	j	if128
intermediate_endif128:
	li	$t9,4
	sw	$t9,16($sp)
if128:
	j	if127
elseIf127:
	li	$t9,10
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf129
	j	intermediate_endelseIf129
intermediate_elseIf129:
	j	elseIf129
intermediate_endelseIf129:
	lw	$t9,_A_4
	lw	$t8,_A_10
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if130
	j	intermediate_endif130
intermediate_if130:
	j	if130
intermediate_endif130:
	li	$t9,4
	sw	$t9,16($sp)
if130:
	j	if129
elseIf129:
	li	$t9,11
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf131
	j	intermediate_endelseIf131
intermediate_elseIf131:
	j	elseIf131
intermediate_endelseIf131:
	lw	$t9,_A_4
	lw	$t8,_A_11
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if132
	j	intermediate_endif132
intermediate_if132:
	j	if132
intermediate_endif132:
	li	$t9,4
	sw	$t9,16($sp)
if132:
	j	if131
elseIf131:
	li	$t9,12
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf133
	j	intermediate_endelseIf133
intermediate_elseIf133:
	j	elseIf133
intermediate_endelseIf133:
	lw	$t9,_A_4
	lw	$t8,_A_12
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if134
	j	intermediate_endif134
intermediate_if134:
	j	if134
intermediate_endif134:
	li	$t9,4
	sw	$t9,16($sp)
if134:
	j	if133
elseIf133:
	li	$t9,13
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf135
	j	intermediate_endelseIf135
intermediate_elseIf135:
	j	elseIf135
intermediate_endelseIf135:
	lw	$t9,_A_4
	lw	$t8,_A_13
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if136
	j	intermediate_endif136
intermediate_if136:
	j	if136
intermediate_endif136:
	li	$t9,4
	sw	$t9,16($sp)
if136:
	j	if135
elseIf135:
	li	$t9,14
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_if137
	j	intermediate_endif137
intermediate_if137:
	j	if137
intermediate_endif137:
	lw	$t9,_A_4
	lw	$t8,_A_14
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if138
	j	intermediate_endif138
intermediate_if138:
	j	if138
intermediate_endif138:
	li	$t9,4
	sw	$t9,16($sp)
if138:
if137:
if135:
if133:
if131:
if129:
if127:
if125:
if123:
if121:
if119:
if117:
if115:
if113:
if111:
if109:
	j	if108
elseIf108:
	li	$t9,5
	lw	$t8,8($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf139
	j	intermediate_endelseIf139
intermediate_elseIf139:
	j	elseIf139
intermediate_endelseIf139:
	li	$t9,0
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf140
	j	intermediate_endelseIf140
intermediate_elseIf140:
	j	elseIf140
intermediate_endelseIf140:
	lw	$t9,_A_5
	lw	$t8,_A_0
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if141
	j	intermediate_endif141
intermediate_if141:
	j	if141
intermediate_endif141:
	li	$t9,5
	sw	$t9,16($sp)
if141:
	j	if140
elseIf140:
	li	$t9,1
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf142
	j	intermediate_endelseIf142
intermediate_elseIf142:
	j	elseIf142
intermediate_endelseIf142:
	lw	$t9,_A_5
	lw	$t8,_A_1
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if143
	j	intermediate_endif143
intermediate_if143:
	j	if143
intermediate_endif143:
	li	$t9,5
	sw	$t9,16($sp)
if143:
	j	if142
elseIf142:
	li	$t9,2
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf144
	j	intermediate_endelseIf144
intermediate_elseIf144:
	j	elseIf144
intermediate_endelseIf144:
	lw	$t9,_A_5
	lw	$t8,_A_2
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if145
	j	intermediate_endif145
intermediate_if145:
	j	if145
intermediate_endif145:
	li	$t9,5
	sw	$t9,16($sp)
if145:
	j	if144
elseIf144:
	li	$t9,3
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf146
	j	intermediate_endelseIf146
intermediate_elseIf146:
	j	elseIf146
intermediate_endelseIf146:
	lw	$t9,_A_5
	lw	$t8,_A_3
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if147
	j	intermediate_endif147
intermediate_if147:
	j	if147
intermediate_endif147:
	li	$t9,5
	sw	$t9,16($sp)
if147:
	j	if146
elseIf146:
	li	$t9,4
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf148
	j	intermediate_endelseIf148
intermediate_elseIf148:
	j	elseIf148
intermediate_endelseIf148:
	lw	$t9,_A_5
	lw	$t8,_A_4
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if149
	j	intermediate_endif149
intermediate_if149:
	j	if149
intermediate_endif149:
	li	$t9,5
	sw	$t9,16($sp)
if149:
	j	if148
elseIf148:
	li	$t9,5
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf150
	j	intermediate_endelseIf150
intermediate_elseIf150:
	j	elseIf150
intermediate_endelseIf150:
	lw	$t9,_A_5
	lw	$t8,_A_5
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if151
	j	intermediate_endif151
intermediate_if151:
	j	if151
intermediate_endif151:
	li	$t9,5
	sw	$t9,16($sp)
if151:
	j	if150
elseIf150:
	li	$t9,6
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf152
	j	intermediate_endelseIf152
intermediate_elseIf152:
	j	elseIf152
intermediate_endelseIf152:
	lw	$t9,_A_5
	lw	$t8,_A_6
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if153
	j	intermediate_endif153
intermediate_if153:
	j	if153
intermediate_endif153:
	li	$t9,5
	sw	$t9,16($sp)
if153:
	j	if152
elseIf152:
	li	$t9,7
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf154
	j	intermediate_endelseIf154
intermediate_elseIf154:
	j	elseIf154
intermediate_endelseIf154:
	lw	$t9,_A_5
	lw	$t8,_A_7
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if155
	j	intermediate_endif155
intermediate_if155:
	j	if155
intermediate_endif155:
	li	$t9,5
	sw	$t9,16($sp)
if155:
	j	if154
elseIf154:
	li	$t9,8
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf156
	j	intermediate_endelseIf156
intermediate_elseIf156:
	j	elseIf156
intermediate_endelseIf156:
	lw	$t9,_A_5
	lw	$t8,_A_8
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if157
	j	intermediate_endif157
intermediate_if157:
	j	if157
intermediate_endif157:
	li	$t9,5
	sw	$t9,16($sp)
if157:
	j	if156
elseIf156:
	li	$t9,9
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf158
	j	intermediate_endelseIf158
intermediate_elseIf158:
	j	elseIf158
intermediate_endelseIf158:
	lw	$t9,_A_5
	lw	$t8,_A_9
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if159
	j	intermediate_endif159
intermediate_if159:
	j	if159
intermediate_endif159:
	li	$t9,5
	sw	$t9,16($sp)
if159:
	j	if158
elseIf158:
	li	$t9,10
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf160
	j	intermediate_endelseIf160
intermediate_elseIf160:
	j	elseIf160
intermediate_endelseIf160:
	lw	$t9,_A_5
	lw	$t8,_A_10
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if161
	j	intermediate_endif161
intermediate_if161:
	j	if161
intermediate_endif161:
	li	$t9,5
	sw	$t9,16($sp)
if161:
	j	if160
elseIf160:
	li	$t9,11
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf162
	j	intermediate_endelseIf162
intermediate_elseIf162:
	j	elseIf162
intermediate_endelseIf162:
	lw	$t9,_A_5
	lw	$t8,_A_11
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if163
	j	intermediate_endif163
intermediate_if163:
	j	if163
intermediate_endif163:
	li	$t9,5
	sw	$t9,16($sp)
if163:
	j	if162
elseIf162:
	li	$t9,12
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf164
	j	intermediate_endelseIf164
intermediate_elseIf164:
	j	elseIf164
intermediate_endelseIf164:
	lw	$t9,_A_5
	lw	$t8,_A_12
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if165
	j	intermediate_endif165
intermediate_if165:
	j	if165
intermediate_endif165:
	li	$t9,5
	sw	$t9,16($sp)
if165:
	j	if164
elseIf164:
	li	$t9,13
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf166
	j	intermediate_endelseIf166
intermediate_elseIf166:
	j	elseIf166
intermediate_endelseIf166:
	lw	$t9,_A_5
	lw	$t8,_A_13
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if167
	j	intermediate_endif167
intermediate_if167:
	j	if167
intermediate_endif167:
	li	$t9,5
	sw	$t9,16($sp)
if167:
	j	if166
elseIf166:
	li	$t9,14
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_if168
	j	intermediate_endif168
intermediate_if168:
	j	if168
intermediate_endif168:
	lw	$t9,_A_5
	lw	$t8,_A_14
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if169
	j	intermediate_endif169
intermediate_if169:
	j	if169
intermediate_endif169:
	li	$t9,5
	sw	$t9,16($sp)
if169:
if168:
if166:
if164:
if162:
if160:
if158:
if156:
if154:
if152:
if150:
if148:
if146:
if144:
if142:
if140:
	j	if139
elseIf139:
	li	$t9,6
	lw	$t8,8($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf170
	j	intermediate_endelseIf170
intermediate_elseIf170:
	j	elseIf170
intermediate_endelseIf170:
	li	$t9,0
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf171
	j	intermediate_endelseIf171
intermediate_elseIf171:
	j	elseIf171
intermediate_endelseIf171:
	lw	$t9,_A_6
	lw	$t8,_A_0
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if172
	j	intermediate_endif172
intermediate_if172:
	j	if172
intermediate_endif172:
	li	$t9,6
	sw	$t9,16($sp)
if172:
	j	if171
elseIf171:
	li	$t9,1
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf173
	j	intermediate_endelseIf173
intermediate_elseIf173:
	j	elseIf173
intermediate_endelseIf173:
	lw	$t9,_A_6
	lw	$t8,_A_1
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if174
	j	intermediate_endif174
intermediate_if174:
	j	if174
intermediate_endif174:
	li	$t9,6
	sw	$t9,16($sp)
if174:
	j	if173
elseIf173:
	li	$t9,2
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf175
	j	intermediate_endelseIf175
intermediate_elseIf175:
	j	elseIf175
intermediate_endelseIf175:
	lw	$t9,_A_6
	lw	$t8,_A_2
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if176
	j	intermediate_endif176
intermediate_if176:
	j	if176
intermediate_endif176:
	li	$t9,6
	sw	$t9,16($sp)
if176:
	j	if175
elseIf175:
	li	$t9,3
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf177
	j	intermediate_endelseIf177
intermediate_elseIf177:
	j	elseIf177
intermediate_endelseIf177:
	lw	$t9,_A_6
	lw	$t8,_A_3
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if178
	j	intermediate_endif178
intermediate_if178:
	j	if178
intermediate_endif178:
	li	$t9,6
	sw	$t9,16($sp)
if178:
	j	if177
elseIf177:
	li	$t9,4
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf179
	j	intermediate_endelseIf179
intermediate_elseIf179:
	j	elseIf179
intermediate_endelseIf179:
	lw	$t9,_A_6
	lw	$t8,_A_4
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if180
	j	intermediate_endif180
intermediate_if180:
	j	if180
intermediate_endif180:
	li	$t9,6
	sw	$t9,16($sp)
if180:
	j	if179
elseIf179:
	li	$t9,5
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf181
	j	intermediate_endelseIf181
intermediate_elseIf181:
	j	elseIf181
intermediate_endelseIf181:
	lw	$t9,_A_6
	lw	$t8,_A_5
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if182
	j	intermediate_endif182
intermediate_if182:
	j	if182
intermediate_endif182:
	li	$t9,6
	sw	$t9,16($sp)
if182:
	j	if181
elseIf181:
	li	$t9,6
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf183
	j	intermediate_endelseIf183
intermediate_elseIf183:
	j	elseIf183
intermediate_endelseIf183:
	lw	$t9,_A_6
	lw	$t8,_A_6
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if184
	j	intermediate_endif184
intermediate_if184:
	j	if184
intermediate_endif184:
	li	$t9,6
	sw	$t9,16($sp)
if184:
	j	if183
elseIf183:
	li	$t9,7
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf185
	j	intermediate_endelseIf185
intermediate_elseIf185:
	j	elseIf185
intermediate_endelseIf185:
	lw	$t9,_A_6
	lw	$t8,_A_7
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if186
	j	intermediate_endif186
intermediate_if186:
	j	if186
intermediate_endif186:
	li	$t9,6
	sw	$t9,16($sp)
if186:
	j	if185
elseIf185:
	li	$t9,8
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf187
	j	intermediate_endelseIf187
intermediate_elseIf187:
	j	elseIf187
intermediate_endelseIf187:
	lw	$t9,_A_6
	lw	$t8,_A_8
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if188
	j	intermediate_endif188
intermediate_if188:
	j	if188
intermediate_endif188:
	li	$t9,6
	sw	$t9,16($sp)
if188:
	j	if187
elseIf187:
	li	$t9,9
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf189
	j	intermediate_endelseIf189
intermediate_elseIf189:
	j	elseIf189
intermediate_endelseIf189:
	lw	$t9,_A_6
	lw	$t8,_A_9
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if190
	j	intermediate_endif190
intermediate_if190:
	j	if190
intermediate_endif190:
	li	$t9,6
	sw	$t9,16($sp)
if190:
	j	if189
elseIf189:
	li	$t9,10
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf191
	j	intermediate_endelseIf191
intermediate_elseIf191:
	j	elseIf191
intermediate_endelseIf191:
	lw	$t9,_A_6
	lw	$t8,_A_10
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if192
	j	intermediate_endif192
intermediate_if192:
	j	if192
intermediate_endif192:
	li	$t9,6
	sw	$t9,16($sp)
if192:
	j	if191
elseIf191:
	li	$t9,11
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf193
	j	intermediate_endelseIf193
intermediate_elseIf193:
	j	elseIf193
intermediate_endelseIf193:
	lw	$t9,_A_6
	lw	$t8,_A_11
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if194
	j	intermediate_endif194
intermediate_if194:
	j	if194
intermediate_endif194:
	li	$t9,6
	sw	$t9,16($sp)
if194:
	j	if193
elseIf193:
	li	$t9,12
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf195
	j	intermediate_endelseIf195
intermediate_elseIf195:
	j	elseIf195
intermediate_endelseIf195:
	lw	$t9,_A_6
	lw	$t8,_A_12
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if196
	j	intermediate_endif196
intermediate_if196:
	j	if196
intermediate_endif196:
	li	$t9,6
	sw	$t9,16($sp)
if196:
	j	if195
elseIf195:
	li	$t9,13
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf197
	j	intermediate_endelseIf197
intermediate_elseIf197:
	j	elseIf197
intermediate_endelseIf197:
	lw	$t9,_A_6
	lw	$t8,_A_13
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if198
	j	intermediate_endif198
intermediate_if198:
	j	if198
intermediate_endif198:
	li	$t9,6
	sw	$t9,16($sp)
if198:
	j	if197
elseIf197:
	li	$t9,14
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_if199
	j	intermediate_endif199
intermediate_if199:
	j	if199
intermediate_endif199:
	lw	$t9,_A_6
	lw	$t8,_A_14
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if200
	j	intermediate_endif200
intermediate_if200:
	j	if200
intermediate_endif200:
	li	$t9,6
	sw	$t9,16($sp)
if200:
if199:
if197:
if195:
if193:
if191:
if189:
if187:
if185:
if183:
if181:
if179:
if177:
if175:
if173:
if171:
	j	if170
elseIf170:
	li	$t9,7
	lw	$t8,8($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf201
	j	intermediate_endelseIf201
intermediate_elseIf201:
	j	elseIf201
intermediate_endelseIf201:
	li	$t9,0
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf202
	j	intermediate_endelseIf202
intermediate_elseIf202:
	j	elseIf202
intermediate_endelseIf202:
	lw	$t9,_A_7
	lw	$t8,_A_0
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if203
	j	intermediate_endif203
intermediate_if203:
	j	if203
intermediate_endif203:
	li	$t9,7
	sw	$t9,16($sp)
if203:
	j	if202
elseIf202:
	li	$t9,1
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf204
	j	intermediate_endelseIf204
intermediate_elseIf204:
	j	elseIf204
intermediate_endelseIf204:
	lw	$t9,_A_7
	lw	$t8,_A_1
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if205
	j	intermediate_endif205
intermediate_if205:
	j	if205
intermediate_endif205:
	li	$t9,7
	sw	$t9,16($sp)
if205:
	j	if204
elseIf204:
	li	$t9,2
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf206
	j	intermediate_endelseIf206
intermediate_elseIf206:
	j	elseIf206
intermediate_endelseIf206:
	lw	$t9,_A_7
	lw	$t8,_A_2
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if207
	j	intermediate_endif207
intermediate_if207:
	j	if207
intermediate_endif207:
	li	$t9,7
	sw	$t9,16($sp)
if207:
	j	if206
elseIf206:
	li	$t9,3
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf208
	j	intermediate_endelseIf208
intermediate_elseIf208:
	j	elseIf208
intermediate_endelseIf208:
	lw	$t9,_A_7
	lw	$t8,_A_3
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if209
	j	intermediate_endif209
intermediate_if209:
	j	if209
intermediate_endif209:
	li	$t9,7
	sw	$t9,16($sp)
if209:
	j	if208
elseIf208:
	li	$t9,4
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf210
	j	intermediate_endelseIf210
intermediate_elseIf210:
	j	elseIf210
intermediate_endelseIf210:
	lw	$t9,_A_7
	lw	$t8,_A_4
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if211
	j	intermediate_endif211
intermediate_if211:
	j	if211
intermediate_endif211:
	li	$t9,7
	sw	$t9,16($sp)
if211:
	j	if210
elseIf210:
	li	$t9,5
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf212
	j	intermediate_endelseIf212
intermediate_elseIf212:
	j	elseIf212
intermediate_endelseIf212:
	lw	$t9,_A_7
	lw	$t8,_A_5
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if213
	j	intermediate_endif213
intermediate_if213:
	j	if213
intermediate_endif213:
	li	$t9,7
	sw	$t9,16($sp)
if213:
	j	if212
elseIf212:
	li	$t9,6
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf214
	j	intermediate_endelseIf214
intermediate_elseIf214:
	j	elseIf214
intermediate_endelseIf214:
	lw	$t9,_A_7
	lw	$t8,_A_6
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if215
	j	intermediate_endif215
intermediate_if215:
	j	if215
intermediate_endif215:
	li	$t9,7
	sw	$t9,16($sp)
if215:
	j	if214
elseIf214:
	li	$t9,7
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf216
	j	intermediate_endelseIf216
intermediate_elseIf216:
	j	elseIf216
intermediate_endelseIf216:
	lw	$t9,_A_7
	lw	$t8,_A_7
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if217
	j	intermediate_endif217
intermediate_if217:
	j	if217
intermediate_endif217:
	li	$t9,7
	sw	$t9,16($sp)
if217:
	j	if216
elseIf216:
	li	$t9,8
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf218
	j	intermediate_endelseIf218
intermediate_elseIf218:
	j	elseIf218
intermediate_endelseIf218:
	lw	$t9,_A_7
	lw	$t8,_A_8
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if219
	j	intermediate_endif219
intermediate_if219:
	j	if219
intermediate_endif219:
	li	$t9,7
	sw	$t9,16($sp)
if219:
	j	if218
elseIf218:
	li	$t9,9
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf220
	j	intermediate_endelseIf220
intermediate_elseIf220:
	j	elseIf220
intermediate_endelseIf220:
	lw	$t9,_A_7
	lw	$t8,_A_9
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if221
	j	intermediate_endif221
intermediate_if221:
	j	if221
intermediate_endif221:
	li	$t9,7
	sw	$t9,16($sp)
if221:
	j	if220
elseIf220:
	li	$t9,10
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf222
	j	intermediate_endelseIf222
intermediate_elseIf222:
	j	elseIf222
intermediate_endelseIf222:
	lw	$t9,_A_7
	lw	$t8,_A_10
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if223
	j	intermediate_endif223
intermediate_if223:
	j	if223
intermediate_endif223:
	li	$t9,7
	sw	$t9,16($sp)
if223:
	j	if222
elseIf222:
	li	$t9,11
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf224
	j	intermediate_endelseIf224
intermediate_elseIf224:
	j	elseIf224
intermediate_endelseIf224:
	lw	$t9,_A_7
	lw	$t8,_A_11
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if225
	j	intermediate_endif225
intermediate_if225:
	j	if225
intermediate_endif225:
	li	$t9,7
	sw	$t9,16($sp)
if225:
	j	if224
elseIf224:
	li	$t9,12
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf226
	j	intermediate_endelseIf226
intermediate_elseIf226:
	j	elseIf226
intermediate_endelseIf226:
	lw	$t9,_A_7
	lw	$t8,_A_12
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if227
	j	intermediate_endif227
intermediate_if227:
	j	if227
intermediate_endif227:
	li	$t9,7
	sw	$t9,16($sp)
if227:
	j	if226
elseIf226:
	li	$t9,13
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf228
	j	intermediate_endelseIf228
intermediate_elseIf228:
	j	elseIf228
intermediate_endelseIf228:
	lw	$t9,_A_7
	lw	$t8,_A_13
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if229
	j	intermediate_endif229
intermediate_if229:
	j	if229
intermediate_endif229:
	li	$t9,7
	sw	$t9,16($sp)
if229:
	j	if228
elseIf228:
	li	$t9,14
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_if230
	j	intermediate_endif230
intermediate_if230:
	j	if230
intermediate_endif230:
	lw	$t9,_A_7
	lw	$t8,_A_14
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if231
	j	intermediate_endif231
intermediate_if231:
	j	if231
intermediate_endif231:
	li	$t9,7
	sw	$t9,16($sp)
if231:
if230:
if228:
if226:
if224:
if222:
if220:
if218:
if216:
if214:
if212:
if210:
if208:
if206:
if204:
if202:
	j	if201
elseIf201:
	li	$t9,8
	lw	$t8,8($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf232
	j	intermediate_endelseIf232
intermediate_elseIf232:
	j	elseIf232
intermediate_endelseIf232:
	li	$t9,0
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf233
	j	intermediate_endelseIf233
intermediate_elseIf233:
	j	elseIf233
intermediate_endelseIf233:
	lw	$t9,_A_8
	lw	$t8,_A_0
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if234
	j	intermediate_endif234
intermediate_if234:
	j	if234
intermediate_endif234:
	li	$t9,8
	sw	$t9,16($sp)
if234:
	j	if233
elseIf233:
	li	$t9,1
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf235
	j	intermediate_endelseIf235
intermediate_elseIf235:
	j	elseIf235
intermediate_endelseIf235:
	lw	$t9,_A_8
	lw	$t8,_A_1
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if236
	j	intermediate_endif236
intermediate_if236:
	j	if236
intermediate_endif236:
	li	$t9,8
	sw	$t9,16($sp)
if236:
	j	if235
elseIf235:
	li	$t9,2
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf237
	j	intermediate_endelseIf237
intermediate_elseIf237:
	j	elseIf237
intermediate_endelseIf237:
	lw	$t9,_A_8
	lw	$t8,_A_2
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if238
	j	intermediate_endif238
intermediate_if238:
	j	if238
intermediate_endif238:
	li	$t9,8
	sw	$t9,16($sp)
if238:
	j	if237
elseIf237:
	li	$t9,3
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf239
	j	intermediate_endelseIf239
intermediate_elseIf239:
	j	elseIf239
intermediate_endelseIf239:
	lw	$t9,_A_8
	lw	$t8,_A_3
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if240
	j	intermediate_endif240
intermediate_if240:
	j	if240
intermediate_endif240:
	li	$t9,8
	sw	$t9,16($sp)
if240:
	j	if239
elseIf239:
	li	$t9,4
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf241
	j	intermediate_endelseIf241
intermediate_elseIf241:
	j	elseIf241
intermediate_endelseIf241:
	lw	$t9,_A_8
	lw	$t8,_A_4
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if242
	j	intermediate_endif242
intermediate_if242:
	j	if242
intermediate_endif242:
	li	$t9,8
	sw	$t9,16($sp)
if242:
	j	if241
elseIf241:
	li	$t9,5
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf243
	j	intermediate_endelseIf243
intermediate_elseIf243:
	j	elseIf243
intermediate_endelseIf243:
	lw	$t9,_A_8
	lw	$t8,_A_5
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if244
	j	intermediate_endif244
intermediate_if244:
	j	if244
intermediate_endif244:
	li	$t9,8
	sw	$t9,16($sp)
if244:
	j	if243
elseIf243:
	li	$t9,6
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf245
	j	intermediate_endelseIf245
intermediate_elseIf245:
	j	elseIf245
intermediate_endelseIf245:
	lw	$t9,_A_8
	lw	$t8,_A_6
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if246
	j	intermediate_endif246
intermediate_if246:
	j	if246
intermediate_endif246:
	li	$t9,8
	sw	$t9,16($sp)
if246:
	j	if245
elseIf245:
	li	$t9,7
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf247
	j	intermediate_endelseIf247
intermediate_elseIf247:
	j	elseIf247
intermediate_endelseIf247:
	lw	$t9,_A_8
	lw	$t8,_A_7
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if248
	j	intermediate_endif248
intermediate_if248:
	j	if248
intermediate_endif248:
	li	$t9,8
	sw	$t9,16($sp)
if248:
	j	if247
elseIf247:
	li	$t9,8
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf249
	j	intermediate_endelseIf249
intermediate_elseIf249:
	j	elseIf249
intermediate_endelseIf249:
	lw	$t9,_A_8
	lw	$t8,_A_8
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if250
	j	intermediate_endif250
intermediate_if250:
	j	if250
intermediate_endif250:
	li	$t9,8
	sw	$t9,16($sp)
if250:
	j	if249
elseIf249:
	li	$t9,9
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf251
	j	intermediate_endelseIf251
intermediate_elseIf251:
	j	elseIf251
intermediate_endelseIf251:
	lw	$t9,_A_8
	lw	$t8,_A_9
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if252
	j	intermediate_endif252
intermediate_if252:
	j	if252
intermediate_endif252:
	li	$t9,8
	sw	$t9,16($sp)
if252:
	j	if251
elseIf251:
	li	$t9,10
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf253
	j	intermediate_endelseIf253
intermediate_elseIf253:
	j	elseIf253
intermediate_endelseIf253:
	lw	$t9,_A_8
	lw	$t8,_A_10
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if254
	j	intermediate_endif254
intermediate_if254:
	j	if254
intermediate_endif254:
	li	$t9,8
	sw	$t9,16($sp)
if254:
	j	if253
elseIf253:
	li	$t9,11
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf255
	j	intermediate_endelseIf255
intermediate_elseIf255:
	j	elseIf255
intermediate_endelseIf255:
	lw	$t9,_A_8
	lw	$t8,_A_11
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if256
	j	intermediate_endif256
intermediate_if256:
	j	if256
intermediate_endif256:
	li	$t9,8
	sw	$t9,16($sp)
if256:
	j	if255
elseIf255:
	li	$t9,12
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf257
	j	intermediate_endelseIf257
intermediate_elseIf257:
	j	elseIf257
intermediate_endelseIf257:
	lw	$t9,_A_8
	lw	$t8,_A_12
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if258
	j	intermediate_endif258
intermediate_if258:
	j	if258
intermediate_endif258:
	li	$t9,8
	sw	$t9,16($sp)
if258:
	j	if257
elseIf257:
	li	$t9,13
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf259
	j	intermediate_endelseIf259
intermediate_elseIf259:
	j	elseIf259
intermediate_endelseIf259:
	lw	$t9,_A_8
	lw	$t8,_A_13
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if260
	j	intermediate_endif260
intermediate_if260:
	j	if260
intermediate_endif260:
	li	$t9,8
	sw	$t9,16($sp)
if260:
	j	if259
elseIf259:
	li	$t9,14
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_if261
	j	intermediate_endif261
intermediate_if261:
	j	if261
intermediate_endif261:
	lw	$t9,_A_8
	lw	$t8,_A_14
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if262
	j	intermediate_endif262
intermediate_if262:
	j	if262
intermediate_endif262:
	li	$t9,8
	sw	$t9,16($sp)
if262:
if261:
if259:
if257:
if255:
if253:
if251:
if249:
if247:
if245:
if243:
if241:
if239:
if237:
if235:
if233:
	j	if232
elseIf232:
	li	$t9,9
	lw	$t8,8($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf263
	j	intermediate_endelseIf263
intermediate_elseIf263:
	j	elseIf263
intermediate_endelseIf263:
	li	$t9,0
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf264
	j	intermediate_endelseIf264
intermediate_elseIf264:
	j	elseIf264
intermediate_endelseIf264:
	lw	$t9,_A_9
	lw	$t8,_A_0
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if265
	j	intermediate_endif265
intermediate_if265:
	j	if265
intermediate_endif265:
	li	$t9,9
	sw	$t9,16($sp)
if265:
	j	if264
elseIf264:
	li	$t9,1
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf266
	j	intermediate_endelseIf266
intermediate_elseIf266:
	j	elseIf266
intermediate_endelseIf266:
	lw	$t9,_A_9
	lw	$t8,_A_1
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if267
	j	intermediate_endif267
intermediate_if267:
	j	if267
intermediate_endif267:
	li	$t9,9
	sw	$t9,16($sp)
if267:
	j	if266
elseIf266:
	li	$t9,2
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf268
	j	intermediate_endelseIf268
intermediate_elseIf268:
	j	elseIf268
intermediate_endelseIf268:
	lw	$t9,_A_9
	lw	$t8,_A_2
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if269
	j	intermediate_endif269
intermediate_if269:
	j	if269
intermediate_endif269:
	li	$t9,9
	sw	$t9,16($sp)
if269:
	j	if268
elseIf268:
	li	$t9,3
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf270
	j	intermediate_endelseIf270
intermediate_elseIf270:
	j	elseIf270
intermediate_endelseIf270:
	lw	$t9,_A_9
	lw	$t8,_A_3
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if271
	j	intermediate_endif271
intermediate_if271:
	j	if271
intermediate_endif271:
	li	$t9,9
	sw	$t9,16($sp)
if271:
	j	if270
elseIf270:
	li	$t9,4
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf272
	j	intermediate_endelseIf272
intermediate_elseIf272:
	j	elseIf272
intermediate_endelseIf272:
	lw	$t9,_A_9
	lw	$t8,_A_4
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if273
	j	intermediate_endif273
intermediate_if273:
	j	if273
intermediate_endif273:
	li	$t9,9
	sw	$t9,16($sp)
if273:
	j	if272
elseIf272:
	li	$t9,5
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf274
	j	intermediate_endelseIf274
intermediate_elseIf274:
	j	elseIf274
intermediate_endelseIf274:
	lw	$t9,_A_9
	lw	$t8,_A_5
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if275
	j	intermediate_endif275
intermediate_if275:
	j	if275
intermediate_endif275:
	li	$t9,9
	sw	$t9,16($sp)
if275:
	j	if274
elseIf274:
	li	$t9,6
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf276
	j	intermediate_endelseIf276
intermediate_elseIf276:
	j	elseIf276
intermediate_endelseIf276:
	lw	$t9,_A_9
	lw	$t8,_A_6
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if277
	j	intermediate_endif277
intermediate_if277:
	j	if277
intermediate_endif277:
	li	$t9,9
	sw	$t9,16($sp)
if277:
	j	if276
elseIf276:
	li	$t9,7
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf278
	j	intermediate_endelseIf278
intermediate_elseIf278:
	j	elseIf278
intermediate_endelseIf278:
	lw	$t9,_A_9
	lw	$t8,_A_7
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if279
	j	intermediate_endif279
intermediate_if279:
	j	if279
intermediate_endif279:
	li	$t9,9
	sw	$t9,16($sp)
if279:
	j	if278
elseIf278:
	li	$t9,8
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf280
	j	intermediate_endelseIf280
intermediate_elseIf280:
	j	elseIf280
intermediate_endelseIf280:
	lw	$t9,_A_9
	lw	$t8,_A_8
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if281
	j	intermediate_endif281
intermediate_if281:
	j	if281
intermediate_endif281:
	li	$t9,9
	sw	$t9,16($sp)
if281:
	j	if280
elseIf280:
	li	$t9,9
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf282
	j	intermediate_endelseIf282
intermediate_elseIf282:
	j	elseIf282
intermediate_endelseIf282:
	lw	$t9,_A_9
	lw	$t8,_A_9
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if283
	j	intermediate_endif283
intermediate_if283:
	j	if283
intermediate_endif283:
	li	$t9,9
	sw	$t9,16($sp)
if283:
	j	if282
elseIf282:
	li	$t9,10
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf284
	j	intermediate_endelseIf284
intermediate_elseIf284:
	j	elseIf284
intermediate_endelseIf284:
	lw	$t9,_A_9
	lw	$t8,_A_10
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if285
	j	intermediate_endif285
intermediate_if285:
	j	if285
intermediate_endif285:
	li	$t9,9
	sw	$t9,16($sp)
if285:
	j	if284
elseIf284:
	li	$t9,11
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf286
	j	intermediate_endelseIf286
intermediate_elseIf286:
	j	elseIf286
intermediate_endelseIf286:
	lw	$t9,_A_9
	lw	$t8,_A_11
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if287
	j	intermediate_endif287
intermediate_if287:
	j	if287
intermediate_endif287:
	li	$t9,9
	sw	$t9,16($sp)
if287:
	j	if286
elseIf286:
	li	$t9,12
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf288
	j	intermediate_endelseIf288
intermediate_elseIf288:
	j	elseIf288
intermediate_endelseIf288:
	lw	$t9,_A_9
	lw	$t8,_A_12
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if289
	j	intermediate_endif289
intermediate_if289:
	j	if289
intermediate_endif289:
	li	$t9,9
	sw	$t9,16($sp)
if289:
	j	if288
elseIf288:
	li	$t9,13
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf290
	j	intermediate_endelseIf290
intermediate_elseIf290:
	j	elseIf290
intermediate_endelseIf290:
	lw	$t9,_A_9
	lw	$t8,_A_13
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if291
	j	intermediate_endif291
intermediate_if291:
	j	if291
intermediate_endif291:
	li	$t9,9
	sw	$t9,16($sp)
if291:
	j	if290
elseIf290:
	li	$t9,14
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_if292
	j	intermediate_endif292
intermediate_if292:
	j	if292
intermediate_endif292:
	lw	$t9,_A_9
	lw	$t8,_A_14
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if293
	j	intermediate_endif293
intermediate_if293:
	j	if293
intermediate_endif293:
	li	$t9,9
	sw	$t9,16($sp)
if293:
if292:
if290:
if288:
if286:
if284:
if282:
if280:
if278:
if276:
if274:
if272:
if270:
if268:
if266:
if264:
	j	if263
elseIf263:
	li	$t9,10
	lw	$t8,8($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf294
	j	intermediate_endelseIf294
intermediate_elseIf294:
	j	elseIf294
intermediate_endelseIf294:
	li	$t9,0
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf295
	j	intermediate_endelseIf295
intermediate_elseIf295:
	j	elseIf295
intermediate_endelseIf295:
	lw	$t9,_A_10
	lw	$t8,_A_0
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if296
	j	intermediate_endif296
intermediate_if296:
	j	if296
intermediate_endif296:
	li	$t9,10
	sw	$t9,16($sp)
if296:
	j	if295
elseIf295:
	li	$t9,1
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf297
	j	intermediate_endelseIf297
intermediate_elseIf297:
	j	elseIf297
intermediate_endelseIf297:
	lw	$t9,_A_10
	lw	$t8,_A_1
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if298
	j	intermediate_endif298
intermediate_if298:
	j	if298
intermediate_endif298:
	li	$t9,10
	sw	$t9,16($sp)
if298:
	j	if297
elseIf297:
	li	$t9,2
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf299
	j	intermediate_endelseIf299
intermediate_elseIf299:
	j	elseIf299
intermediate_endelseIf299:
	lw	$t9,_A_10
	lw	$t8,_A_2
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if300
	j	intermediate_endif300
intermediate_if300:
	j	if300
intermediate_endif300:
	li	$t9,10
	sw	$t9,16($sp)
if300:
	j	if299
elseIf299:
	li	$t9,3
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf301
	j	intermediate_endelseIf301
intermediate_elseIf301:
	j	elseIf301
intermediate_endelseIf301:
	lw	$t9,_A_10
	lw	$t8,_A_3
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if302
	j	intermediate_endif302
intermediate_if302:
	j	if302
intermediate_endif302:
	li	$t9,10
	sw	$t9,16($sp)
if302:
	j	if301
elseIf301:
	li	$t9,4
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf303
	j	intermediate_endelseIf303
intermediate_elseIf303:
	j	elseIf303
intermediate_endelseIf303:
	lw	$t9,_A_10
	lw	$t8,_A_4
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if304
	j	intermediate_endif304
intermediate_if304:
	j	if304
intermediate_endif304:
	li	$t9,10
	sw	$t9,16($sp)
if304:
	j	if303
elseIf303:
	li	$t9,5
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf305
	j	intermediate_endelseIf305
intermediate_elseIf305:
	j	elseIf305
intermediate_endelseIf305:
	lw	$t9,_A_10
	lw	$t8,_A_5
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if306
	j	intermediate_endif306
intermediate_if306:
	j	if306
intermediate_endif306:
	li	$t9,10
	sw	$t9,16($sp)
if306:
	j	if305
elseIf305:
	li	$t9,6
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf307
	j	intermediate_endelseIf307
intermediate_elseIf307:
	j	elseIf307
intermediate_endelseIf307:
	lw	$t9,_A_10
	lw	$t8,_A_6
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if308
	j	intermediate_endif308
intermediate_if308:
	j	if308
intermediate_endif308:
	li	$t9,10
	sw	$t9,16($sp)
if308:
	j	if307
elseIf307:
	li	$t9,7
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf309
	j	intermediate_endelseIf309
intermediate_elseIf309:
	j	elseIf309
intermediate_endelseIf309:
	lw	$t9,_A_10
	lw	$t8,_A_7
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if310
	j	intermediate_endif310
intermediate_if310:
	j	if310
intermediate_endif310:
	li	$t9,10
	sw	$t9,16($sp)
if310:
	j	if309
elseIf309:
	li	$t9,8
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf311
	j	intermediate_endelseIf311
intermediate_elseIf311:
	j	elseIf311
intermediate_endelseIf311:
	lw	$t9,_A_10
	lw	$t8,_A_8
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if312
	j	intermediate_endif312
intermediate_if312:
	j	if312
intermediate_endif312:
	li	$t9,10
	sw	$t9,16($sp)
if312:
	j	if311
elseIf311:
	li	$t9,9
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf313
	j	intermediate_endelseIf313
intermediate_elseIf313:
	j	elseIf313
intermediate_endelseIf313:
	lw	$t9,_A_10
	lw	$t8,_A_9
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if314
	j	intermediate_endif314
intermediate_if314:
	j	if314
intermediate_endif314:
	li	$t9,10
	sw	$t9,16($sp)
if314:
	j	if313
elseIf313:
	li	$t9,10
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf315
	j	intermediate_endelseIf315
intermediate_elseIf315:
	j	elseIf315
intermediate_endelseIf315:
	lw	$t9,_A_10
	lw	$t8,_A_10
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if316
	j	intermediate_endif316
intermediate_if316:
	j	if316
intermediate_endif316:
	li	$t9,10
	sw	$t9,16($sp)
if316:
	j	if315
elseIf315:
	li	$t9,11
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf317
	j	intermediate_endelseIf317
intermediate_elseIf317:
	j	elseIf317
intermediate_endelseIf317:
	lw	$t9,_A_10
	lw	$t8,_A_11
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if318
	j	intermediate_endif318
intermediate_if318:
	j	if318
intermediate_endif318:
	li	$t9,10
	sw	$t9,16($sp)
if318:
	j	if317
elseIf317:
	li	$t9,12
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf319
	j	intermediate_endelseIf319
intermediate_elseIf319:
	j	elseIf319
intermediate_endelseIf319:
	lw	$t9,_A_10
	lw	$t8,_A_12
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if320
	j	intermediate_endif320
intermediate_if320:
	j	if320
intermediate_endif320:
	li	$t9,10
	sw	$t9,16($sp)
if320:
	j	if319
elseIf319:
	li	$t9,13
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf321
	j	intermediate_endelseIf321
intermediate_elseIf321:
	j	elseIf321
intermediate_endelseIf321:
	lw	$t9,_A_10
	lw	$t8,_A_13
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if322
	j	intermediate_endif322
intermediate_if322:
	j	if322
intermediate_endif322:
	li	$t9,10
	sw	$t9,16($sp)
if322:
	j	if321
elseIf321:
	li	$t9,14
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_if323
	j	intermediate_endif323
intermediate_if323:
	j	if323
intermediate_endif323:
	lw	$t9,_A_10
	lw	$t8,_A_14
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if324
	j	intermediate_endif324
intermediate_if324:
	j	if324
intermediate_endif324:
	li	$t9,10
	sw	$t9,16($sp)
if324:
if323:
if321:
if319:
if317:
if315:
if313:
if311:
if309:
if307:
if305:
if303:
if301:
if299:
if297:
if295:
	j	if294
elseIf294:
	li	$t9,11
	lw	$t8,8($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf325
	j	intermediate_endelseIf325
intermediate_elseIf325:
	j	elseIf325
intermediate_endelseIf325:
	li	$t9,0
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf326
	j	intermediate_endelseIf326
intermediate_elseIf326:
	j	elseIf326
intermediate_endelseIf326:
	lw	$t9,_A_11
	lw	$t8,_A_0
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if327
	j	intermediate_endif327
intermediate_if327:
	j	if327
intermediate_endif327:
	li	$t9,11
	sw	$t9,16($sp)
if327:
	j	if326
elseIf326:
	li	$t9,1
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf328
	j	intermediate_endelseIf328
intermediate_elseIf328:
	j	elseIf328
intermediate_endelseIf328:
	lw	$t9,_A_11
	lw	$t8,_A_1
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if329
	j	intermediate_endif329
intermediate_if329:
	j	if329
intermediate_endif329:
	li	$t9,11
	sw	$t9,16($sp)
if329:
	j	if328
elseIf328:
	li	$t9,2
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf330
	j	intermediate_endelseIf330
intermediate_elseIf330:
	j	elseIf330
intermediate_endelseIf330:
	lw	$t9,_A_11
	lw	$t8,_A_2
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if331
	j	intermediate_endif331
intermediate_if331:
	j	if331
intermediate_endif331:
	li	$t9,11
	sw	$t9,16($sp)
if331:
	j	if330
elseIf330:
	li	$t9,3
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf332
	j	intermediate_endelseIf332
intermediate_elseIf332:
	j	elseIf332
intermediate_endelseIf332:
	lw	$t9,_A_11
	lw	$t8,_A_3
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if333
	j	intermediate_endif333
intermediate_if333:
	j	if333
intermediate_endif333:
	li	$t9,11
	sw	$t9,16($sp)
if333:
	j	if332
elseIf332:
	li	$t9,4
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf334
	j	intermediate_endelseIf334
intermediate_elseIf334:
	j	elseIf334
intermediate_endelseIf334:
	lw	$t9,_A_11
	lw	$t8,_A_4
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if335
	j	intermediate_endif335
intermediate_if335:
	j	if335
intermediate_endif335:
	li	$t9,11
	sw	$t9,16($sp)
if335:
	j	if334
elseIf334:
	li	$t9,5
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf336
	j	intermediate_endelseIf336
intermediate_elseIf336:
	j	elseIf336
intermediate_endelseIf336:
	lw	$t9,_A_11
	lw	$t8,_A_5
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if337
	j	intermediate_endif337
intermediate_if337:
	j	if337
intermediate_endif337:
	li	$t9,11
	sw	$t9,16($sp)
if337:
	j	if336
elseIf336:
	li	$t9,6
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf338
	j	intermediate_endelseIf338
intermediate_elseIf338:
	j	elseIf338
intermediate_endelseIf338:
	lw	$t9,_A_11
	lw	$t8,_A_6
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if339
	j	intermediate_endif339
intermediate_if339:
	j	if339
intermediate_endif339:
	li	$t9,11
	sw	$t9,16($sp)
if339:
	j	if338
elseIf338:
	li	$t9,7
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf340
	j	intermediate_endelseIf340
intermediate_elseIf340:
	j	elseIf340
intermediate_endelseIf340:
	lw	$t9,_A_11
	lw	$t8,_A_7
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if341
	j	intermediate_endif341
intermediate_if341:
	j	if341
intermediate_endif341:
	li	$t9,11
	sw	$t9,16($sp)
if341:
	j	if340
elseIf340:
	li	$t9,8
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf342
	j	intermediate_endelseIf342
intermediate_elseIf342:
	j	elseIf342
intermediate_endelseIf342:
	lw	$t9,_A_11
	lw	$t8,_A_8
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if343
	j	intermediate_endif343
intermediate_if343:
	j	if343
intermediate_endif343:
	li	$t9,11
	sw	$t9,16($sp)
if343:
	j	if342
elseIf342:
	li	$t9,9
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf344
	j	intermediate_endelseIf344
intermediate_elseIf344:
	j	elseIf344
intermediate_endelseIf344:
	lw	$t9,_A_11
	lw	$t8,_A_9
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if345
	j	intermediate_endif345
intermediate_if345:
	j	if345
intermediate_endif345:
	li	$t9,11
	sw	$t9,16($sp)
if345:
	j	if344
elseIf344:
	li	$t9,10
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf346
	j	intermediate_endelseIf346
intermediate_elseIf346:
	j	elseIf346
intermediate_endelseIf346:
	lw	$t9,_A_11
	lw	$t8,_A_10
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if347
	j	intermediate_endif347
intermediate_if347:
	j	if347
intermediate_endif347:
	li	$t9,11
	sw	$t9,16($sp)
if347:
	j	if346
elseIf346:
	li	$t9,11
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf348
	j	intermediate_endelseIf348
intermediate_elseIf348:
	j	elseIf348
intermediate_endelseIf348:
	lw	$t9,_A_11
	lw	$t8,_A_11
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if349
	j	intermediate_endif349
intermediate_if349:
	j	if349
intermediate_endif349:
	li	$t9,11
	sw	$t9,16($sp)
if349:
	j	if348
elseIf348:
	li	$t9,12
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf350
	j	intermediate_endelseIf350
intermediate_elseIf350:
	j	elseIf350
intermediate_endelseIf350:
	lw	$t9,_A_11
	lw	$t8,_A_12
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if351
	j	intermediate_endif351
intermediate_if351:
	j	if351
intermediate_endif351:
	li	$t9,11
	sw	$t9,16($sp)
if351:
	j	if350
elseIf350:
	li	$t9,13
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf352
	j	intermediate_endelseIf352
intermediate_elseIf352:
	j	elseIf352
intermediate_endelseIf352:
	lw	$t9,_A_11
	lw	$t8,_A_13
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if353
	j	intermediate_endif353
intermediate_if353:
	j	if353
intermediate_endif353:
	li	$t9,11
	sw	$t9,16($sp)
if353:
	j	if352
elseIf352:
	li	$t9,14
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_if354
	j	intermediate_endif354
intermediate_if354:
	j	if354
intermediate_endif354:
	lw	$t9,_A_11
	lw	$t8,_A_14
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if355
	j	intermediate_endif355
intermediate_if355:
	j	if355
intermediate_endif355:
	li	$t9,11
	sw	$t9,16($sp)
if355:
if354:
if352:
if350:
if348:
if346:
if344:
if342:
if340:
if338:
if336:
if334:
if332:
if330:
if328:
if326:
	j	if325
elseIf325:
	li	$t9,12
	lw	$t8,8($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf356
	j	intermediate_endelseIf356
intermediate_elseIf356:
	j	elseIf356
intermediate_endelseIf356:
	li	$t9,0
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf357
	j	intermediate_endelseIf357
intermediate_elseIf357:
	j	elseIf357
intermediate_endelseIf357:
	lw	$t9,_A_12
	lw	$t8,_A_0
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if358
	j	intermediate_endif358
intermediate_if358:
	j	if358
intermediate_endif358:
	li	$t9,12
	sw	$t9,16($sp)
if358:
	j	if357
elseIf357:
	li	$t9,1
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf359
	j	intermediate_endelseIf359
intermediate_elseIf359:
	j	elseIf359
intermediate_endelseIf359:
	lw	$t9,_A_12
	lw	$t8,_A_1
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if360
	j	intermediate_endif360
intermediate_if360:
	j	if360
intermediate_endif360:
	li	$t9,12
	sw	$t9,16($sp)
if360:
	j	if359
elseIf359:
	li	$t9,2
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf361
	j	intermediate_endelseIf361
intermediate_elseIf361:
	j	elseIf361
intermediate_endelseIf361:
	lw	$t9,_A_12
	lw	$t8,_A_2
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if362
	j	intermediate_endif362
intermediate_if362:
	j	if362
intermediate_endif362:
	li	$t9,12
	sw	$t9,16($sp)
if362:
	j	if361
elseIf361:
	li	$t9,3
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf363
	j	intermediate_endelseIf363
intermediate_elseIf363:
	j	elseIf363
intermediate_endelseIf363:
	lw	$t9,_A_12
	lw	$t8,_A_3
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if364
	j	intermediate_endif364
intermediate_if364:
	j	if364
intermediate_endif364:
	li	$t9,12
	sw	$t9,16($sp)
if364:
	j	if363
elseIf363:
	li	$t9,4
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf365
	j	intermediate_endelseIf365
intermediate_elseIf365:
	j	elseIf365
intermediate_endelseIf365:
	lw	$t9,_A_12
	lw	$t8,_A_4
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if366
	j	intermediate_endif366
intermediate_if366:
	j	if366
intermediate_endif366:
	li	$t9,12
	sw	$t9,16($sp)
if366:
	j	if365
elseIf365:
	li	$t9,5
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf367
	j	intermediate_endelseIf367
intermediate_elseIf367:
	j	elseIf367
intermediate_endelseIf367:
	lw	$t9,_A_12
	lw	$t8,_A_5
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if368
	j	intermediate_endif368
intermediate_if368:
	j	if368
intermediate_endif368:
	li	$t9,12
	sw	$t9,16($sp)
if368:
	j	if367
elseIf367:
	li	$t9,6
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf369
	j	intermediate_endelseIf369
intermediate_elseIf369:
	j	elseIf369
intermediate_endelseIf369:
	lw	$t9,_A_12
	lw	$t8,_A_6
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if370
	j	intermediate_endif370
intermediate_if370:
	j	if370
intermediate_endif370:
	li	$t9,12
	sw	$t9,16($sp)
if370:
	j	if369
elseIf369:
	li	$t9,7
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf371
	j	intermediate_endelseIf371
intermediate_elseIf371:
	j	elseIf371
intermediate_endelseIf371:
	lw	$t9,_A_12
	lw	$t8,_A_7
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if372
	j	intermediate_endif372
intermediate_if372:
	j	if372
intermediate_endif372:
	li	$t9,12
	sw	$t9,16($sp)
if372:
	j	if371
elseIf371:
	li	$t9,8
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf373
	j	intermediate_endelseIf373
intermediate_elseIf373:
	j	elseIf373
intermediate_endelseIf373:
	lw	$t9,_A_12
	lw	$t8,_A_8
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if374
	j	intermediate_endif374
intermediate_if374:
	j	if374
intermediate_endif374:
	li	$t9,12
	sw	$t9,16($sp)
if374:
	j	if373
elseIf373:
	li	$t9,9
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf375
	j	intermediate_endelseIf375
intermediate_elseIf375:
	j	elseIf375
intermediate_endelseIf375:
	lw	$t9,_A_12
	lw	$t8,_A_9
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if376
	j	intermediate_endif376
intermediate_if376:
	j	if376
intermediate_endif376:
	li	$t9,12
	sw	$t9,16($sp)
if376:
	j	if375
elseIf375:
	li	$t9,10
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf377
	j	intermediate_endelseIf377
intermediate_elseIf377:
	j	elseIf377
intermediate_endelseIf377:
	lw	$t9,_A_12
	lw	$t8,_A_10
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if378
	j	intermediate_endif378
intermediate_if378:
	j	if378
intermediate_endif378:
	li	$t9,12
	sw	$t9,16($sp)
if378:
	j	if377
elseIf377:
	li	$t9,11
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf379
	j	intermediate_endelseIf379
intermediate_elseIf379:
	j	elseIf379
intermediate_endelseIf379:
	lw	$t9,_A_12
	lw	$t8,_A_11
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if380
	j	intermediate_endif380
intermediate_if380:
	j	if380
intermediate_endif380:
	li	$t9,12
	sw	$t9,16($sp)
if380:
	j	if379
elseIf379:
	li	$t9,12
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf381
	j	intermediate_endelseIf381
intermediate_elseIf381:
	j	elseIf381
intermediate_endelseIf381:
	lw	$t9,_A_12
	lw	$t8,_A_12
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if382
	j	intermediate_endif382
intermediate_if382:
	j	if382
intermediate_endif382:
	li	$t9,12
	sw	$t9,16($sp)
if382:
	j	if381
elseIf381:
	li	$t9,13
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf383
	j	intermediate_endelseIf383
intermediate_elseIf383:
	j	elseIf383
intermediate_endelseIf383:
	lw	$t9,_A_12
	lw	$t8,_A_13
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if384
	j	intermediate_endif384
intermediate_if384:
	j	if384
intermediate_endif384:
	li	$t9,12
	sw	$t9,16($sp)
if384:
	j	if383
elseIf383:
	li	$t9,14
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_if385
	j	intermediate_endif385
intermediate_if385:
	j	if385
intermediate_endif385:
	lw	$t9,_A_12
	lw	$t8,_A_14
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if386
	j	intermediate_endif386
intermediate_if386:
	j	if386
intermediate_endif386:
	li	$t9,12
	sw	$t9,16($sp)
if386:
if385:
if383:
if381:
if379:
if377:
if375:
if373:
if371:
if369:
if367:
if365:
if363:
if361:
if359:
if357:
	j	if356
elseIf356:
	li	$t9,13
	lw	$t8,8($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf387
	j	intermediate_endelseIf387
intermediate_elseIf387:
	j	elseIf387
intermediate_endelseIf387:
	li	$t9,0
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf388
	j	intermediate_endelseIf388
intermediate_elseIf388:
	j	elseIf388
intermediate_endelseIf388:
	lw	$t9,_A_13
	lw	$t8,_A_0
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if389
	j	intermediate_endif389
intermediate_if389:
	j	if389
intermediate_endif389:
	li	$t9,13
	sw	$t9,16($sp)
if389:
	j	if388
elseIf388:
	li	$t9,1
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf390
	j	intermediate_endelseIf390
intermediate_elseIf390:
	j	elseIf390
intermediate_endelseIf390:
	lw	$t9,_A_13
	lw	$t8,_A_1
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if391
	j	intermediate_endif391
intermediate_if391:
	j	if391
intermediate_endif391:
	li	$t9,13
	sw	$t9,16($sp)
if391:
	j	if390
elseIf390:
	li	$t9,2
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf392
	j	intermediate_endelseIf392
intermediate_elseIf392:
	j	elseIf392
intermediate_endelseIf392:
	lw	$t9,_A_13
	lw	$t8,_A_2
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if393
	j	intermediate_endif393
intermediate_if393:
	j	if393
intermediate_endif393:
	li	$t9,13
	sw	$t9,16($sp)
if393:
	j	if392
elseIf392:
	li	$t9,3
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf394
	j	intermediate_endelseIf394
intermediate_elseIf394:
	j	elseIf394
intermediate_endelseIf394:
	lw	$t9,_A_13
	lw	$t8,_A_3
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if395
	j	intermediate_endif395
intermediate_if395:
	j	if395
intermediate_endif395:
	li	$t9,13
	sw	$t9,16($sp)
if395:
	j	if394
elseIf394:
	li	$t9,4
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf396
	j	intermediate_endelseIf396
intermediate_elseIf396:
	j	elseIf396
intermediate_endelseIf396:
	lw	$t9,_A_13
	lw	$t8,_A_4
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if397
	j	intermediate_endif397
intermediate_if397:
	j	if397
intermediate_endif397:
	li	$t9,13
	sw	$t9,16($sp)
if397:
	j	if396
elseIf396:
	li	$t9,5
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf398
	j	intermediate_endelseIf398
intermediate_elseIf398:
	j	elseIf398
intermediate_endelseIf398:
	lw	$t9,_A_13
	lw	$t8,_A_5
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if399
	j	intermediate_endif399
intermediate_if399:
	j	if399
intermediate_endif399:
	li	$t9,13
	sw	$t9,16($sp)
if399:
	j	if398
elseIf398:
	li	$t9,6
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf400
	j	intermediate_endelseIf400
intermediate_elseIf400:
	j	elseIf400
intermediate_endelseIf400:
	lw	$t9,_A_13
	lw	$t8,_A_6
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if401
	j	intermediate_endif401
intermediate_if401:
	j	if401
intermediate_endif401:
	li	$t9,13
	sw	$t9,16($sp)
if401:
	j	if400
elseIf400:
	li	$t9,7
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf402
	j	intermediate_endelseIf402
intermediate_elseIf402:
	j	elseIf402
intermediate_endelseIf402:
	lw	$t9,_A_13
	lw	$t8,_A_7
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if403
	j	intermediate_endif403
intermediate_if403:
	j	if403
intermediate_endif403:
	li	$t9,13
	sw	$t9,16($sp)
if403:
	j	if402
elseIf402:
	li	$t9,8
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf404
	j	intermediate_endelseIf404
intermediate_elseIf404:
	j	elseIf404
intermediate_endelseIf404:
	lw	$t9,_A_13
	lw	$t8,_A_8
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if405
	j	intermediate_endif405
intermediate_if405:
	j	if405
intermediate_endif405:
	li	$t9,13
	sw	$t9,16($sp)
if405:
	j	if404
elseIf404:
	li	$t9,9
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf406
	j	intermediate_endelseIf406
intermediate_elseIf406:
	j	elseIf406
intermediate_endelseIf406:
	lw	$t9,_A_13
	lw	$t8,_A_9
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if407
	j	intermediate_endif407
intermediate_if407:
	j	if407
intermediate_endif407:
	li	$t9,13
	sw	$t9,16($sp)
if407:
	j	if406
elseIf406:
	li	$t9,10
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf408
	j	intermediate_endelseIf408
intermediate_elseIf408:
	j	elseIf408
intermediate_endelseIf408:
	lw	$t9,_A_13
	lw	$t8,_A_10
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if409
	j	intermediate_endif409
intermediate_if409:
	j	if409
intermediate_endif409:
	li	$t9,13
	sw	$t9,16($sp)
if409:
	j	if408
elseIf408:
	li	$t9,11
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf410
	j	intermediate_endelseIf410
intermediate_elseIf410:
	j	elseIf410
intermediate_endelseIf410:
	lw	$t9,_A_13
	lw	$t8,_A_11
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if411
	j	intermediate_endif411
intermediate_if411:
	j	if411
intermediate_endif411:
	li	$t9,13
	sw	$t9,16($sp)
if411:
	j	if410
elseIf410:
	li	$t9,12
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf412
	j	intermediate_endelseIf412
intermediate_elseIf412:
	j	elseIf412
intermediate_endelseIf412:
	lw	$t9,_A_13
	lw	$t8,_A_12
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if413
	j	intermediate_endif413
intermediate_if413:
	j	if413
intermediate_endif413:
	li	$t9,13
	sw	$t9,16($sp)
if413:
	j	if412
elseIf412:
	li	$t9,13
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf414
	j	intermediate_endelseIf414
intermediate_elseIf414:
	j	elseIf414
intermediate_endelseIf414:
	lw	$t9,_A_13
	lw	$t8,_A_13
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if415
	j	intermediate_endif415
intermediate_if415:
	j	if415
intermediate_endif415:
	li	$t9,13
	sw	$t9,16($sp)
if415:
	j	if414
elseIf414:
	li	$t9,14
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_if416
	j	intermediate_endif416
intermediate_if416:
	j	if416
intermediate_endif416:
	lw	$t9,_A_13
	lw	$t8,_A_14
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if417
	j	intermediate_endif417
intermediate_if417:
	j	if417
intermediate_endif417:
	li	$t9,13
	sw	$t9,16($sp)
if417:
if416:
if414:
if412:
if410:
if408:
if406:
if404:
if402:
if400:
if398:
if396:
if394:
if392:
if390:
if388:
	j	if387
elseIf387:
	li	$t9,14
	lw	$t8,8($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_if418
	j	intermediate_endif418
intermediate_if418:
	j	if418
intermediate_endif418:
	li	$t9,0
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf419
	j	intermediate_endelseIf419
intermediate_elseIf419:
	j	elseIf419
intermediate_endelseIf419:
	lw	$t9,_A_14
	lw	$t8,_A_0
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if420
	j	intermediate_endif420
intermediate_if420:
	j	if420
intermediate_endif420:
	li	$t9,14
	sw	$t9,16($sp)
if420:
	j	if419
elseIf419:
	li	$t9,1
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf421
	j	intermediate_endelseIf421
intermediate_elseIf421:
	j	elseIf421
intermediate_endelseIf421:
	lw	$t9,_A_14
	lw	$t8,_A_1
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if422
	j	intermediate_endif422
intermediate_if422:
	j	if422
intermediate_endif422:
	li	$t9,14
	sw	$t9,16($sp)
if422:
	j	if421
elseIf421:
	li	$t9,2
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf423
	j	intermediate_endelseIf423
intermediate_elseIf423:
	j	elseIf423
intermediate_endelseIf423:
	lw	$t9,_A_14
	lw	$t8,_A_2
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if424
	j	intermediate_endif424
intermediate_if424:
	j	if424
intermediate_endif424:
	li	$t9,14
	sw	$t9,16($sp)
if424:
	j	if423
elseIf423:
	li	$t9,3
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf425
	j	intermediate_endelseIf425
intermediate_elseIf425:
	j	elseIf425
intermediate_endelseIf425:
	lw	$t9,_A_14
	lw	$t8,_A_3
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if426
	j	intermediate_endif426
intermediate_if426:
	j	if426
intermediate_endif426:
	li	$t9,14
	sw	$t9,16($sp)
if426:
	j	if425
elseIf425:
	li	$t9,4
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf427
	j	intermediate_endelseIf427
intermediate_elseIf427:
	j	elseIf427
intermediate_endelseIf427:
	lw	$t9,_A_14
	lw	$t8,_A_4
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if428
	j	intermediate_endif428
intermediate_if428:
	j	if428
intermediate_endif428:
	li	$t9,14
	sw	$t9,16($sp)
if428:
	j	if427
elseIf427:
	li	$t9,5
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf429
	j	intermediate_endelseIf429
intermediate_elseIf429:
	j	elseIf429
intermediate_endelseIf429:
	lw	$t9,_A_14
	lw	$t8,_A_5
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if430
	j	intermediate_endif430
intermediate_if430:
	j	if430
intermediate_endif430:
	li	$t9,14
	sw	$t9,16($sp)
if430:
	j	if429
elseIf429:
	li	$t9,6
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf431
	j	intermediate_endelseIf431
intermediate_elseIf431:
	j	elseIf431
intermediate_endelseIf431:
	lw	$t9,_A_14
	lw	$t8,_A_6
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if432
	j	intermediate_endif432
intermediate_if432:
	j	if432
intermediate_endif432:
	li	$t9,14
	sw	$t9,16($sp)
if432:
	j	if431
elseIf431:
	li	$t9,7
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf433
	j	intermediate_endelseIf433
intermediate_elseIf433:
	j	elseIf433
intermediate_endelseIf433:
	lw	$t9,_A_14
	lw	$t8,_A_7
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if434
	j	intermediate_endif434
intermediate_if434:
	j	if434
intermediate_endif434:
	li	$t9,14
	sw	$t9,16($sp)
if434:
	j	if433
elseIf433:
	li	$t9,8
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf435
	j	intermediate_endelseIf435
intermediate_elseIf435:
	j	elseIf435
intermediate_endelseIf435:
	lw	$t9,_A_14
	lw	$t8,_A_8
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if436
	j	intermediate_endif436
intermediate_if436:
	j	if436
intermediate_endif436:
	li	$t9,14
	sw	$t9,16($sp)
if436:
	j	if435
elseIf435:
	li	$t9,9
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf437
	j	intermediate_endelseIf437
intermediate_elseIf437:
	j	elseIf437
intermediate_endelseIf437:
	lw	$t9,_A_14
	lw	$t8,_A_9
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if438
	j	intermediate_endif438
intermediate_if438:
	j	if438
intermediate_endif438:
	li	$t9,14
	sw	$t9,16($sp)
if438:
	j	if437
elseIf437:
	li	$t9,10
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf439
	j	intermediate_endelseIf439
intermediate_elseIf439:
	j	elseIf439
intermediate_endelseIf439:
	lw	$t9,_A_14
	lw	$t8,_A_10
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if440
	j	intermediate_endif440
intermediate_if440:
	j	if440
intermediate_endif440:
	li	$t9,14
	sw	$t9,16($sp)
if440:
	j	if439
elseIf439:
	li	$t9,11
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf441
	j	intermediate_endelseIf441
intermediate_elseIf441:
	j	elseIf441
intermediate_endelseIf441:
	lw	$t9,_A_14
	lw	$t8,_A_11
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if442
	j	intermediate_endif442
intermediate_if442:
	j	if442
intermediate_endif442:
	li	$t9,14
	sw	$t9,16($sp)
if442:
	j	if441
elseIf441:
	li	$t9,12
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf443
	j	intermediate_endelseIf443
intermediate_elseIf443:
	j	elseIf443
intermediate_endelseIf443:
	lw	$t9,_A_14
	lw	$t8,_A_12
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if444
	j	intermediate_endif444
intermediate_if444:
	j	if444
intermediate_endif444:
	li	$t9,14
	sw	$t9,16($sp)
if444:
	j	if443
elseIf443:
	li	$t9,13
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf445
	j	intermediate_endelseIf445
intermediate_elseIf445:
	j	elseIf445
intermediate_endelseIf445:
	lw	$t9,_A_14
	lw	$t8,_A_13
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if446
	j	intermediate_endif446
intermediate_if446:
	j	if446
intermediate_endif446:
	li	$t9,14
	sw	$t9,16($sp)
if446:
	j	if445
elseIf445:
	li	$t9,14
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_if447
	j	intermediate_endif447
intermediate_if447:
	j	if447
intermediate_endif447:
	lw	$t9,_A_14
	lw	$t8,_A_14
	slt	$t7,$t9,$t8
	beq	$t7,$0,intermediate_if448
	j	intermediate_endif448
intermediate_if448:
	j	if448
intermediate_endif448:
	li	$t9,14
	sw	$t9,16($sp)
if448:
if447:
if445:
if443:
if441:
if439:
if437:
if435:
if433:
if431:
if429:
if427:
if425:
if423:
if421:
if419:
if418:
if387:
if356:
if325:
if294:
if263:
if232:
if201:
if170:
if139:
if108:
if77:
if46:
if15:
	li	$t9,1
	lw	$t8,8($sp)
	addu	$t7,$t8,$t9
	sw	$t7,8($sp)
	j	loop2
while2:
	li	$t9,0
	lw	$t8,4($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf449
	j	intermediate_endelseIf449
intermediate_elseIf449:
	j	elseIf449
intermediate_endelseIf449:
	li	$t9,0
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf450
	j	intermediate_endelseIf450
intermediate_elseIf450:
	j	elseIf450
intermediate_endelseIf450:
	lw	$t9,_A_0
	sw	$t9,12($sp)
	lw	$t9,_A_0
	sw	$t9,_A_0
	lw	$t9,12($sp)
	sw	$t9,_A_0
	j	if450
elseIf450:
	li	$t9,1
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf451
	j	intermediate_endelseIf451
intermediate_elseIf451:
	j	elseIf451
intermediate_endelseIf451:
	lw	$t9,_A_1
	sw	$t9,12($sp)
	lw	$t9,_A_0
	sw	$t9,_A_1
	lw	$t9,12($sp)
	sw	$t9,_A_0
	j	if451
elseIf451:
	li	$t9,2
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf452
	j	intermediate_endelseIf452
intermediate_elseIf452:
	j	elseIf452
intermediate_endelseIf452:
	lw	$t9,_A_2
	sw	$t9,12($sp)
	lw	$t9,_A_0
	sw	$t9,_A_2
	lw	$t9,12($sp)
	sw	$t9,_A_0
	j	if452
elseIf452:
	li	$t9,3
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf453
	j	intermediate_endelseIf453
intermediate_elseIf453:
	j	elseIf453
intermediate_endelseIf453:
	lw	$t9,_A_3
	sw	$t9,12($sp)
	lw	$t9,_A_0
	sw	$t9,_A_3
	lw	$t9,12($sp)
	sw	$t9,_A_0
	j	if453
elseIf453:
	li	$t9,4
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf454
	j	intermediate_endelseIf454
intermediate_elseIf454:
	j	elseIf454
intermediate_endelseIf454:
	lw	$t9,_A_4
	sw	$t9,12($sp)
	lw	$t9,_A_0
	sw	$t9,_A_4
	lw	$t9,12($sp)
	sw	$t9,_A_0
	j	if454
elseIf454:
	li	$t9,5
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf455
	j	intermediate_endelseIf455
intermediate_elseIf455:
	j	elseIf455
intermediate_endelseIf455:
	lw	$t9,_A_5
	sw	$t9,12($sp)
	lw	$t9,_A_0
	sw	$t9,_A_5
	lw	$t9,12($sp)
	sw	$t9,_A_0
	j	if455
elseIf455:
	li	$t9,6
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf456
	j	intermediate_endelseIf456
intermediate_elseIf456:
	j	elseIf456
intermediate_endelseIf456:
	lw	$t9,_A_6
	sw	$t9,12($sp)
	lw	$t9,_A_0
	sw	$t9,_A_6
	lw	$t9,12($sp)
	sw	$t9,_A_0
	j	if456
elseIf456:
	li	$t9,7
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf457
	j	intermediate_endelseIf457
intermediate_elseIf457:
	j	elseIf457
intermediate_endelseIf457:
	lw	$t9,_A_7
	sw	$t9,12($sp)
	lw	$t9,_A_0
	sw	$t9,_A_7
	lw	$t9,12($sp)
	sw	$t9,_A_0
	j	if457
elseIf457:
	li	$t9,8
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf458
	j	intermediate_endelseIf458
intermediate_elseIf458:
	j	elseIf458
intermediate_endelseIf458:
	lw	$t9,_A_8
	sw	$t9,12($sp)
	lw	$t9,_A_0
	sw	$t9,_A_8
	lw	$t9,12($sp)
	sw	$t9,_A_0
	j	if458
elseIf458:
	li	$t9,9
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf459
	j	intermediate_endelseIf459
intermediate_elseIf459:
	j	elseIf459
intermediate_endelseIf459:
	lw	$t9,_A_9
	sw	$t9,12($sp)
	lw	$t9,_A_0
	sw	$t9,_A_9
	lw	$t9,12($sp)
	sw	$t9,_A_0
	j	if459
elseIf459:
	li	$t9,10
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf460
	j	intermediate_endelseIf460
intermediate_elseIf460:
	j	elseIf460
intermediate_endelseIf460:
	lw	$t9,_A_10
	sw	$t9,12($sp)
	lw	$t9,_A_0
	sw	$t9,_A_10
	lw	$t9,12($sp)
	sw	$t9,_A_0
	j	if460
elseIf460:
	li	$t9,11
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf461
	j	intermediate_endelseIf461
intermediate_elseIf461:
	j	elseIf461
intermediate_endelseIf461:
	lw	$t9,_A_11
	sw	$t9,12($sp)
	lw	$t9,_A_0
	sw	$t9,_A_11
	lw	$t9,12($sp)
	sw	$t9,_A_0
	j	if461
elseIf461:
	li	$t9,12
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf462
	j	intermediate_endelseIf462
intermediate_elseIf462:
	j	elseIf462
intermediate_endelseIf462:
	lw	$t9,_A_12
	sw	$t9,12($sp)
	lw	$t9,_A_0
	sw	$t9,_A_12
	lw	$t9,12($sp)
	sw	$t9,_A_0
	j	if462
elseIf462:
	li	$t9,13
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf463
	j	intermediate_endelseIf463
intermediate_elseIf463:
	j	elseIf463
intermediate_endelseIf463:
	lw	$t9,_A_13
	sw	$t9,12($sp)
	lw	$t9,_A_0
	sw	$t9,_A_13
	lw	$t9,12($sp)
	sw	$t9,_A_0
	j	if463
elseIf463:
	li	$t9,14
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_if464
	j	intermediate_endif464
intermediate_if464:
	j	if464
intermediate_endif464:
	lw	$t9,_A_14
	sw	$t9,12($sp)
	lw	$t9,_A_0
	sw	$t9,_A_14
	lw	$t9,12($sp)
	sw	$t9,_A_0
if464:
if463:
if462:
if461:
if460:
if459:
if458:
if457:
if456:
if455:
if454:
if453:
if452:
if451:
if450:
	j	if449
elseIf449:
	li	$t9,1
	lw	$t8,4($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf465
	j	intermediate_endelseIf465
intermediate_elseIf465:
	j	elseIf465
intermediate_endelseIf465:
	li	$t9,0
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf466
	j	intermediate_endelseIf466
intermediate_elseIf466:
	j	elseIf466
intermediate_endelseIf466:
	lw	$t9,_A_0
	sw	$t9,12($sp)
	lw	$t9,_A_1
	sw	$t9,_A_0
	lw	$t9,12($sp)
	sw	$t9,_A_1
	j	if466
elseIf466:
	li	$t9,1
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf467
	j	intermediate_endelseIf467
intermediate_elseIf467:
	j	elseIf467
intermediate_endelseIf467:
	lw	$t9,_A_1
	sw	$t9,12($sp)
	lw	$t9,_A_1
	sw	$t9,_A_1
	lw	$t9,12($sp)
	sw	$t9,_A_1
	j	if467
elseIf467:
	li	$t9,2
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf468
	j	intermediate_endelseIf468
intermediate_elseIf468:
	j	elseIf468
intermediate_endelseIf468:
	lw	$t9,_A_2
	sw	$t9,12($sp)
	lw	$t9,_A_1
	sw	$t9,_A_2
	lw	$t9,12($sp)
	sw	$t9,_A_1
	j	if468
elseIf468:
	li	$t9,3
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf469
	j	intermediate_endelseIf469
intermediate_elseIf469:
	j	elseIf469
intermediate_endelseIf469:
	lw	$t9,_A_3
	sw	$t9,12($sp)
	lw	$t9,_A_1
	sw	$t9,_A_3
	lw	$t9,12($sp)
	sw	$t9,_A_1
	j	if469
elseIf469:
	li	$t9,4
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf470
	j	intermediate_endelseIf470
intermediate_elseIf470:
	j	elseIf470
intermediate_endelseIf470:
	lw	$t9,_A_4
	sw	$t9,12($sp)
	lw	$t9,_A_1
	sw	$t9,_A_4
	lw	$t9,12($sp)
	sw	$t9,_A_1
	j	if470
elseIf470:
	li	$t9,5
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf471
	j	intermediate_endelseIf471
intermediate_elseIf471:
	j	elseIf471
intermediate_endelseIf471:
	lw	$t9,_A_5
	sw	$t9,12($sp)
	lw	$t9,_A_1
	sw	$t9,_A_5
	lw	$t9,12($sp)
	sw	$t9,_A_1
	j	if471
elseIf471:
	li	$t9,6
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf472
	j	intermediate_endelseIf472
intermediate_elseIf472:
	j	elseIf472
intermediate_endelseIf472:
	lw	$t9,_A_6
	sw	$t9,12($sp)
	lw	$t9,_A_1
	sw	$t9,_A_6
	lw	$t9,12($sp)
	sw	$t9,_A_1
	j	if472
elseIf472:
	li	$t9,7
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf473
	j	intermediate_endelseIf473
intermediate_elseIf473:
	j	elseIf473
intermediate_endelseIf473:
	lw	$t9,_A_7
	sw	$t9,12($sp)
	lw	$t9,_A_1
	sw	$t9,_A_7
	lw	$t9,12($sp)
	sw	$t9,_A_1
	j	if473
elseIf473:
	li	$t9,8
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf474
	j	intermediate_endelseIf474
intermediate_elseIf474:
	j	elseIf474
intermediate_endelseIf474:
	lw	$t9,_A_8
	sw	$t9,12($sp)
	lw	$t9,_A_1
	sw	$t9,_A_8
	lw	$t9,12($sp)
	sw	$t9,_A_1
	j	if474
elseIf474:
	li	$t9,9
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf475
	j	intermediate_endelseIf475
intermediate_elseIf475:
	j	elseIf475
intermediate_endelseIf475:
	lw	$t9,_A_9
	sw	$t9,12($sp)
	lw	$t9,_A_1
	sw	$t9,_A_9
	lw	$t9,12($sp)
	sw	$t9,_A_1
	j	if475
elseIf475:
	li	$t9,10
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf476
	j	intermediate_endelseIf476
intermediate_elseIf476:
	j	elseIf476
intermediate_endelseIf476:
	lw	$t9,_A_10
	sw	$t9,12($sp)
	lw	$t9,_A_1
	sw	$t9,_A_10
	lw	$t9,12($sp)
	sw	$t9,_A_1
	j	if476
elseIf476:
	li	$t9,11
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf477
	j	intermediate_endelseIf477
intermediate_elseIf477:
	j	elseIf477
intermediate_endelseIf477:
	lw	$t9,_A_11
	sw	$t9,12($sp)
	lw	$t9,_A_1
	sw	$t9,_A_11
	lw	$t9,12($sp)
	sw	$t9,_A_1
	j	if477
elseIf477:
	li	$t9,12
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf478
	j	intermediate_endelseIf478
intermediate_elseIf478:
	j	elseIf478
intermediate_endelseIf478:
	lw	$t9,_A_12
	sw	$t9,12($sp)
	lw	$t9,_A_1
	sw	$t9,_A_12
	lw	$t9,12($sp)
	sw	$t9,_A_1
	j	if478
elseIf478:
	li	$t9,13
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf479
	j	intermediate_endelseIf479
intermediate_elseIf479:
	j	elseIf479
intermediate_endelseIf479:
	lw	$t9,_A_13
	sw	$t9,12($sp)
	lw	$t9,_A_1
	sw	$t9,_A_13
	lw	$t9,12($sp)
	sw	$t9,_A_1
	j	if479
elseIf479:
	li	$t9,14
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_if480
	j	intermediate_endif480
intermediate_if480:
	j	if480
intermediate_endif480:
	lw	$t9,_A_14
	sw	$t9,12($sp)
	lw	$t9,_A_1
	sw	$t9,_A_14
	lw	$t9,12($sp)
	sw	$t9,_A_1
if480:
if479:
if478:
if477:
if476:
if475:
if474:
if473:
if472:
if471:
if470:
if469:
if468:
if467:
if466:
	j	if465
elseIf465:
	li	$t9,2
	lw	$t8,4($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf481
	j	intermediate_endelseIf481
intermediate_elseIf481:
	j	elseIf481
intermediate_endelseIf481:
	li	$t9,0
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf482
	j	intermediate_endelseIf482
intermediate_elseIf482:
	j	elseIf482
intermediate_endelseIf482:
	lw	$t9,_A_0
	sw	$t9,12($sp)
	lw	$t9,_A_2
	sw	$t9,_A_0
	lw	$t9,12($sp)
	sw	$t9,_A_2
	j	if482
elseIf482:
	li	$t9,1
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf483
	j	intermediate_endelseIf483
intermediate_elseIf483:
	j	elseIf483
intermediate_endelseIf483:
	lw	$t9,_A_1
	sw	$t9,12($sp)
	lw	$t9,_A_2
	sw	$t9,_A_1
	lw	$t9,12($sp)
	sw	$t9,_A_2
	j	if483
elseIf483:
	li	$t9,2
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf484
	j	intermediate_endelseIf484
intermediate_elseIf484:
	j	elseIf484
intermediate_endelseIf484:
	lw	$t9,_A_2
	sw	$t9,12($sp)
	lw	$t9,_A_2
	sw	$t9,_A_2
	lw	$t9,12($sp)
	sw	$t9,_A_2
	j	if484
elseIf484:
	li	$t9,3
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf485
	j	intermediate_endelseIf485
intermediate_elseIf485:
	j	elseIf485
intermediate_endelseIf485:
	lw	$t9,_A_3
	sw	$t9,12($sp)
	lw	$t9,_A_2
	sw	$t9,_A_3
	lw	$t9,12($sp)
	sw	$t9,_A_2
	j	if485
elseIf485:
	li	$t9,4
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf486
	j	intermediate_endelseIf486
intermediate_elseIf486:
	j	elseIf486
intermediate_endelseIf486:
	lw	$t9,_A_4
	sw	$t9,12($sp)
	lw	$t9,_A_2
	sw	$t9,_A_4
	lw	$t9,12($sp)
	sw	$t9,_A_2
	j	if486
elseIf486:
	li	$t9,5
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf487
	j	intermediate_endelseIf487
intermediate_elseIf487:
	j	elseIf487
intermediate_endelseIf487:
	lw	$t9,_A_5
	sw	$t9,12($sp)
	lw	$t9,_A_2
	sw	$t9,_A_5
	lw	$t9,12($sp)
	sw	$t9,_A_2
	j	if487
elseIf487:
	li	$t9,6
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf488
	j	intermediate_endelseIf488
intermediate_elseIf488:
	j	elseIf488
intermediate_endelseIf488:
	lw	$t9,_A_6
	sw	$t9,12($sp)
	lw	$t9,_A_2
	sw	$t9,_A_6
	lw	$t9,12($sp)
	sw	$t9,_A_2
	j	if488
elseIf488:
	li	$t9,7
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf489
	j	intermediate_endelseIf489
intermediate_elseIf489:
	j	elseIf489
intermediate_endelseIf489:
	lw	$t9,_A_7
	sw	$t9,12($sp)
	lw	$t9,_A_2
	sw	$t9,_A_7
	lw	$t9,12($sp)
	sw	$t9,_A_2
	j	if489
elseIf489:
	li	$t9,8
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf490
	j	intermediate_endelseIf490
intermediate_elseIf490:
	j	elseIf490
intermediate_endelseIf490:
	lw	$t9,_A_8
	sw	$t9,12($sp)
	lw	$t9,_A_2
	sw	$t9,_A_8
	lw	$t9,12($sp)
	sw	$t9,_A_2
	j	if490
elseIf490:
	li	$t9,9
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf491
	j	intermediate_endelseIf491
intermediate_elseIf491:
	j	elseIf491
intermediate_endelseIf491:
	lw	$t9,_A_9
	sw	$t9,12($sp)
	lw	$t9,_A_2
	sw	$t9,_A_9
	lw	$t9,12($sp)
	sw	$t9,_A_2
	j	if491
elseIf491:
	li	$t9,10
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf492
	j	intermediate_endelseIf492
intermediate_elseIf492:
	j	elseIf492
intermediate_endelseIf492:
	lw	$t9,_A_10
	sw	$t9,12($sp)
	lw	$t9,_A_2
	sw	$t9,_A_10
	lw	$t9,12($sp)
	sw	$t9,_A_2
	j	if492
elseIf492:
	li	$t9,11
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf493
	j	intermediate_endelseIf493
intermediate_elseIf493:
	j	elseIf493
intermediate_endelseIf493:
	lw	$t9,_A_11
	sw	$t9,12($sp)
	lw	$t9,_A_2
	sw	$t9,_A_11
	lw	$t9,12($sp)
	sw	$t9,_A_2
	j	if493
elseIf493:
	li	$t9,12
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf494
	j	intermediate_endelseIf494
intermediate_elseIf494:
	j	elseIf494
intermediate_endelseIf494:
	lw	$t9,_A_12
	sw	$t9,12($sp)
	lw	$t9,_A_2
	sw	$t9,_A_12
	lw	$t9,12($sp)
	sw	$t9,_A_2
	j	if494
elseIf494:
	li	$t9,13
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf495
	j	intermediate_endelseIf495
intermediate_elseIf495:
	j	elseIf495
intermediate_endelseIf495:
	lw	$t9,_A_13
	sw	$t9,12($sp)
	lw	$t9,_A_2
	sw	$t9,_A_13
	lw	$t9,12($sp)
	sw	$t9,_A_2
	j	if495
elseIf495:
	li	$t9,14
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_if496
	j	intermediate_endif496
intermediate_if496:
	j	if496
intermediate_endif496:
	lw	$t9,_A_14
	sw	$t9,12($sp)
	lw	$t9,_A_2
	sw	$t9,_A_14
	lw	$t9,12($sp)
	sw	$t9,_A_2
if496:
if495:
if494:
if493:
if492:
if491:
if490:
if489:
if488:
if487:
if486:
if485:
if484:
if483:
if482:
	j	if481
elseIf481:
	li	$t9,3
	lw	$t8,4($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf497
	j	intermediate_endelseIf497
intermediate_elseIf497:
	j	elseIf497
intermediate_endelseIf497:
	li	$t9,0
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf498
	j	intermediate_endelseIf498
intermediate_elseIf498:
	j	elseIf498
intermediate_endelseIf498:
	lw	$t9,_A_0
	sw	$t9,12($sp)
	lw	$t9,_A_3
	sw	$t9,_A_0
	lw	$t9,12($sp)
	sw	$t9,_A_3
	j	if498
elseIf498:
	li	$t9,1
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf499
	j	intermediate_endelseIf499
intermediate_elseIf499:
	j	elseIf499
intermediate_endelseIf499:
	lw	$t9,_A_1
	sw	$t9,12($sp)
	lw	$t9,_A_3
	sw	$t9,_A_1
	lw	$t9,12($sp)
	sw	$t9,_A_3
	j	if499
elseIf499:
	li	$t9,2
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf500
	j	intermediate_endelseIf500
intermediate_elseIf500:
	j	elseIf500
intermediate_endelseIf500:
	lw	$t9,_A_2
	sw	$t9,12($sp)
	lw	$t9,_A_3
	sw	$t9,_A_2
	lw	$t9,12($sp)
	sw	$t9,_A_3
	j	if500
elseIf500:
	li	$t9,3
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf501
	j	intermediate_endelseIf501
intermediate_elseIf501:
	j	elseIf501
intermediate_endelseIf501:
	lw	$t9,_A_3
	sw	$t9,12($sp)
	lw	$t9,_A_3
	sw	$t9,_A_3
	lw	$t9,12($sp)
	sw	$t9,_A_3
	j	if501
elseIf501:
	li	$t9,4
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf502
	j	intermediate_endelseIf502
intermediate_elseIf502:
	j	elseIf502
intermediate_endelseIf502:
	lw	$t9,_A_4
	sw	$t9,12($sp)
	lw	$t9,_A_3
	sw	$t9,_A_4
	lw	$t9,12($sp)
	sw	$t9,_A_3
	j	if502
elseIf502:
	li	$t9,5
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf503
	j	intermediate_endelseIf503
intermediate_elseIf503:
	j	elseIf503
intermediate_endelseIf503:
	lw	$t9,_A_5
	sw	$t9,12($sp)
	lw	$t9,_A_3
	sw	$t9,_A_5
	lw	$t9,12($sp)
	sw	$t9,_A_3
	j	if503
elseIf503:
	li	$t9,6
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf504
	j	intermediate_endelseIf504
intermediate_elseIf504:
	j	elseIf504
intermediate_endelseIf504:
	lw	$t9,_A_6
	sw	$t9,12($sp)
	lw	$t9,_A_3
	sw	$t9,_A_6
	lw	$t9,12($sp)
	sw	$t9,_A_3
	j	if504
elseIf504:
	li	$t9,7
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf505
	j	intermediate_endelseIf505
intermediate_elseIf505:
	j	elseIf505
intermediate_endelseIf505:
	lw	$t9,_A_7
	sw	$t9,12($sp)
	lw	$t9,_A_3
	sw	$t9,_A_7
	lw	$t9,12($sp)
	sw	$t9,_A_3
	j	if505
elseIf505:
	li	$t9,8
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf506
	j	intermediate_endelseIf506
intermediate_elseIf506:
	j	elseIf506
intermediate_endelseIf506:
	lw	$t9,_A_8
	sw	$t9,12($sp)
	lw	$t9,_A_3
	sw	$t9,_A_8
	lw	$t9,12($sp)
	sw	$t9,_A_3
	j	if506
elseIf506:
	li	$t9,9
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf507
	j	intermediate_endelseIf507
intermediate_elseIf507:
	j	elseIf507
intermediate_endelseIf507:
	lw	$t9,_A_9
	sw	$t9,12($sp)
	lw	$t9,_A_3
	sw	$t9,_A_9
	lw	$t9,12($sp)
	sw	$t9,_A_3
	j	if507
elseIf507:
	li	$t9,10
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf508
	j	intermediate_endelseIf508
intermediate_elseIf508:
	j	elseIf508
intermediate_endelseIf508:
	lw	$t9,_A_10
	sw	$t9,12($sp)
	lw	$t9,_A_3
	sw	$t9,_A_10
	lw	$t9,12($sp)
	sw	$t9,_A_3
	j	if508
elseIf508:
	li	$t9,11
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf509
	j	intermediate_endelseIf509
intermediate_elseIf509:
	j	elseIf509
intermediate_endelseIf509:
	lw	$t9,_A_11
	sw	$t9,12($sp)
	lw	$t9,_A_3
	sw	$t9,_A_11
	lw	$t9,12($sp)
	sw	$t9,_A_3
	j	if509
elseIf509:
	li	$t9,12
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf510
	j	intermediate_endelseIf510
intermediate_elseIf510:
	j	elseIf510
intermediate_endelseIf510:
	lw	$t9,_A_12
	sw	$t9,12($sp)
	lw	$t9,_A_3
	sw	$t9,_A_12
	lw	$t9,12($sp)
	sw	$t9,_A_3
	j	if510
elseIf510:
	li	$t9,13
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf511
	j	intermediate_endelseIf511
intermediate_elseIf511:
	j	elseIf511
intermediate_endelseIf511:
	lw	$t9,_A_13
	sw	$t9,12($sp)
	lw	$t9,_A_3
	sw	$t9,_A_13
	lw	$t9,12($sp)
	sw	$t9,_A_3
	j	if511
elseIf511:
	li	$t9,14
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_if512
	j	intermediate_endif512
intermediate_if512:
	j	if512
intermediate_endif512:
	lw	$t9,_A_14
	sw	$t9,12($sp)
	lw	$t9,_A_3
	sw	$t9,_A_14
	lw	$t9,12($sp)
	sw	$t9,_A_3
if512:
if511:
if510:
if509:
if508:
if507:
if506:
if505:
if504:
if503:
if502:
if501:
if500:
if499:
if498:
	j	if497
elseIf497:
	li	$t9,4
	lw	$t8,4($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf513
	j	intermediate_endelseIf513
intermediate_elseIf513:
	j	elseIf513
intermediate_endelseIf513:
	li	$t9,0
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf514
	j	intermediate_endelseIf514
intermediate_elseIf514:
	j	elseIf514
intermediate_endelseIf514:
	lw	$t9,_A_0
	sw	$t9,12($sp)
	lw	$t9,_A_4
	sw	$t9,_A_0
	lw	$t9,12($sp)
	sw	$t9,_A_4
	j	if514
elseIf514:
	li	$t9,1
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf515
	j	intermediate_endelseIf515
intermediate_elseIf515:
	j	elseIf515
intermediate_endelseIf515:
	lw	$t9,_A_1
	sw	$t9,12($sp)
	lw	$t9,_A_4
	sw	$t9,_A_1
	lw	$t9,12($sp)
	sw	$t9,_A_4
	j	if515
elseIf515:
	li	$t9,2
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf516
	j	intermediate_endelseIf516
intermediate_elseIf516:
	j	elseIf516
intermediate_endelseIf516:
	lw	$t9,_A_2
	sw	$t9,12($sp)
	lw	$t9,_A_4
	sw	$t9,_A_2
	lw	$t9,12($sp)
	sw	$t9,_A_4
	j	if516
elseIf516:
	li	$t9,3
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf517
	j	intermediate_endelseIf517
intermediate_elseIf517:
	j	elseIf517
intermediate_endelseIf517:
	lw	$t9,_A_3
	sw	$t9,12($sp)
	lw	$t9,_A_4
	sw	$t9,_A_3
	lw	$t9,12($sp)
	sw	$t9,_A_4
	j	if517
elseIf517:
	li	$t9,4
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf518
	j	intermediate_endelseIf518
intermediate_elseIf518:
	j	elseIf518
intermediate_endelseIf518:
	lw	$t9,_A_4
	sw	$t9,12($sp)
	lw	$t9,_A_4
	sw	$t9,_A_4
	lw	$t9,12($sp)
	sw	$t9,_A_4
	j	if518
elseIf518:
	li	$t9,5
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf519
	j	intermediate_endelseIf519
intermediate_elseIf519:
	j	elseIf519
intermediate_endelseIf519:
	lw	$t9,_A_5
	sw	$t9,12($sp)
	lw	$t9,_A_4
	sw	$t9,_A_5
	lw	$t9,12($sp)
	sw	$t9,_A_4
	j	if519
elseIf519:
	li	$t9,6
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf520
	j	intermediate_endelseIf520
intermediate_elseIf520:
	j	elseIf520
intermediate_endelseIf520:
	lw	$t9,_A_6
	sw	$t9,12($sp)
	lw	$t9,_A_4
	sw	$t9,_A_6
	lw	$t9,12($sp)
	sw	$t9,_A_4
	j	if520
elseIf520:
	li	$t9,7
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf521
	j	intermediate_endelseIf521
intermediate_elseIf521:
	j	elseIf521
intermediate_endelseIf521:
	lw	$t9,_A_7
	sw	$t9,12($sp)
	lw	$t9,_A_4
	sw	$t9,_A_7
	lw	$t9,12($sp)
	sw	$t9,_A_4
	j	if521
elseIf521:
	li	$t9,8
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf522
	j	intermediate_endelseIf522
intermediate_elseIf522:
	j	elseIf522
intermediate_endelseIf522:
	lw	$t9,_A_8
	sw	$t9,12($sp)
	lw	$t9,_A_4
	sw	$t9,_A_8
	lw	$t9,12($sp)
	sw	$t9,_A_4
	j	if522
elseIf522:
	li	$t9,9
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf523
	j	intermediate_endelseIf523
intermediate_elseIf523:
	j	elseIf523
intermediate_endelseIf523:
	lw	$t9,_A_9
	sw	$t9,12($sp)
	lw	$t9,_A_4
	sw	$t9,_A_9
	lw	$t9,12($sp)
	sw	$t9,_A_4
	j	if523
elseIf523:
	li	$t9,10
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf524
	j	intermediate_endelseIf524
intermediate_elseIf524:
	j	elseIf524
intermediate_endelseIf524:
	lw	$t9,_A_10
	sw	$t9,12($sp)
	lw	$t9,_A_4
	sw	$t9,_A_10
	lw	$t9,12($sp)
	sw	$t9,_A_4
	j	if524
elseIf524:
	li	$t9,11
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf525
	j	intermediate_endelseIf525
intermediate_elseIf525:
	j	elseIf525
intermediate_endelseIf525:
	lw	$t9,_A_11
	sw	$t9,12($sp)
	lw	$t9,_A_4
	sw	$t9,_A_11
	lw	$t9,12($sp)
	sw	$t9,_A_4
	j	if525
elseIf525:
	li	$t9,12
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf526
	j	intermediate_endelseIf526
intermediate_elseIf526:
	j	elseIf526
intermediate_endelseIf526:
	lw	$t9,_A_12
	sw	$t9,12($sp)
	lw	$t9,_A_4
	sw	$t9,_A_12
	lw	$t9,12($sp)
	sw	$t9,_A_4
	j	if526
elseIf526:
	li	$t9,13
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf527
	j	intermediate_endelseIf527
intermediate_elseIf527:
	j	elseIf527
intermediate_endelseIf527:
	lw	$t9,_A_13
	sw	$t9,12($sp)
	lw	$t9,_A_4
	sw	$t9,_A_13
	lw	$t9,12($sp)
	sw	$t9,_A_4
	j	if527
elseIf527:
	li	$t9,14
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_if528
	j	intermediate_endif528
intermediate_if528:
	j	if528
intermediate_endif528:
	lw	$t9,_A_14
	sw	$t9,12($sp)
	lw	$t9,_A_4
	sw	$t9,_A_14
	lw	$t9,12($sp)
	sw	$t9,_A_4
if528:
if527:
if526:
if525:
if524:
if523:
if522:
if521:
if520:
if519:
if518:
if517:
if516:
if515:
if514:
	j	if513
elseIf513:
	li	$t9,5
	lw	$t8,4($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf529
	j	intermediate_endelseIf529
intermediate_elseIf529:
	j	elseIf529
intermediate_endelseIf529:
	li	$t9,0
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf530
	j	intermediate_endelseIf530
intermediate_elseIf530:
	j	elseIf530
intermediate_endelseIf530:
	lw	$t9,_A_0
	sw	$t9,12($sp)
	lw	$t9,_A_5
	sw	$t9,_A_0
	lw	$t9,12($sp)
	sw	$t9,_A_5
	j	if530
elseIf530:
	li	$t9,1
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf531
	j	intermediate_endelseIf531
intermediate_elseIf531:
	j	elseIf531
intermediate_endelseIf531:
	lw	$t9,_A_1
	sw	$t9,12($sp)
	lw	$t9,_A_5
	sw	$t9,_A_1
	lw	$t9,12($sp)
	sw	$t9,_A_5
	j	if531
elseIf531:
	li	$t9,2
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf532
	j	intermediate_endelseIf532
intermediate_elseIf532:
	j	elseIf532
intermediate_endelseIf532:
	lw	$t9,_A_2
	sw	$t9,12($sp)
	lw	$t9,_A_5
	sw	$t9,_A_2
	lw	$t9,12($sp)
	sw	$t9,_A_5
	j	if532
elseIf532:
	li	$t9,3
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf533
	j	intermediate_endelseIf533
intermediate_elseIf533:
	j	elseIf533
intermediate_endelseIf533:
	lw	$t9,_A_3
	sw	$t9,12($sp)
	lw	$t9,_A_5
	sw	$t9,_A_3
	lw	$t9,12($sp)
	sw	$t9,_A_5
	j	if533
elseIf533:
	li	$t9,4
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf534
	j	intermediate_endelseIf534
intermediate_elseIf534:
	j	elseIf534
intermediate_endelseIf534:
	lw	$t9,_A_4
	sw	$t9,12($sp)
	lw	$t9,_A_5
	sw	$t9,_A_4
	lw	$t9,12($sp)
	sw	$t9,_A_5
	j	if534
elseIf534:
	li	$t9,5
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf535
	j	intermediate_endelseIf535
intermediate_elseIf535:
	j	elseIf535
intermediate_endelseIf535:
	lw	$t9,_A_5
	sw	$t9,12($sp)
	lw	$t9,_A_5
	sw	$t9,_A_5
	lw	$t9,12($sp)
	sw	$t9,_A_5
	j	if535
elseIf535:
	li	$t9,6
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf536
	j	intermediate_endelseIf536
intermediate_elseIf536:
	j	elseIf536
intermediate_endelseIf536:
	lw	$t9,_A_6
	sw	$t9,12($sp)
	lw	$t9,_A_5
	sw	$t9,_A_6
	lw	$t9,12($sp)
	sw	$t9,_A_5
	j	if536
elseIf536:
	li	$t9,7
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf537
	j	intermediate_endelseIf537
intermediate_elseIf537:
	j	elseIf537
intermediate_endelseIf537:
	lw	$t9,_A_7
	sw	$t9,12($sp)
	lw	$t9,_A_5
	sw	$t9,_A_7
	lw	$t9,12($sp)
	sw	$t9,_A_5
	j	if537
elseIf537:
	li	$t9,8
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf538
	j	intermediate_endelseIf538
intermediate_elseIf538:
	j	elseIf538
intermediate_endelseIf538:
	lw	$t9,_A_8
	sw	$t9,12($sp)
	lw	$t9,_A_5
	sw	$t9,_A_8
	lw	$t9,12($sp)
	sw	$t9,_A_5
	j	if538
elseIf538:
	li	$t9,9
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf539
	j	intermediate_endelseIf539
intermediate_elseIf539:
	j	elseIf539
intermediate_endelseIf539:
	lw	$t9,_A_9
	sw	$t9,12($sp)
	lw	$t9,_A_5
	sw	$t9,_A_9
	lw	$t9,12($sp)
	sw	$t9,_A_5
	j	if539
elseIf539:
	li	$t9,10
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf540
	j	intermediate_endelseIf540
intermediate_elseIf540:
	j	elseIf540
intermediate_endelseIf540:
	lw	$t9,_A_10
	sw	$t9,12($sp)
	lw	$t9,_A_5
	sw	$t9,_A_10
	lw	$t9,12($sp)
	sw	$t9,_A_5
	j	if540
elseIf540:
	li	$t9,11
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf541
	j	intermediate_endelseIf541
intermediate_elseIf541:
	j	elseIf541
intermediate_endelseIf541:
	lw	$t9,_A_11
	sw	$t9,12($sp)
	lw	$t9,_A_5
	sw	$t9,_A_11
	lw	$t9,12($sp)
	sw	$t9,_A_5
	j	if541
elseIf541:
	li	$t9,12
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf542
	j	intermediate_endelseIf542
intermediate_elseIf542:
	j	elseIf542
intermediate_endelseIf542:
	lw	$t9,_A_12
	sw	$t9,12($sp)
	lw	$t9,_A_5
	sw	$t9,_A_12
	lw	$t9,12($sp)
	sw	$t9,_A_5
	j	if542
elseIf542:
	li	$t9,13
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf543
	j	intermediate_endelseIf543
intermediate_elseIf543:
	j	elseIf543
intermediate_endelseIf543:
	lw	$t9,_A_13
	sw	$t9,12($sp)
	lw	$t9,_A_5
	sw	$t9,_A_13
	lw	$t9,12($sp)
	sw	$t9,_A_5
	j	if543
elseIf543:
	li	$t9,14
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_if544
	j	intermediate_endif544
intermediate_if544:
	j	if544
intermediate_endif544:
	lw	$t9,_A_14
	sw	$t9,12($sp)
	lw	$t9,_A_5
	sw	$t9,_A_14
	lw	$t9,12($sp)
	sw	$t9,_A_5
if544:
if543:
if542:
if541:
if540:
if539:
if538:
if537:
if536:
if535:
if534:
if533:
if532:
if531:
if530:
	j	if529
elseIf529:
	li	$t9,6
	lw	$t8,4($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf545
	j	intermediate_endelseIf545
intermediate_elseIf545:
	j	elseIf545
intermediate_endelseIf545:
	li	$t9,0
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf546
	j	intermediate_endelseIf546
intermediate_elseIf546:
	j	elseIf546
intermediate_endelseIf546:
	lw	$t9,_A_0
	sw	$t9,12($sp)
	lw	$t9,_A_6
	sw	$t9,_A_0
	lw	$t9,12($sp)
	sw	$t9,_A_6
	j	if546
elseIf546:
	li	$t9,1
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf547
	j	intermediate_endelseIf547
intermediate_elseIf547:
	j	elseIf547
intermediate_endelseIf547:
	lw	$t9,_A_1
	sw	$t9,12($sp)
	lw	$t9,_A_6
	sw	$t9,_A_1
	lw	$t9,12($sp)
	sw	$t9,_A_6
	j	if547
elseIf547:
	li	$t9,2
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf548
	j	intermediate_endelseIf548
intermediate_elseIf548:
	j	elseIf548
intermediate_endelseIf548:
	lw	$t9,_A_2
	sw	$t9,12($sp)
	lw	$t9,_A_6
	sw	$t9,_A_2
	lw	$t9,12($sp)
	sw	$t9,_A_6
	j	if548
elseIf548:
	li	$t9,3
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf549
	j	intermediate_endelseIf549
intermediate_elseIf549:
	j	elseIf549
intermediate_endelseIf549:
	lw	$t9,_A_3
	sw	$t9,12($sp)
	lw	$t9,_A_6
	sw	$t9,_A_3
	lw	$t9,12($sp)
	sw	$t9,_A_6
	j	if549
elseIf549:
	li	$t9,4
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf550
	j	intermediate_endelseIf550
intermediate_elseIf550:
	j	elseIf550
intermediate_endelseIf550:
	lw	$t9,_A_4
	sw	$t9,12($sp)
	lw	$t9,_A_6
	sw	$t9,_A_4
	lw	$t9,12($sp)
	sw	$t9,_A_6
	j	if550
elseIf550:
	li	$t9,5
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf551
	j	intermediate_endelseIf551
intermediate_elseIf551:
	j	elseIf551
intermediate_endelseIf551:
	lw	$t9,_A_5
	sw	$t9,12($sp)
	lw	$t9,_A_6
	sw	$t9,_A_5
	lw	$t9,12($sp)
	sw	$t9,_A_6
	j	if551
elseIf551:
	li	$t9,6
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf552
	j	intermediate_endelseIf552
intermediate_elseIf552:
	j	elseIf552
intermediate_endelseIf552:
	lw	$t9,_A_6
	sw	$t9,12($sp)
	lw	$t9,_A_6
	sw	$t9,_A_6
	lw	$t9,12($sp)
	sw	$t9,_A_6
	j	if552
elseIf552:
	li	$t9,7
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf553
	j	intermediate_endelseIf553
intermediate_elseIf553:
	j	elseIf553
intermediate_endelseIf553:
	lw	$t9,_A_7
	sw	$t9,12($sp)
	lw	$t9,_A_6
	sw	$t9,_A_7
	lw	$t9,12($sp)
	sw	$t9,_A_6
	j	if553
elseIf553:
	li	$t9,8
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf554
	j	intermediate_endelseIf554
intermediate_elseIf554:
	j	elseIf554
intermediate_endelseIf554:
	lw	$t9,_A_8
	sw	$t9,12($sp)
	lw	$t9,_A_6
	sw	$t9,_A_8
	lw	$t9,12($sp)
	sw	$t9,_A_6
	j	if554
elseIf554:
	li	$t9,9
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf555
	j	intermediate_endelseIf555
intermediate_elseIf555:
	j	elseIf555
intermediate_endelseIf555:
	lw	$t9,_A_9
	sw	$t9,12($sp)
	lw	$t9,_A_6
	sw	$t9,_A_9
	lw	$t9,12($sp)
	sw	$t9,_A_6
	j	if555
elseIf555:
	li	$t9,10
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf556
	j	intermediate_endelseIf556
intermediate_elseIf556:
	j	elseIf556
intermediate_endelseIf556:
	lw	$t9,_A_10
	sw	$t9,12($sp)
	lw	$t9,_A_6
	sw	$t9,_A_10
	lw	$t9,12($sp)
	sw	$t9,_A_6
	j	if556
elseIf556:
	li	$t9,11
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf557
	j	intermediate_endelseIf557
intermediate_elseIf557:
	j	elseIf557
intermediate_endelseIf557:
	lw	$t9,_A_11
	sw	$t9,12($sp)
	lw	$t9,_A_6
	sw	$t9,_A_11
	lw	$t9,12($sp)
	sw	$t9,_A_6
	j	if557
elseIf557:
	li	$t9,12
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf558
	j	intermediate_endelseIf558
intermediate_elseIf558:
	j	elseIf558
intermediate_endelseIf558:
	lw	$t9,_A_12
	sw	$t9,12($sp)
	lw	$t9,_A_6
	sw	$t9,_A_12
	lw	$t9,12($sp)
	sw	$t9,_A_6
	j	if558
elseIf558:
	li	$t9,13
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf559
	j	intermediate_endelseIf559
intermediate_elseIf559:
	j	elseIf559
intermediate_endelseIf559:
	lw	$t9,_A_13
	sw	$t9,12($sp)
	lw	$t9,_A_6
	sw	$t9,_A_13
	lw	$t9,12($sp)
	sw	$t9,_A_6
	j	if559
elseIf559:
	li	$t9,14
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_if560
	j	intermediate_endif560
intermediate_if560:
	j	if560
intermediate_endif560:
	lw	$t9,_A_14
	sw	$t9,12($sp)
	lw	$t9,_A_6
	sw	$t9,_A_14
	lw	$t9,12($sp)
	sw	$t9,_A_6
if560:
if559:
if558:
if557:
if556:
if555:
if554:
if553:
if552:
if551:
if550:
if549:
if548:
if547:
if546:
	j	if545
elseIf545:
	li	$t9,7
	lw	$t8,4($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf561
	j	intermediate_endelseIf561
intermediate_elseIf561:
	j	elseIf561
intermediate_endelseIf561:
	li	$t9,0
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf562
	j	intermediate_endelseIf562
intermediate_elseIf562:
	j	elseIf562
intermediate_endelseIf562:
	lw	$t9,_A_0
	sw	$t9,12($sp)
	lw	$t9,_A_7
	sw	$t9,_A_0
	lw	$t9,12($sp)
	sw	$t9,_A_7
	j	if562
elseIf562:
	li	$t9,1
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf563
	j	intermediate_endelseIf563
intermediate_elseIf563:
	j	elseIf563
intermediate_endelseIf563:
	lw	$t9,_A_1
	sw	$t9,12($sp)
	lw	$t9,_A_7
	sw	$t9,_A_1
	lw	$t9,12($sp)
	sw	$t9,_A_7
	j	if563
elseIf563:
	li	$t9,2
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf564
	j	intermediate_endelseIf564
intermediate_elseIf564:
	j	elseIf564
intermediate_endelseIf564:
	lw	$t9,_A_2
	sw	$t9,12($sp)
	lw	$t9,_A_7
	sw	$t9,_A_2
	lw	$t9,12($sp)
	sw	$t9,_A_7
	j	if564
elseIf564:
	li	$t9,3
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf565
	j	intermediate_endelseIf565
intermediate_elseIf565:
	j	elseIf565
intermediate_endelseIf565:
	lw	$t9,_A_3
	sw	$t9,12($sp)
	lw	$t9,_A_7
	sw	$t9,_A_3
	lw	$t9,12($sp)
	sw	$t9,_A_7
	j	if565
elseIf565:
	li	$t9,4
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf566
	j	intermediate_endelseIf566
intermediate_elseIf566:
	j	elseIf566
intermediate_endelseIf566:
	lw	$t9,_A_4
	sw	$t9,12($sp)
	lw	$t9,_A_7
	sw	$t9,_A_4
	lw	$t9,12($sp)
	sw	$t9,_A_7
	j	if566
elseIf566:
	li	$t9,5
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf567
	j	intermediate_endelseIf567
intermediate_elseIf567:
	j	elseIf567
intermediate_endelseIf567:
	lw	$t9,_A_5
	sw	$t9,12($sp)
	lw	$t9,_A_7
	sw	$t9,_A_5
	lw	$t9,12($sp)
	sw	$t9,_A_7
	j	if567
elseIf567:
	li	$t9,6
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf568
	j	intermediate_endelseIf568
intermediate_elseIf568:
	j	elseIf568
intermediate_endelseIf568:
	lw	$t9,_A_6
	sw	$t9,12($sp)
	lw	$t9,_A_7
	sw	$t9,_A_6
	lw	$t9,12($sp)
	sw	$t9,_A_7
	j	if568
elseIf568:
	li	$t9,7
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf569
	j	intermediate_endelseIf569
intermediate_elseIf569:
	j	elseIf569
intermediate_endelseIf569:
	lw	$t9,_A_7
	sw	$t9,12($sp)
	lw	$t9,_A_7
	sw	$t9,_A_7
	lw	$t9,12($sp)
	sw	$t9,_A_7
	j	if569
elseIf569:
	li	$t9,8
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf570
	j	intermediate_endelseIf570
intermediate_elseIf570:
	j	elseIf570
intermediate_endelseIf570:
	lw	$t9,_A_8
	sw	$t9,12($sp)
	lw	$t9,_A_7
	sw	$t9,_A_8
	lw	$t9,12($sp)
	sw	$t9,_A_7
	j	if570
elseIf570:
	li	$t9,9
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf571
	j	intermediate_endelseIf571
intermediate_elseIf571:
	j	elseIf571
intermediate_endelseIf571:
	lw	$t9,_A_9
	sw	$t9,12($sp)
	lw	$t9,_A_7
	sw	$t9,_A_9
	lw	$t9,12($sp)
	sw	$t9,_A_7
	j	if571
elseIf571:
	li	$t9,10
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf572
	j	intermediate_endelseIf572
intermediate_elseIf572:
	j	elseIf572
intermediate_endelseIf572:
	lw	$t9,_A_10
	sw	$t9,12($sp)
	lw	$t9,_A_7
	sw	$t9,_A_10
	lw	$t9,12($sp)
	sw	$t9,_A_7
	j	if572
elseIf572:
	li	$t9,11
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf573
	j	intermediate_endelseIf573
intermediate_elseIf573:
	j	elseIf573
intermediate_endelseIf573:
	lw	$t9,_A_11
	sw	$t9,12($sp)
	lw	$t9,_A_7
	sw	$t9,_A_11
	lw	$t9,12($sp)
	sw	$t9,_A_7
	j	if573
elseIf573:
	li	$t9,12
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf574
	j	intermediate_endelseIf574
intermediate_elseIf574:
	j	elseIf574
intermediate_endelseIf574:
	lw	$t9,_A_12
	sw	$t9,12($sp)
	lw	$t9,_A_7
	sw	$t9,_A_12
	lw	$t9,12($sp)
	sw	$t9,_A_7
	j	if574
elseIf574:
	li	$t9,13
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf575
	j	intermediate_endelseIf575
intermediate_elseIf575:
	j	elseIf575
intermediate_endelseIf575:
	lw	$t9,_A_13
	sw	$t9,12($sp)
	lw	$t9,_A_7
	sw	$t9,_A_13
	lw	$t9,12($sp)
	sw	$t9,_A_7
	j	if575
elseIf575:
	li	$t9,14
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_if576
	j	intermediate_endif576
intermediate_if576:
	j	if576
intermediate_endif576:
	lw	$t9,_A_14
	sw	$t9,12($sp)
	lw	$t9,_A_7
	sw	$t9,_A_14
	lw	$t9,12($sp)
	sw	$t9,_A_7
if576:
if575:
if574:
if573:
if572:
if571:
if570:
if569:
if568:
if567:
if566:
if565:
if564:
if563:
if562:
	j	if561
elseIf561:
	li	$t9,8
	lw	$t8,4($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf577
	j	intermediate_endelseIf577
intermediate_elseIf577:
	j	elseIf577
intermediate_endelseIf577:
	li	$t9,0
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf578
	j	intermediate_endelseIf578
intermediate_elseIf578:
	j	elseIf578
intermediate_endelseIf578:
	lw	$t9,_A_0
	sw	$t9,12($sp)
	lw	$t9,_A_8
	sw	$t9,_A_0
	lw	$t9,12($sp)
	sw	$t9,_A_8
	j	if578
elseIf578:
	li	$t9,1
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf579
	j	intermediate_endelseIf579
intermediate_elseIf579:
	j	elseIf579
intermediate_endelseIf579:
	lw	$t9,_A_1
	sw	$t9,12($sp)
	lw	$t9,_A_8
	sw	$t9,_A_1
	lw	$t9,12($sp)
	sw	$t9,_A_8
	j	if579
elseIf579:
	li	$t9,2
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf580
	j	intermediate_endelseIf580
intermediate_elseIf580:
	j	elseIf580
intermediate_endelseIf580:
	lw	$t9,_A_2
	sw	$t9,12($sp)
	lw	$t9,_A_8
	sw	$t9,_A_2
	lw	$t9,12($sp)
	sw	$t9,_A_8
	j	if580
elseIf580:
	li	$t9,3
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf581
	j	intermediate_endelseIf581
intermediate_elseIf581:
	j	elseIf581
intermediate_endelseIf581:
	lw	$t9,_A_3
	sw	$t9,12($sp)
	lw	$t9,_A_8
	sw	$t9,_A_3
	lw	$t9,12($sp)
	sw	$t9,_A_8
	j	if581
elseIf581:
	li	$t9,4
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf582
	j	intermediate_endelseIf582
intermediate_elseIf582:
	j	elseIf582
intermediate_endelseIf582:
	lw	$t9,_A_4
	sw	$t9,12($sp)
	lw	$t9,_A_8
	sw	$t9,_A_4
	lw	$t9,12($sp)
	sw	$t9,_A_8
	j	if582
elseIf582:
	li	$t9,5
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf583
	j	intermediate_endelseIf583
intermediate_elseIf583:
	j	elseIf583
intermediate_endelseIf583:
	lw	$t9,_A_5
	sw	$t9,12($sp)
	lw	$t9,_A_8
	sw	$t9,_A_5
	lw	$t9,12($sp)
	sw	$t9,_A_8
	j	if583
elseIf583:
	li	$t9,6
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf584
	j	intermediate_endelseIf584
intermediate_elseIf584:
	j	elseIf584
intermediate_endelseIf584:
	lw	$t9,_A_6
	sw	$t9,12($sp)
	lw	$t9,_A_8
	sw	$t9,_A_6
	lw	$t9,12($sp)
	sw	$t9,_A_8
	j	if584
elseIf584:
	li	$t9,7
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf585
	j	intermediate_endelseIf585
intermediate_elseIf585:
	j	elseIf585
intermediate_endelseIf585:
	lw	$t9,_A_7
	sw	$t9,12($sp)
	lw	$t9,_A_8
	sw	$t9,_A_7
	lw	$t9,12($sp)
	sw	$t9,_A_8
	j	if585
elseIf585:
	li	$t9,8
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf586
	j	intermediate_endelseIf586
intermediate_elseIf586:
	j	elseIf586
intermediate_endelseIf586:
	lw	$t9,_A_8
	sw	$t9,12($sp)
	lw	$t9,_A_8
	sw	$t9,_A_8
	lw	$t9,12($sp)
	sw	$t9,_A_8
	j	if586
elseIf586:
	li	$t9,9
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf587
	j	intermediate_endelseIf587
intermediate_elseIf587:
	j	elseIf587
intermediate_endelseIf587:
	lw	$t9,_A_9
	sw	$t9,12($sp)
	lw	$t9,_A_8
	sw	$t9,_A_9
	lw	$t9,12($sp)
	sw	$t9,_A_8
	j	if587
elseIf587:
	li	$t9,10
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf588
	j	intermediate_endelseIf588
intermediate_elseIf588:
	j	elseIf588
intermediate_endelseIf588:
	lw	$t9,_A_10
	sw	$t9,12($sp)
	lw	$t9,_A_8
	sw	$t9,_A_10
	lw	$t9,12($sp)
	sw	$t9,_A_8
	j	if588
elseIf588:
	li	$t9,11
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf589
	j	intermediate_endelseIf589
intermediate_elseIf589:
	j	elseIf589
intermediate_endelseIf589:
	lw	$t9,_A_11
	sw	$t9,12($sp)
	lw	$t9,_A_8
	sw	$t9,_A_11
	lw	$t9,12($sp)
	sw	$t9,_A_8
	j	if589
elseIf589:
	li	$t9,12
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf590
	j	intermediate_endelseIf590
intermediate_elseIf590:
	j	elseIf590
intermediate_endelseIf590:
	lw	$t9,_A_12
	sw	$t9,12($sp)
	lw	$t9,_A_8
	sw	$t9,_A_12
	lw	$t9,12($sp)
	sw	$t9,_A_8
	j	if590
elseIf590:
	li	$t9,13
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf591
	j	intermediate_endelseIf591
intermediate_elseIf591:
	j	elseIf591
intermediate_endelseIf591:
	lw	$t9,_A_13
	sw	$t9,12($sp)
	lw	$t9,_A_8
	sw	$t9,_A_13
	lw	$t9,12($sp)
	sw	$t9,_A_8
	j	if591
elseIf591:
	li	$t9,14
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_if592
	j	intermediate_endif592
intermediate_if592:
	j	if592
intermediate_endif592:
	lw	$t9,_A_14
	sw	$t9,12($sp)
	lw	$t9,_A_8
	sw	$t9,_A_14
	lw	$t9,12($sp)
	sw	$t9,_A_8
if592:
if591:
if590:
if589:
if588:
if587:
if586:
if585:
if584:
if583:
if582:
if581:
if580:
if579:
if578:
	j	if577
elseIf577:
	li	$t9,9
	lw	$t8,4($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf593
	j	intermediate_endelseIf593
intermediate_elseIf593:
	j	elseIf593
intermediate_endelseIf593:
	li	$t9,0
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf594
	j	intermediate_endelseIf594
intermediate_elseIf594:
	j	elseIf594
intermediate_endelseIf594:
	lw	$t9,_A_0
	sw	$t9,12($sp)
	lw	$t9,_A_9
	sw	$t9,_A_0
	lw	$t9,12($sp)
	sw	$t9,_A_9
	j	if594
elseIf594:
	li	$t9,1
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf595
	j	intermediate_endelseIf595
intermediate_elseIf595:
	j	elseIf595
intermediate_endelseIf595:
	lw	$t9,_A_1
	sw	$t9,12($sp)
	lw	$t9,_A_9
	sw	$t9,_A_1
	lw	$t9,12($sp)
	sw	$t9,_A_9
	j	if595
elseIf595:
	li	$t9,2
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf596
	j	intermediate_endelseIf596
intermediate_elseIf596:
	j	elseIf596
intermediate_endelseIf596:
	lw	$t9,_A_2
	sw	$t9,12($sp)
	lw	$t9,_A_9
	sw	$t9,_A_2
	lw	$t9,12($sp)
	sw	$t9,_A_9
	j	if596
elseIf596:
	li	$t9,3
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf597
	j	intermediate_endelseIf597
intermediate_elseIf597:
	j	elseIf597
intermediate_endelseIf597:
	lw	$t9,_A_3
	sw	$t9,12($sp)
	lw	$t9,_A_9
	sw	$t9,_A_3
	lw	$t9,12($sp)
	sw	$t9,_A_9
	j	if597
elseIf597:
	li	$t9,4
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf598
	j	intermediate_endelseIf598
intermediate_elseIf598:
	j	elseIf598
intermediate_endelseIf598:
	lw	$t9,_A_4
	sw	$t9,12($sp)
	lw	$t9,_A_9
	sw	$t9,_A_4
	lw	$t9,12($sp)
	sw	$t9,_A_9
	j	if598
elseIf598:
	li	$t9,5
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf599
	j	intermediate_endelseIf599
intermediate_elseIf599:
	j	elseIf599
intermediate_endelseIf599:
	lw	$t9,_A_5
	sw	$t9,12($sp)
	lw	$t9,_A_9
	sw	$t9,_A_5
	lw	$t9,12($sp)
	sw	$t9,_A_9
	j	if599
elseIf599:
	li	$t9,6
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf600
	j	intermediate_endelseIf600
intermediate_elseIf600:
	j	elseIf600
intermediate_endelseIf600:
	lw	$t9,_A_6
	sw	$t9,12($sp)
	lw	$t9,_A_9
	sw	$t9,_A_6
	lw	$t9,12($sp)
	sw	$t9,_A_9
	j	if600
elseIf600:
	li	$t9,7
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf601
	j	intermediate_endelseIf601
intermediate_elseIf601:
	j	elseIf601
intermediate_endelseIf601:
	lw	$t9,_A_7
	sw	$t9,12($sp)
	lw	$t9,_A_9
	sw	$t9,_A_7
	lw	$t9,12($sp)
	sw	$t9,_A_9
	j	if601
elseIf601:
	li	$t9,8
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf602
	j	intermediate_endelseIf602
intermediate_elseIf602:
	j	elseIf602
intermediate_endelseIf602:
	lw	$t9,_A_8
	sw	$t9,12($sp)
	lw	$t9,_A_9
	sw	$t9,_A_8
	lw	$t9,12($sp)
	sw	$t9,_A_9
	j	if602
elseIf602:
	li	$t9,9
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf603
	j	intermediate_endelseIf603
intermediate_elseIf603:
	j	elseIf603
intermediate_endelseIf603:
	lw	$t9,_A_9
	sw	$t9,12($sp)
	lw	$t9,_A_9
	sw	$t9,_A_9
	lw	$t9,12($sp)
	sw	$t9,_A_9
	j	if603
elseIf603:
	li	$t9,10
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf604
	j	intermediate_endelseIf604
intermediate_elseIf604:
	j	elseIf604
intermediate_endelseIf604:
	lw	$t9,_A_10
	sw	$t9,12($sp)
	lw	$t9,_A_9
	sw	$t9,_A_10
	lw	$t9,12($sp)
	sw	$t9,_A_9
	j	if604
elseIf604:
	li	$t9,11
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf605
	j	intermediate_endelseIf605
intermediate_elseIf605:
	j	elseIf605
intermediate_endelseIf605:
	lw	$t9,_A_11
	sw	$t9,12($sp)
	lw	$t9,_A_9
	sw	$t9,_A_11
	lw	$t9,12($sp)
	sw	$t9,_A_9
	j	if605
elseIf605:
	li	$t9,12
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf606
	j	intermediate_endelseIf606
intermediate_elseIf606:
	j	elseIf606
intermediate_endelseIf606:
	lw	$t9,_A_12
	sw	$t9,12($sp)
	lw	$t9,_A_9
	sw	$t9,_A_12
	lw	$t9,12($sp)
	sw	$t9,_A_9
	j	if606
elseIf606:
	li	$t9,13
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf607
	j	intermediate_endelseIf607
intermediate_elseIf607:
	j	elseIf607
intermediate_endelseIf607:
	lw	$t9,_A_13
	sw	$t9,12($sp)
	lw	$t9,_A_9
	sw	$t9,_A_13
	lw	$t9,12($sp)
	sw	$t9,_A_9
	j	if607
elseIf607:
	li	$t9,14
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_if608
	j	intermediate_endif608
intermediate_if608:
	j	if608
intermediate_endif608:
	lw	$t9,_A_14
	sw	$t9,12($sp)
	lw	$t9,_A_9
	sw	$t9,_A_14
	lw	$t9,12($sp)
	sw	$t9,_A_9
if608:
if607:
if606:
if605:
if604:
if603:
if602:
if601:
if600:
if599:
if598:
if597:
if596:
if595:
if594:
	j	if593
elseIf593:
	li	$t9,10
	lw	$t8,4($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf609
	j	intermediate_endelseIf609
intermediate_elseIf609:
	j	elseIf609
intermediate_endelseIf609:
	li	$t9,0
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf610
	j	intermediate_endelseIf610
intermediate_elseIf610:
	j	elseIf610
intermediate_endelseIf610:
	lw	$t9,_A_0
	sw	$t9,12($sp)
	lw	$t9,_A_10
	sw	$t9,_A_0
	lw	$t9,12($sp)
	sw	$t9,_A_10
	j	if610
elseIf610:
	li	$t9,1
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf611
	j	intermediate_endelseIf611
intermediate_elseIf611:
	j	elseIf611
intermediate_endelseIf611:
	lw	$t9,_A_1
	sw	$t9,12($sp)
	lw	$t9,_A_10
	sw	$t9,_A_1
	lw	$t9,12($sp)
	sw	$t9,_A_10
	j	if611
elseIf611:
	li	$t9,2
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf612
	j	intermediate_endelseIf612
intermediate_elseIf612:
	j	elseIf612
intermediate_endelseIf612:
	lw	$t9,_A_2
	sw	$t9,12($sp)
	lw	$t9,_A_10
	sw	$t9,_A_2
	lw	$t9,12($sp)
	sw	$t9,_A_10
	j	if612
elseIf612:
	li	$t9,3
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf613
	j	intermediate_endelseIf613
intermediate_elseIf613:
	j	elseIf613
intermediate_endelseIf613:
	lw	$t9,_A_3
	sw	$t9,12($sp)
	lw	$t9,_A_10
	sw	$t9,_A_3
	lw	$t9,12($sp)
	sw	$t9,_A_10
	j	if613
elseIf613:
	li	$t9,4
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf614
	j	intermediate_endelseIf614
intermediate_elseIf614:
	j	elseIf614
intermediate_endelseIf614:
	lw	$t9,_A_4
	sw	$t9,12($sp)
	lw	$t9,_A_10
	sw	$t9,_A_4
	lw	$t9,12($sp)
	sw	$t9,_A_10
	j	if614
elseIf614:
	li	$t9,5
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf615
	j	intermediate_endelseIf615
intermediate_elseIf615:
	j	elseIf615
intermediate_endelseIf615:
	lw	$t9,_A_5
	sw	$t9,12($sp)
	lw	$t9,_A_10
	sw	$t9,_A_5
	lw	$t9,12($sp)
	sw	$t9,_A_10
	j	if615
elseIf615:
	li	$t9,6
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf616
	j	intermediate_endelseIf616
intermediate_elseIf616:
	j	elseIf616
intermediate_endelseIf616:
	lw	$t9,_A_6
	sw	$t9,12($sp)
	lw	$t9,_A_10
	sw	$t9,_A_6
	lw	$t9,12($sp)
	sw	$t9,_A_10
	j	if616
elseIf616:
	li	$t9,7
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf617
	j	intermediate_endelseIf617
intermediate_elseIf617:
	j	elseIf617
intermediate_endelseIf617:
	lw	$t9,_A_7
	sw	$t9,12($sp)
	lw	$t9,_A_10
	sw	$t9,_A_7
	lw	$t9,12($sp)
	sw	$t9,_A_10
	j	if617
elseIf617:
	li	$t9,8
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf618
	j	intermediate_endelseIf618
intermediate_elseIf618:
	j	elseIf618
intermediate_endelseIf618:
	lw	$t9,_A_8
	sw	$t9,12($sp)
	lw	$t9,_A_10
	sw	$t9,_A_8
	lw	$t9,12($sp)
	sw	$t9,_A_10
	j	if618
elseIf618:
	li	$t9,9
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf619
	j	intermediate_endelseIf619
intermediate_elseIf619:
	j	elseIf619
intermediate_endelseIf619:
	lw	$t9,_A_9
	sw	$t9,12($sp)
	lw	$t9,_A_10
	sw	$t9,_A_9
	lw	$t9,12($sp)
	sw	$t9,_A_10
	j	if619
elseIf619:
	li	$t9,10
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf620
	j	intermediate_endelseIf620
intermediate_elseIf620:
	j	elseIf620
intermediate_endelseIf620:
	lw	$t9,_A_10
	sw	$t9,12($sp)
	lw	$t9,_A_10
	sw	$t9,_A_10
	lw	$t9,12($sp)
	sw	$t9,_A_10
	j	if620
elseIf620:
	li	$t9,11
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf621
	j	intermediate_endelseIf621
intermediate_elseIf621:
	j	elseIf621
intermediate_endelseIf621:
	lw	$t9,_A_11
	sw	$t9,12($sp)
	lw	$t9,_A_10
	sw	$t9,_A_11
	lw	$t9,12($sp)
	sw	$t9,_A_10
	j	if621
elseIf621:
	li	$t9,12
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf622
	j	intermediate_endelseIf622
intermediate_elseIf622:
	j	elseIf622
intermediate_endelseIf622:
	lw	$t9,_A_12
	sw	$t9,12($sp)
	lw	$t9,_A_10
	sw	$t9,_A_12
	lw	$t9,12($sp)
	sw	$t9,_A_10
	j	if622
elseIf622:
	li	$t9,13
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf623
	j	intermediate_endelseIf623
intermediate_elseIf623:
	j	elseIf623
intermediate_endelseIf623:
	lw	$t9,_A_13
	sw	$t9,12($sp)
	lw	$t9,_A_10
	sw	$t9,_A_13
	lw	$t9,12($sp)
	sw	$t9,_A_10
	j	if623
elseIf623:
	li	$t9,14
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_if624
	j	intermediate_endif624
intermediate_if624:
	j	if624
intermediate_endif624:
	lw	$t9,_A_14
	sw	$t9,12($sp)
	lw	$t9,_A_10
	sw	$t9,_A_14
	lw	$t9,12($sp)
	sw	$t9,_A_10
if624:
if623:
if622:
if621:
if620:
if619:
if618:
if617:
if616:
if615:
if614:
if613:
if612:
if611:
if610:
	j	if609
elseIf609:
	li	$t9,11
	lw	$t8,4($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf625
	j	intermediate_endelseIf625
intermediate_elseIf625:
	j	elseIf625
intermediate_endelseIf625:
	li	$t9,0
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf626
	j	intermediate_endelseIf626
intermediate_elseIf626:
	j	elseIf626
intermediate_endelseIf626:
	lw	$t9,_A_0
	sw	$t9,12($sp)
	lw	$t9,_A_11
	sw	$t9,_A_0
	lw	$t9,12($sp)
	sw	$t9,_A_11
	j	if626
elseIf626:
	li	$t9,1
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf627
	j	intermediate_endelseIf627
intermediate_elseIf627:
	j	elseIf627
intermediate_endelseIf627:
	lw	$t9,_A_1
	sw	$t9,12($sp)
	lw	$t9,_A_11
	sw	$t9,_A_1
	lw	$t9,12($sp)
	sw	$t9,_A_11
	j	if627
elseIf627:
	li	$t9,2
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf628
	j	intermediate_endelseIf628
intermediate_elseIf628:
	j	elseIf628
intermediate_endelseIf628:
	lw	$t9,_A_2
	sw	$t9,12($sp)
	lw	$t9,_A_11
	sw	$t9,_A_2
	lw	$t9,12($sp)
	sw	$t9,_A_11
	j	if628
elseIf628:
	li	$t9,3
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf629
	j	intermediate_endelseIf629
intermediate_elseIf629:
	j	elseIf629
intermediate_endelseIf629:
	lw	$t9,_A_3
	sw	$t9,12($sp)
	lw	$t9,_A_11
	sw	$t9,_A_3
	lw	$t9,12($sp)
	sw	$t9,_A_11
	j	if629
elseIf629:
	li	$t9,4
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf630
	j	intermediate_endelseIf630
intermediate_elseIf630:
	j	elseIf630
intermediate_endelseIf630:
	lw	$t9,_A_4
	sw	$t9,12($sp)
	lw	$t9,_A_11
	sw	$t9,_A_4
	lw	$t9,12($sp)
	sw	$t9,_A_11
	j	if630
elseIf630:
	li	$t9,5
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf631
	j	intermediate_endelseIf631
intermediate_elseIf631:
	j	elseIf631
intermediate_endelseIf631:
	lw	$t9,_A_5
	sw	$t9,12($sp)
	lw	$t9,_A_11
	sw	$t9,_A_5
	lw	$t9,12($sp)
	sw	$t9,_A_11
	j	if631
elseIf631:
	li	$t9,6
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf632
	j	intermediate_endelseIf632
intermediate_elseIf632:
	j	elseIf632
intermediate_endelseIf632:
	lw	$t9,_A_6
	sw	$t9,12($sp)
	lw	$t9,_A_11
	sw	$t9,_A_6
	lw	$t9,12($sp)
	sw	$t9,_A_11
	j	if632
elseIf632:
	li	$t9,7
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf633
	j	intermediate_endelseIf633
intermediate_elseIf633:
	j	elseIf633
intermediate_endelseIf633:
	lw	$t9,_A_7
	sw	$t9,12($sp)
	lw	$t9,_A_11
	sw	$t9,_A_7
	lw	$t9,12($sp)
	sw	$t9,_A_11
	j	if633
elseIf633:
	li	$t9,8
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf634
	j	intermediate_endelseIf634
intermediate_elseIf634:
	j	elseIf634
intermediate_endelseIf634:
	lw	$t9,_A_8
	sw	$t9,12($sp)
	lw	$t9,_A_11
	sw	$t9,_A_8
	lw	$t9,12($sp)
	sw	$t9,_A_11
	j	if634
elseIf634:
	li	$t9,9
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf635
	j	intermediate_endelseIf635
intermediate_elseIf635:
	j	elseIf635
intermediate_endelseIf635:
	lw	$t9,_A_9
	sw	$t9,12($sp)
	lw	$t9,_A_11
	sw	$t9,_A_9
	lw	$t9,12($sp)
	sw	$t9,_A_11
	j	if635
elseIf635:
	li	$t9,10
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf636
	j	intermediate_endelseIf636
intermediate_elseIf636:
	j	elseIf636
intermediate_endelseIf636:
	lw	$t9,_A_10
	sw	$t9,12($sp)
	lw	$t9,_A_11
	sw	$t9,_A_10
	lw	$t9,12($sp)
	sw	$t9,_A_11
	j	if636
elseIf636:
	li	$t9,11
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf637
	j	intermediate_endelseIf637
intermediate_elseIf637:
	j	elseIf637
intermediate_endelseIf637:
	lw	$t9,_A_11
	sw	$t9,12($sp)
	lw	$t9,_A_11
	sw	$t9,_A_11
	lw	$t9,12($sp)
	sw	$t9,_A_11
	j	if637
elseIf637:
	li	$t9,12
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf638
	j	intermediate_endelseIf638
intermediate_elseIf638:
	j	elseIf638
intermediate_endelseIf638:
	lw	$t9,_A_12
	sw	$t9,12($sp)
	lw	$t9,_A_11
	sw	$t9,_A_12
	lw	$t9,12($sp)
	sw	$t9,_A_11
	j	if638
elseIf638:
	li	$t9,13
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf639
	j	intermediate_endelseIf639
intermediate_elseIf639:
	j	elseIf639
intermediate_endelseIf639:
	lw	$t9,_A_13
	sw	$t9,12($sp)
	lw	$t9,_A_11
	sw	$t9,_A_13
	lw	$t9,12($sp)
	sw	$t9,_A_11
	j	if639
elseIf639:
	li	$t9,14
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_if640
	j	intermediate_endif640
intermediate_if640:
	j	if640
intermediate_endif640:
	lw	$t9,_A_14
	sw	$t9,12($sp)
	lw	$t9,_A_11
	sw	$t9,_A_14
	lw	$t9,12($sp)
	sw	$t9,_A_11
if640:
if639:
if638:
if637:
if636:
if635:
if634:
if633:
if632:
if631:
if630:
if629:
if628:
if627:
if626:
	j	if625
elseIf625:
	li	$t9,12
	lw	$t8,4($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf641
	j	intermediate_endelseIf641
intermediate_elseIf641:
	j	elseIf641
intermediate_endelseIf641:
	li	$t9,0
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf642
	j	intermediate_endelseIf642
intermediate_elseIf642:
	j	elseIf642
intermediate_endelseIf642:
	lw	$t9,_A_0
	sw	$t9,12($sp)
	lw	$t9,_A_12
	sw	$t9,_A_0
	lw	$t9,12($sp)
	sw	$t9,_A_12
	j	if642
elseIf642:
	li	$t9,1
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf643
	j	intermediate_endelseIf643
intermediate_elseIf643:
	j	elseIf643
intermediate_endelseIf643:
	lw	$t9,_A_1
	sw	$t9,12($sp)
	lw	$t9,_A_12
	sw	$t9,_A_1
	lw	$t9,12($sp)
	sw	$t9,_A_12
	j	if643
elseIf643:
	li	$t9,2
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf644
	j	intermediate_endelseIf644
intermediate_elseIf644:
	j	elseIf644
intermediate_endelseIf644:
	lw	$t9,_A_2
	sw	$t9,12($sp)
	lw	$t9,_A_12
	sw	$t9,_A_2
	lw	$t9,12($sp)
	sw	$t9,_A_12
	j	if644
elseIf644:
	li	$t9,3
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf645
	j	intermediate_endelseIf645
intermediate_elseIf645:
	j	elseIf645
intermediate_endelseIf645:
	lw	$t9,_A_3
	sw	$t9,12($sp)
	lw	$t9,_A_12
	sw	$t9,_A_3
	lw	$t9,12($sp)
	sw	$t9,_A_12
	j	if645
elseIf645:
	li	$t9,4
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf646
	j	intermediate_endelseIf646
intermediate_elseIf646:
	j	elseIf646
intermediate_endelseIf646:
	lw	$t9,_A_4
	sw	$t9,12($sp)
	lw	$t9,_A_12
	sw	$t9,_A_4
	lw	$t9,12($sp)
	sw	$t9,_A_12
	j	if646
elseIf646:
	li	$t9,5
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf647
	j	intermediate_endelseIf647
intermediate_elseIf647:
	j	elseIf647
intermediate_endelseIf647:
	lw	$t9,_A_5
	sw	$t9,12($sp)
	lw	$t9,_A_12
	sw	$t9,_A_5
	lw	$t9,12($sp)
	sw	$t9,_A_12
	j	if647
elseIf647:
	li	$t9,6
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf648
	j	intermediate_endelseIf648
intermediate_elseIf648:
	j	elseIf648
intermediate_endelseIf648:
	lw	$t9,_A_6
	sw	$t9,12($sp)
	lw	$t9,_A_12
	sw	$t9,_A_6
	lw	$t9,12($sp)
	sw	$t9,_A_12
	j	if648
elseIf648:
	li	$t9,7
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf649
	j	intermediate_endelseIf649
intermediate_elseIf649:
	j	elseIf649
intermediate_endelseIf649:
	lw	$t9,_A_7
	sw	$t9,12($sp)
	lw	$t9,_A_12
	sw	$t9,_A_7
	lw	$t9,12($sp)
	sw	$t9,_A_12
	j	if649
elseIf649:
	li	$t9,8
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf650
	j	intermediate_endelseIf650
intermediate_elseIf650:
	j	elseIf650
intermediate_endelseIf650:
	lw	$t9,_A_8
	sw	$t9,12($sp)
	lw	$t9,_A_12
	sw	$t9,_A_8
	lw	$t9,12($sp)
	sw	$t9,_A_12
	j	if650
elseIf650:
	li	$t9,9
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf651
	j	intermediate_endelseIf651
intermediate_elseIf651:
	j	elseIf651
intermediate_endelseIf651:
	lw	$t9,_A_9
	sw	$t9,12($sp)
	lw	$t9,_A_12
	sw	$t9,_A_9
	lw	$t9,12($sp)
	sw	$t9,_A_12
	j	if651
elseIf651:
	li	$t9,10
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf652
	j	intermediate_endelseIf652
intermediate_elseIf652:
	j	elseIf652
intermediate_endelseIf652:
	lw	$t9,_A_10
	sw	$t9,12($sp)
	lw	$t9,_A_12
	sw	$t9,_A_10
	lw	$t9,12($sp)
	sw	$t9,_A_12
	j	if652
elseIf652:
	li	$t9,11
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf653
	j	intermediate_endelseIf653
intermediate_elseIf653:
	j	elseIf653
intermediate_endelseIf653:
	lw	$t9,_A_11
	sw	$t9,12($sp)
	lw	$t9,_A_12
	sw	$t9,_A_11
	lw	$t9,12($sp)
	sw	$t9,_A_12
	j	if653
elseIf653:
	li	$t9,12
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf654
	j	intermediate_endelseIf654
intermediate_elseIf654:
	j	elseIf654
intermediate_endelseIf654:
	lw	$t9,_A_12
	sw	$t9,12($sp)
	lw	$t9,_A_12
	sw	$t9,_A_12
	lw	$t9,12($sp)
	sw	$t9,_A_12
	j	if654
elseIf654:
	li	$t9,13
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf655
	j	intermediate_endelseIf655
intermediate_elseIf655:
	j	elseIf655
intermediate_endelseIf655:
	lw	$t9,_A_13
	sw	$t9,12($sp)
	lw	$t9,_A_12
	sw	$t9,_A_13
	lw	$t9,12($sp)
	sw	$t9,_A_12
	j	if655
elseIf655:
	li	$t9,14
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_if656
	j	intermediate_endif656
intermediate_if656:
	j	if656
intermediate_endif656:
	lw	$t9,_A_14
	sw	$t9,12($sp)
	lw	$t9,_A_12
	sw	$t9,_A_14
	lw	$t9,12($sp)
	sw	$t9,_A_12
if656:
if655:
if654:
if653:
if652:
if651:
if650:
if649:
if648:
if647:
if646:
if645:
if644:
if643:
if642:
	j	if641
elseIf641:
	li	$t9,13
	lw	$t8,4($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_if657
	j	intermediate_endif657
intermediate_if657:
	j	if657
intermediate_endif657:
	li	$t9,0
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf658
	j	intermediate_endelseIf658
intermediate_elseIf658:
	j	elseIf658
intermediate_endelseIf658:
	lw	$t9,_A_0
	sw	$t9,12($sp)
	lw	$t9,_A_13
	sw	$t9,_A_0
	lw	$t9,12($sp)
	sw	$t9,_A_13
	j	if658
elseIf658:
	li	$t9,1
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf659
	j	intermediate_endelseIf659
intermediate_elseIf659:
	j	elseIf659
intermediate_endelseIf659:
	lw	$t9,_A_1
	sw	$t9,12($sp)
	lw	$t9,_A_13
	sw	$t9,_A_1
	lw	$t9,12($sp)
	sw	$t9,_A_13
	j	if659
elseIf659:
	li	$t9,2
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf660
	j	intermediate_endelseIf660
intermediate_elseIf660:
	j	elseIf660
intermediate_endelseIf660:
	lw	$t9,_A_2
	sw	$t9,12($sp)
	lw	$t9,_A_13
	sw	$t9,_A_2
	lw	$t9,12($sp)
	sw	$t9,_A_13
	j	if660
elseIf660:
	li	$t9,3
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf661
	j	intermediate_endelseIf661
intermediate_elseIf661:
	j	elseIf661
intermediate_endelseIf661:
	lw	$t9,_A_3
	sw	$t9,12($sp)
	lw	$t9,_A_13
	sw	$t9,_A_3
	lw	$t9,12($sp)
	sw	$t9,_A_13
	j	if661
elseIf661:
	li	$t9,4
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf662
	j	intermediate_endelseIf662
intermediate_elseIf662:
	j	elseIf662
intermediate_endelseIf662:
	lw	$t9,_A_4
	sw	$t9,12($sp)
	lw	$t9,_A_13
	sw	$t9,_A_4
	lw	$t9,12($sp)
	sw	$t9,_A_13
	j	if662
elseIf662:
	li	$t9,5
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf663
	j	intermediate_endelseIf663
intermediate_elseIf663:
	j	elseIf663
intermediate_endelseIf663:
	lw	$t9,_A_5
	sw	$t9,12($sp)
	lw	$t9,_A_13
	sw	$t9,_A_5
	lw	$t9,12($sp)
	sw	$t9,_A_13
	j	if663
elseIf663:
	li	$t9,6
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf664
	j	intermediate_endelseIf664
intermediate_elseIf664:
	j	elseIf664
intermediate_endelseIf664:
	lw	$t9,_A_6
	sw	$t9,12($sp)
	lw	$t9,_A_13
	sw	$t9,_A_6
	lw	$t9,12($sp)
	sw	$t9,_A_13
	j	if664
elseIf664:
	li	$t9,7
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf665
	j	intermediate_endelseIf665
intermediate_elseIf665:
	j	elseIf665
intermediate_endelseIf665:
	lw	$t9,_A_7
	sw	$t9,12($sp)
	lw	$t9,_A_13
	sw	$t9,_A_7
	lw	$t9,12($sp)
	sw	$t9,_A_13
	j	if665
elseIf665:
	li	$t9,8
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf666
	j	intermediate_endelseIf666
intermediate_elseIf666:
	j	elseIf666
intermediate_endelseIf666:
	lw	$t9,_A_8
	sw	$t9,12($sp)
	lw	$t9,_A_13
	sw	$t9,_A_8
	lw	$t9,12($sp)
	sw	$t9,_A_13
	j	if666
elseIf666:
	li	$t9,9
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf667
	j	intermediate_endelseIf667
intermediate_elseIf667:
	j	elseIf667
intermediate_endelseIf667:
	lw	$t9,_A_9
	sw	$t9,12($sp)
	lw	$t9,_A_13
	sw	$t9,_A_9
	lw	$t9,12($sp)
	sw	$t9,_A_13
	j	if667
elseIf667:
	li	$t9,10
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf668
	j	intermediate_endelseIf668
intermediate_elseIf668:
	j	elseIf668
intermediate_endelseIf668:
	lw	$t9,_A_10
	sw	$t9,12($sp)
	lw	$t9,_A_13
	sw	$t9,_A_10
	lw	$t9,12($sp)
	sw	$t9,_A_13
	j	if668
elseIf668:
	li	$t9,11
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf669
	j	intermediate_endelseIf669
intermediate_elseIf669:
	j	elseIf669
intermediate_endelseIf669:
	lw	$t9,_A_11
	sw	$t9,12($sp)
	lw	$t9,_A_13
	sw	$t9,_A_11
	lw	$t9,12($sp)
	sw	$t9,_A_13
	j	if669
elseIf669:
	li	$t9,12
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf670
	j	intermediate_endelseIf670
intermediate_elseIf670:
	j	elseIf670
intermediate_endelseIf670:
	lw	$t9,_A_12
	sw	$t9,12($sp)
	lw	$t9,_A_13
	sw	$t9,_A_12
	lw	$t9,12($sp)
	sw	$t9,_A_13
	j	if670
elseIf670:
	li	$t9,13
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf671
	j	intermediate_endelseIf671
intermediate_elseIf671:
	j	elseIf671
intermediate_endelseIf671:
	lw	$t9,_A_13
	sw	$t9,12($sp)
	lw	$t9,_A_13
	sw	$t9,_A_13
	lw	$t9,12($sp)
	sw	$t9,_A_13
	j	if671
elseIf671:
	li	$t9,14
	lw	$t8,16($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_if672
	j	intermediate_endif672
intermediate_if672:
	j	if672
intermediate_endif672:
	lw	$t9,_A_14
	sw	$t9,12($sp)
	lw	$t9,_A_13
	sw	$t9,_A_14
	lw	$t9,12($sp)
	sw	$t9,_A_13
if672:
if671:
if670:
if669:
if668:
if667:
if666:
if665:
if664:
if663:
if662:
if661:
if660:
if659:
if658:
if657:
if641:
if625:
if609:
if593:
if577:
if561:
if545:
if529:
if513:
if497:
if481:
if465:
if449:
	addiu	$sp,$sp,0
	jal	_printarray
	addiu	$sp,$sp,0
	move	$t9,$v0
	li	$t9,1
	lw	$t8,4($sp)
	addu	$t7,$t8,$t9
	sw	$t7,4($sp)
	j	loop1
while1:
	addiu	$sp,$sp,20
	li	$v0,10
	syscall
.text
_printarray:
	addiu	$sp,$sp,-8
	sw	$ra,0($sp)
	li	$t9,0
	sw	$t9,4($sp)
loop3:
	li	$t9,14
	lw	$t8,4($sp)
	sle	$t7,$t8,$t9
	beq	$t7,$0,intermediate_while3
	j	intermediate_endwhile3
intermediate_while3:
	j	while3
intermediate_endwhile3:
	li	$t9,0
	lw	$t8,4($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf673
	j	intermediate_endelseIf673
intermediate_elseIf673:
	j	elseIf673
intermediate_endelseIf673:
	lw	$t9,_A_0
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
	j	if673
elseIf673:
	li	$t9,1
	lw	$t8,4($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf674
	j	intermediate_endelseIf674
intermediate_elseIf674:
	j	elseIf674
intermediate_endelseIf674:
	lw	$t9,_A_1
	move	$a0,$t9
	li	$v0,1
	syscall
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
	j	if674
elseIf674:
	li	$t9,2
	lw	$t8,4($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf675
	j	intermediate_endelseIf675
intermediate_elseIf675:
	j	elseIf675
intermediate_endelseIf675:
	lw	$t9,_A_2
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
	j	if675
elseIf675:
	li	$t9,3
	lw	$t8,4($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf676
	j	intermediate_endelseIf676
intermediate_elseIf676:
	j	elseIf676
intermediate_endelseIf676:
	lw	$t9,_A_3
	move	$a0,$t9
	li	$v0,1
	syscall
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
	j	if676
elseIf676:
	li	$t9,4
	lw	$t8,4($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf677
	j	intermediate_endelseIf677
intermediate_elseIf677:
	j	elseIf677
intermediate_endelseIf677:
	lw	$t9,_A_4
	move	$a0,$t9
	li	$v0,1
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
	j	if677
elseIf677:
	li	$t9,5
	lw	$t8,4($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf678
	j	intermediate_endelseIf678
intermediate_elseIf678:
	j	elseIf678
intermediate_endelseIf678:
	lw	$t9,_A_5
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
	j	if678
elseIf678:
	li	$t9,6
	lw	$t8,4($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf679
	j	intermediate_endelseIf679
intermediate_elseIf679:
	j	elseIf679
intermediate_endelseIf679:
	lw	$t9,_A_6
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
	j	if679
elseIf679:
	li	$t9,7
	lw	$t8,4($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf680
	j	intermediate_endelseIf680
intermediate_elseIf680:
	j	elseIf680
intermediate_endelseIf680:
	lw	$t9,_A_7
	move	$a0,$t9
	li	$v0,1
	syscall
	la	$t9,s7
	li	$t8,0
	li	$t7,1
prints_begin_7:
	lb	$a0,0($t9)
	beq	$t8,$t7,prints_exit_7
	li	$v0,11
	syscall
	addi	$t8,$t8,1
	addi	$t9,$t9,1
	j	prints_begin_7
prints_exit_7:
	j	if680
elseIf680:
	li	$t9,8
	lw	$t8,4($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf681
	j	intermediate_endelseIf681
intermediate_elseIf681:
	j	elseIf681
intermediate_endelseIf681:
	lw	$t9,_A_8
	move	$a0,$t9
	li	$v0,1
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
	j	if681
elseIf681:
	li	$t9,9
	lw	$t8,4($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf682
	j	intermediate_endelseIf682
intermediate_elseIf682:
	j	elseIf682
intermediate_endelseIf682:
	lw	$t9,_A_9
	move	$a0,$t9
	li	$v0,1
	syscall
	la	$t9,s9
	li	$t8,0
	li	$t7,1
prints_begin_9:
	lb	$a0,0($t9)
	beq	$t8,$t7,prints_exit_9
	li	$v0,11
	syscall
	addi	$t8,$t8,1
	addi	$t9,$t9,1
	j	prints_begin_9
prints_exit_9:
	j	if682
elseIf682:
	li	$t9,10
	lw	$t8,4($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf683
	j	intermediate_endelseIf683
intermediate_elseIf683:
	j	elseIf683
intermediate_endelseIf683:
	lw	$t9,_A_10
	move	$a0,$t9
	li	$v0,1
	syscall
	la	$t9,s10
	li	$t8,0
	li	$t7,1
prints_begin_10:
	lb	$a0,0($t9)
	beq	$t8,$t7,prints_exit_10
	li	$v0,11
	syscall
	addi	$t8,$t8,1
	addi	$t9,$t9,1
	j	prints_begin_10
prints_exit_10:
	j	if683
elseIf683:
	li	$t9,11
	lw	$t8,4($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf684
	j	intermediate_endelseIf684
intermediate_elseIf684:
	j	elseIf684
intermediate_endelseIf684:
	lw	$t9,_A_11
	move	$a0,$t9
	li	$v0,1
	syscall
	la	$t9,s11
	li	$t8,0
	li	$t7,1
prints_begin_11:
	lb	$a0,0($t9)
	beq	$t8,$t7,prints_exit_11
	li	$v0,11
	syscall
	addi	$t8,$t8,1
	addi	$t9,$t9,1
	j	prints_begin_11
prints_exit_11:
	j	if684
elseIf684:
	li	$t9,12
	lw	$t8,4($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf685
	j	intermediate_endelseIf685
intermediate_elseIf685:
	j	elseIf685
intermediate_endelseIf685:
	lw	$t9,_A_12
	move	$a0,$t9
	li	$v0,1
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
	j	if685
elseIf685:
	li	$t9,13
	lw	$t8,4($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_elseIf686
	j	intermediate_endelseIf686
intermediate_elseIf686:
	j	elseIf686
intermediate_endelseIf686:
	lw	$t9,_A_13
	move	$a0,$t9
	li	$v0,1
	syscall
	la	$t9,s13
	li	$t8,0
	li	$t7,1
prints_begin_13:
	lb	$a0,0($t9)
	beq	$t8,$t7,prints_exit_13
	li	$v0,11
	syscall
	addi	$t8,$t8,1
	addi	$t9,$t9,1
	j	prints_begin_13
prints_exit_13:
	j	if686
elseIf686:
	li	$t9,14
	lw	$t8,4($sp)
	seq	$t7,$t8,$t9
	beq	$t7,$0,intermediate_if687
	j	intermediate_endif687
intermediate_if687:
	j	if687
intermediate_endif687:
	lw	$t9,_A_14
	move	$a0,$t9
	li	$v0,1
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
if687:
if686:
if685:
if684:
if683:
if682:
if681:
if680:
if679:
if678:
if677:
if676:
if675:
if674:
if673:
	li	$t9,1
	lw	$t8,4($sp)
	addu	$t7,$t8,$t9
	sw	$t7,4($sp)
	j	loop3
while3:
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
_printarray_end:
	lw	$ra,0($sp)
	addiu	$sp,$sp,8
	jr	$ra
.text
_INTERNALseed:
	addiu	$sp,$sp,-8
	sw	$ra,0($sp)
	sw	$a0,4($sp)
	lw	$t9,4($sp)
	sw	$t9,_INTERNALX
_INTERNALseed_end:
	lw	$ra,0($sp)
	addiu	$sp,$sp,8
	jr	$ra
.text
_INTERNALrandom:
	addiu	$sp,$sp,-4
	sw	$ra,0($sp)
	li	$t9,17
	lw	$t8,_INTERNALX
	mul	$t7,$t9,$t8
	li	$t9,13
	addu	$t8,$t7,$t9
	li	$t9,32768
	rem	$t7,$t8,$t9
	sw	$t7,_INTERNALX
	lw	$t9,_INTERNALX
	move	$v0,$t9
	j	_INTERNALrandom_end
.data
err0:
.asciiz	"Error: function 'INTERNALrandom' must return a value\n"
.text
	la	$a0,err0
	li	$v0,4
	syscall
	li	$v0,10
	syscall
_INTERNALrandom_end:
	lw	$ra,0($sp)
	addiu	$sp,$sp,4
	jr	$ra
