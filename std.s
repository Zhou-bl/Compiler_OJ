	.text
	.globl	main
	.p2align	1
	.type	main,@function
main:
.main_bb:
	sw	s0, -4(sp)
	addi	sp, sp, -16
	addi	s0, sp, 16
	sw	ra, -16(s0)
	sw	s3, -12(s0)
	li	t5,0
	la	t6,i_glo
	sw	t5, 0(t6)
	j	.for_condition_bb

.main_bb1:
	lw	a0, -8(s0)
	lw	s3, -12(s0)
	lw	ra, -16(s0)
	addi	sp, sp, 16
	lw	s0, -4(sp)
	ret

.for_condition_bb:
	la	t6,i_glo
	lw	t6, 0(t6)
	li	t5,5
	slt	t6, t6, t5
	bne	t6,zero,.for_body_bb
	j	.main_bb2

.for_iter_bb:
	la	t6,i_glo
	lw	t6, 0(t6)
	addi	t6, t6, 1
	la	t5,i_glo
	sw	t6, 0(t5)
	j	.for_condition_bb

.for_body_bb:
	li	t6,0
	la	t5,j_glo
	sw	t6, 0(t5)
	j	.for_condition_bb1

.main_bb2:
	la	t6,c_glo
	lw	t5, 0(t6)
	li	t6,2
	sub	a0, t6, t5
	call	_f_abs
	mv	s3,a0
	la	t6,r_glo
	lw	t5, 0(t6)
	li	t6,2
	sub	a0, t6, t5
	call	_f_abs
	add	a0, a0, s3
	call	_f_printInt
	li	t6,0
	sw	t6, -8(s0)
	j	.main_bb1

.for_condition_bb1:
	la	t6,j_glo
	lw	t5, 0(t6)
	li	t6,5
	slt	t6, t5, t6
	bne	t6,zero,.for_body_bb1
	j	.main_bb3

.for_iter_bb1:
	la	t6,j_glo
	lw	t6, 0(t6)
	addi	t5, t6, 1
	la	t6,j_glo
	sw	t5, 0(t6)
	j	.for_condition_bb1

.for_body_bb1:
	call	_f_getInt
	la	t6,n_glo
	sw	a0, 0(t6)
	la	t6,n_glo
	lw	t5, 0(t6)
	li	t6,1
	xor	t6, t5, t6
	seqz	t6, t6
	bne	t6,zero,.if_then_bb1
	j	.main_bb4

.main_bb3:
	j	.for_iter_bb

.if_then_bb1:
	la	t6,i_glo
	lw	t6, 0(t6)
	la	t5,r_glo
	sw	t6, 0(t5)
	la	t6,j_glo
	lw	t5, 0(t6)
	la	t6,c_glo
	sw	t5, 0(t6)
	j	.main_bb4

.main_bb4:
	j	.for_iter_bb1

	.size	main, .-main
			 # -- End function
	.globl	_f_abs
	.p2align	1
	.type	_f_abs,@function
_f_abs:
._f_abs_bb:
	sw	s0, -4(sp)
	addi	sp, sp, -12
	addi	s0, sp, 12
	sw	a0, -12(s0)
	lw	t5, -12(s0)
	li	t6,0
	slt	t6, t6, t5
	bne	t6,zero,.if_then_bb
	j	._f_abs_bb2

._f_abs_bb1:
	lw	a0, -8(s0)
	addi	sp, sp, 12
	lw	s0, -4(sp)
	ret

.if_then_bb:
	lw	t6, -12(s0)
	sw	t6, -8(s0)
	j	._f_abs_bb1

._f_abs_bb2:
	lw	t5, -12(s0)
	li	t6,0
	sub	t6, t6, t5
	sw	t6, -8(s0)
	j	._f_abs_bb1

	.size	_f_abs, .-_f_abs
			 # -- End function
	.type	n_glo,@object
	.section	.bss
	.globl	n_glo
n_glo:
	.word	0
	.size	n_glo, 4
	.type	r_glo,@object
	.section	.bss
	.globl	r_glo
r_glo:
	.word	0
	.size	r_glo, 4
	.type	c_glo,@object
	.section	.bss
	.globl	c_glo
c_glo:
	.word	0
	.size	c_glo, 4
	.type	i_glo,@object
	.section	.bss
	.globl	i_glo
i_glo:
	.word	0
	.size	i_glo, 4
	.type	j_glo,@object
	.section	.bss
	.globl	j_glo
j_glo:
	.word	0
	.size	j_glo, 4

