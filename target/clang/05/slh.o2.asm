	.text
	.intel_syntax noprefix
	.file	"05.c"
	.globl	victim_function_v05     # -- Begin function victim_function_v05
	.p2align	4, 0x90
	.type	victim_function_v05,@function
victim_function_v05:                    # @victim_function_v05
	.cfi_startproc
# %bb.0:
	mov	r10, rsp
	mov	r9, -1
	sar	r10, 63
	mov	ecx, dword ptr [rip + array1_size]
	cmp	rcx, rdi
	jbe	.LBB0_1
# %bb.2:
	cmovbe	r10, r9
	mov	r8d, edi
	add	r8d, -1
	js	.LBB0_3
# %bb.4:
	cmovs	r10, r9
	mov	dl, byte ptr [rip + temp]
	movsxd	rsi, r8d
	test	dil, 3
	je	.LBB0_5
# %bb.6:                                # %.preheader1
	cmove	r10, r9
	and	edi, 3
	xor	ecx, ecx
	jmp	.LBB0_7
	.p2align	4, 0x90
.LBB0_8:                                #   in Loop: Header=BB0_7 Depth=1
	cmove	r10, r9
.LBB0_7:                                # =>This Inner Loop Header: Depth=1
	movzx	eax, byte ptr [rsi + array1]
	shl	rax, 9
	or	rax, r10
	and	dl, byte ptr [rax + array2]
	or	dl, r10b
	add	rsi, -1
	add	rcx, 1
	cmp	edi, ecx
	jne	.LBB0_8
# %bb.9:                                # %.loopexit2
	cmovne	r10, r9
	mov	edi, r8d
	sub	edi, ecx
	cmp	r8d, 3
	jae	.LBB0_12
.LBB0_11:
	cmovae	r10, r9
	jmp	.LBB0_15
.LBB0_1:
	cmova	r10, r9
	jmp	.LBB0_16
.LBB0_3:
	cmovns	r10, r9
	jmp	.LBB0_16
.LBB0_5:
	cmovne	r10, r9
	mov	edi, r8d
	cmp	r8d, 3
	jb	.LBB0_11
.LBB0_12:                               # %.preheader
	cmovb	r10, r9
	lea	rsi, [rsi + array1]
	jmp	.LBB0_13
	.p2align	4, 0x90
.LBB0_17:                               #   in Loop: Header=BB0_13 Depth=1
	cmovs	r10, r9
.LBB0_13:                               # =>This Inner Loop Header: Depth=1
	movzx	eax, byte ptr [rsi]
	shl	rax, 9
	or	rax, r10
	and	dl, byte ptr [rax + array2]
	movzx	eax, byte ptr [rsi - 1]
	shl	rax, 9
	or	rax, r10
	and	dl, byte ptr [rax + array2]
	movzx	eax, byte ptr [rsi - 2]
	shl	rax, 9
	or	rax, r10
	and	dl, byte ptr [rax + array2]
	movzx	eax, byte ptr [rsi - 3]
	shl	rax, 9
	or	rax, r10
	and	dl, byte ptr [rax + array2]
	or	dl, r10b
	add	rsi, -4
	add	edi, -4
	jns	.LBB0_17
# %bb.14:
	cmovns	r10, r9
.LBB0_15:
	mov	byte ptr [rip + temp], dl
.LBB0_16:
	shl	r10, 47
	or	rsp, r10
	ret
.Lfunc_end0:
	.size	victim_function_v05, .Lfunc_end0-victim_function_v05
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
