# mark_description "Intel(R) C Intel(R) 64 Compiler for applications running on Intel(R) 64, Version 19.0.0.117 Build 20180804";
# mark_description "-masm=intel -O2 -mconditional-branch=all-fix -S -c -o ../target/intel/14/lfence.o2.asm";
	.intel_syntax noprefix
	.file "14.c"
	.text
..TXTST0:
.L_2__routine_start_victim_function_v14_0:
# -- Begin  victim_function_v14
	.text
# mark_begin;
       .align    16,0x90
	.globl victim_function_v14
# --- victim_function_v14(size_t)
victim_function_v14:
# parameter 1: rdi
..B1.1:                         # Preds ..B1.0
                                # Execution count [1.00e+00]
	.cfi_startproc
..___tag_value_victim_function_v14.1:
..L2:
                                                          #10.36
        mov       eax, DWORD PTR array1_size[rip]               #11.14
        cmp       rdi, rax                                      #11.14
        jae       ..B1.3        # Prob 50%                      #11.14
                                # LOE rbx rbp rdi r12 r13 r14 r15
..B1.2:                         # Preds ..B1.1
                                # Execution count [5.00e-01]
        xor       rdi, 255                                      #12.37
        mov       al, BYTE PTR temp[rip]                        #12.11
        movzx     edi, BYTE PTR [array1+rdi]                    #12.26
        shl       rdi, 9                                        #12.44
        lfence                                                  #12.26
        and       al, BYTE PTR [array2+rdi]                     #12.11
        mov       BYTE PTR temp[rip], al                        #12.11
                                # LOE rbx rbp r12 r13 r14 r15
..B1.3:                         # Preds ..B1.1 ..B1.2
                                # Execution count [1.00e+00]
        ret                                                     #13.1
        .align    16,0x90
                                # LOE
	.cfi_endproc
# mark_end;
	.type	victim_function_v14,@function
	.size	victim_function_v14,.-victim_function_v14
..LNvictim_function_v14.0:
	.data
# -- End  victim_function_v14
	.bss
	.align 4
	.align 1
	.globl temp
temp:
	.type	temp,@object
	.size	temp,1
	.space 1	# pad
	.data
	.align 4
	.align 4
	.globl array1_size
array1_size:
	.long	16
	.type	array1_size,@object
	.size	array1_size,4
	.align 1
	.globl array1
array1:
	.byte	1
	.byte	2
	.byte	3
	.byte	4
	.byte	5
	.byte	6
	.byte	7
	.byte	8
	.byte	9
	.byte	10
	.byte	11
	.byte	12
	.byte	13
	.byte	14
	.byte	15
	.byte	16
	.type	array1,@object
	.size	array1,16
	.data
	.comm array2,131072,32
	.section .note.GNU-stack, ""
# End
