	.text
	.globl	main
	.p2align		1
	.type	main,@function
main:
.main_bb0:
	sw	s0, -4(sp)
	addi	sp, sp, -4
	addi	s0, sp, 4
	mv	s1, s0
	li	t6, 0
	la	t5, i_global0
	sw	t6, 0(t5)
	j	.for_condition_bb_bb0

.main_bb1:
	lw	a0, -4(s0)
	mv	s0, s1
	addi	sp, sp, 4
	lw	s0, -4(sp)
	ret

.for_condition_bb_bb0:
	la	t6, i_global0
	lw	t5, 0(t6)
	li	t6, 5
	slt	t6, t5, t6
	bne	t6, zero, .for_body_bb_bb0
	j	.main_bb2

.for_iter_bb_bb0:
	la	t6, i_global0
	lw	t6, 0(t6)
	addi	t5, t6, 1
	la	t6, i_global0
	sw	t5, 0(t6)
	j	.for_condition_bb_bb0

.for_body_bb_bb0:
	li	t5, 0
	la	t6, j_global0
	sw	t5, 0(t6)
	j	.for_condition_bb_bb1

.main_bb2:
	la	t6, c_global0
	lw	t6, 0(t6)
	li	t5, 2
	sub	a0, t5, t6
	mv	s11, ra
	call	_f_abs0
	mv	ra, s11
	mv	s10, a0
	la	t6, r_global0
	lw	t5, 0(t6)
	li	t6, 2
	sub	a0, t6, t5
	mv	s11, ra
	call	_f_abs0
	mv	ra, s11
	add	a0, a0, s10
	mv	s11, ra
	call	_f_printInt0
	mv	ra, s11
	li	t6, 0
	sw	t6, -4(s0)
	j	.main_bb1

.for_condition_bb_bb1:
	la	t6, j_global0
	lw	t6, 0(t6)
	li	t5, 5
	slt	t6, t6, t5
	bne	t6, zero, .for_body_bb_bb1
	j	.main_bb3

.for_iter_bb_bb1:
	la	t6, j_global0
	lw	t6, 0(t6)
	addi	t5, t6, 1
	la	t6, j_global0
	sw	t5, 0(t6)
	j	.for_condition_bb_bb1

.for_body_bb_bb1:
	mv	s11, ra
	call	_f_getInt0
	mv	ra, s11
	la	t6, n_global0
	sw	a0, 0(t6)
	la	t6, n_global0
	lw	t6, 0(t6)
	li	t5, 1
	xor	t6, t6, t5
	seqz	t6, t6
	bne	t6, zero, .if_then_bb1
	j	.main_bb4

.main_bb3:
	j	.for_iter_bb_bb0

.if_then_bb1:
	la	t6, i_global0
	lw	t6, 0(t6)
	la	t5, r_global0
	sw	t6, 0(t5)
	la	t6, j_global0
	lw	t5, 0(t6)
	la	t6, c_global0
	sw	t5, 0(t6)
	j	.main_bb4

.main_bb4:
	j	.for_iter_bb_bb1

	.size	main, .-main
			 # -- End function
	.globl	_f_abs0
	.p2align		1
	.type	_f_abs0,@function
_f_abs0:
._f_abs0_bb0:
	sw	s0, -4(sp)
	addi	sp, sp, -8
	addi	s0, sp, 8
	mv	s1, s0
	sw	a0, -8(s0)
	lw	t5, -8(s0)
	li	t6, 0
	slt	t6, t6, t5
	bne	t6, zero, .if_then_bb0
	j	._f_abs0_bb2

._f_abs0_bb1:
	lw	a0, -4(s0)
	mv	s0, s1
	addi	sp, sp, 8
	lw	s0, -4(sp)
	ret

.if_then_bb0:
	lw	t6, -8(s0)
	sw	t6, -4(s0)
	j	._f_abs0_bb1

._f_abs0_bb2:
	lw	t6, -8(s0)
	li	t5, 0
	sub	t6, t5, t6
	sw	t6, -4(s0)
	j	._f_abs0_bb1

	.size	_f_abs0, .-_f_abs0
			 # -- End function
	.type	n_global0,@object
	.section	.bss
	.globl	n_global0
n_global0:
	.word	0
	.size	n_global0, 4
	.type	r_global0,@object
	.section	.bss
	.globl	r_global0
r_global0:
	.word	0
	.size	r_global0, 4
	.type	c_global0,@object
	.section	.bss
	.globl	c_global0
c_global0:
	.word	0
	.size	c_global0, 4
	.type	i_global0,@object
	.section	.bss
	.globl	i_global0
i_global0:
	.word	0
	.size	i_global0, 4
	.type	j_global0,@object
	.section	.bss
	.globl	j_global0
j_global0:
	.word	0
	.size	j_global0, 4

