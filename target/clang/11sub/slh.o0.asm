	.text
	.intel_syntax noprefix
	.file	"11sub.c"
	.globl	victim_function_v11     # -- Begin function victim_function_v11
	.p2align	4, 0x90
	.type	victim_function_v11,@function
victim_function_v11:                    # @victim_function_v11
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	sub	rsp, 16
	mov	rax, -1
	mov	rcx, rsp
	sar	rcx, 63
	mov	qword ptr [rbp - 8], rdi
	mov	rdx, qword ptr [rbp - 8]
	mov	esi, dword ptr [array1_size]
	cmp	rdx, rsi
	jae	.LBB0_1
	jmp	.LBB0_2
.LBB0_1:
	cmovb	rcx, rax
	jmp	.LBB0_3
.LBB0_2:
	cmovae	rcx, rax
	mov	rax, qword ptr [rbp - 8]
	movzx	eax, byte ptr [rax + array1]
	mov	edx, ecx
	or	edx, eax
	shl	edx, 9
	movsxd	rax, edx
	movabs	rsi, offset array2
	add	rsi, rax
	movabs	rdi, offset temp
	mov	edx, 1
	shl	rcx, 47
	or	rsp, rcx
	call	mymemcmp
	mov	rcx, rsp
	sar	rcx, 63
	mov	byte ptr [temp], al
.LBB0_3:
	shl	rcx, 47
	or	rsp, rcx
	add	rsp, 16
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.Lfunc_end0:
	.size	victim_function_v11, .Lfunc_end0-victim_function_v11
	.cfi_endproc
                                        # -- End function
	.globl	mymemcmp                # -- Begin function mymemcmp
	.p2align	4, 0x90
	.type	mymemcmp,@function
mymemcmp:                               # @mymemcmp
	.cfi_startproc
# %bb.0:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset rbp, -16
	mov	rbp, rsp
	.cfi_def_cfa_register rbp
	mov	rax, -1
	mov	rcx, rsp
	sar	rcx, 63
	mov	qword ptr [rbp - 48], rdi
	mov	qword ptr [rbp - 40], rsi
	mov	qword ptr [rbp - 32], rdx
	mov	rdx, qword ptr [rbp - 48]
	mov	qword ptr [rbp - 24], rdx
	mov	rdx, qword ptr [rbp - 40]
	mov	qword ptr [rbp - 16], rdx
	cmp	qword ptr [rbp - 32], 0
	jne	.LBB1_2
# %bb.1:
	cmovne	rcx, rax
	mov	dword ptr [rbp - 4], 0
	jmp	.LBB1_9
.LBB1_2:
	cmove	rcx, rax
	jmp	.LBB1_3
.LBB1_3:                                # =>This Inner Loop Header: Depth=1
	xor	edx, edx
	mov	rsi, qword ptr [rbp - 32]
	add	rsi, -1
	mov	qword ptr [rbp - 32], rsi
	cmp	rsi, 0
	je	.LBB1_4
	jmp	.LBB1_5
.LBB1_4:                                #   in Loop: Header=BB1_3 Depth=1
	cmovne	rcx, rax
	jmp	.LBB1_6
.LBB1_5:                                #   in Loop: Header=BB1_3 Depth=1
	cmove	rcx, rax
	mov	rdx, qword ptr [rbp - 24]
	movzx	edx, byte ptr [rdx]
	mov	esi, ecx
	or	esi, edx
	mov	rdx, qword ptr [rbp - 16]
	movzx	edx, byte ptr [rdx]
	mov	edi, ecx
	or	edi, edx
	cmp	esi, edi
	sete	dl
.LBB1_6:                                #   in Loop: Header=BB1_3 Depth=1
	test	dl, 1
	jne	.LBB1_7
	jmp	.LBB1_8
.LBB1_7:                                #   in Loop: Header=BB1_3 Depth=1
	cmove	rcx, rax
	mov	rdx, qword ptr [rbp - 24]
	add	rdx, 1
	mov	qword ptr [rbp - 24], rdx
	mov	rdx, qword ptr [rbp - 16]
	add	rdx, 1
	mov	qword ptr [rbp - 16], rdx
	jmp	.LBB1_3
.LBB1_8:
	cmovne	rcx, rax
	mov	rax, qword ptr [rbp - 24]
	movzx	eax, byte ptr [rax]
	mov	edx, ecx
	or	edx, eax
	mov	rax, qword ptr [rbp - 16]
	movzx	eax, byte ptr [rax]
	mov	esi, ecx
	or	esi, eax
	sub	edx, esi
	mov	dword ptr [rbp - 4], edx
.LBB1_9:
	mov	eax, dword ptr [rbp - 4]
	shl	rcx, 47
	or	rsp, rcx
	pop	rbp
	.cfi_def_cfa rsp, 8
	ret
.Lfunc_end1:
	.size	mymemcmp, .Lfunc_end1-mymemcmp
	.cfi_endproc
                                        # -- End function
	.type	array1_size,@object     # @array1_size
	.data
	.globl	array1_size
	.p2align	2
array1_size:
	.long	16                      # 0x10
	.size	array1_size, 4

	.type	array1,@object          # @array1
	.globl	array1
	.p2align	4
array1:
	.ascii	"\001\002\003\004\005\006\007\b\t\n\013\f\r\016\017\020"
	.size	array1, 16

	.type	temp,@object            # @temp
	.bss
	.globl	temp
temp:
	.byte	0                       # 0x0
	.size	temp, 1

	.type	array2,@object          # @array2
	.comm	array2,131072,16

	.ident	"clang version 7.0.1 (tags/RELEASE_701/final)"
	.section	".note.GNU-stack","",@progbits
