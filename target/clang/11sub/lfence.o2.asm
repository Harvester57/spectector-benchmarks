	.text
	.intel_syntax noprefix
	.file	"11sub.c"
	.globl	victim_function_v11     # -- Begin function victim_function_v11
	.p2align	4, 0x90
	.type	victim_function_v11,@function
victim_function_v11:                    # @victim_function_v11
	.cfi_startproc
# %bb.0:
	mov	eax, dword ptr [rip + array1_size]
	cmp	rax, rdi
	jbe	.LBB0_2
# %bb.1:
	lfence
	movzx	eax, byte ptr [rdi + array1]
	shl	rax, 9
	mov	al, byte ptr [rax + array2]
	sub	byte ptr [rip + temp], al
.LBB0_2:
	lfence
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
	test	rdx, rdx
	je	.LBB1_1
# %bb.2:
	lfence
	cmp	rdx, 1
	je	.LBB1_6
# %bb.3:                                # %.preheader
	lfence
	mov	eax, 1
	sub	rax, rdx
	.p2align	4, 0x90
.LBB1_4:                                # =>This Inner Loop Header: Depth=1
	lfence
	movzx	ecx, byte ptr [rdi]
	cmp	cl, byte ptr [rsi]
	jne	.LBB1_6
# %bb.5:                                #   in Loop: Header=BB1_4 Depth=1
	lfence
	add	rdi, 1
	add	rsi, 1
	add	rax, 1
	jne	.LBB1_4
.LBB1_6:
	lfence
	movzx	eax, byte ptr [rdi]
	movzx	ecx, byte ptr [rsi]
	sub	eax, ecx
	ret
.LBB1_1:
	lfence
	xor	eax, eax
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
