	.text
	.intel_syntax noprefix
	.file	"07.c"
	.globl	victim_function_v07     # -- Begin function victim_function_v07
	.p2align	4, 0x90
	.type	victim_function_v07,@function
victim_function_v07:                    # @victim_function_v07
	.cfi_startproc
# %bb.0:
	cmp	qword ptr [rip + victim_function_v07.last_x], rdi
	jne	.LBB0_2
# %bb.1:
	lfence
	movzx	eax, byte ptr [rdi + array1]
	shl	rax, 9
	mov	al, byte ptr [rax + array2]
	and	byte ptr [rip + temp], al
.LBB0_2:
	lfence
	mov	eax, dword ptr [rip + array1_size]
	cmp	rax, rdi
	jbe	.LBB0_4
# %bb.3:
	lfence
	mov	qword ptr [rip + victim_function_v07.last_x], rdi
.LBB0_4:
	lfence
	ret
.Lfunc_end0:
	.size	victim_function_v07, .Lfunc_end0-victim_function_v07
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

	.type	victim_function_v07.last_x,@object # @victim_function_v07.last_x
	.local	victim_function_v07.last_x
	.comm	victim_function_v07.last_x,8,8
	.type	array2,@object          # @array2
	.comm	array2,131072,16

	.ident	"clang version 7.0.1 (tags/RELEASE_701/final)"
	.section	".note.GNU-stack","",@progbits
