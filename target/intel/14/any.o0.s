# mark_description "Intel(R) C Intel(R) 64 Compiler for applications running on Intel(R) 64, Version 19.0.0.117 Build 20180804";
# mark_description "-O0 -S -c -o ../target/intel/14/any.o0.s";
	.file "14.c"
	.text
..TXTST0:
.L_2__routine_start_victim_function_v14_0:
# -- Begin  victim_function_v14
	.text
# mark_begin;

	.globl victim_function_v14
# --- victim_function_v14(size_t)
victim_function_v14:
# parameter 1: %rdi
..B1.1:                         # Preds ..B1.0
                                # Execution count [0.00e+00]
	.cfi_startproc
..___tag_value_victim_function_v14.1:
..L2:
                                                          #10.36
        pushq     %rbp                                          #10.36
	.cfi_def_cfa_offset 16
        movq      %rsp, %rbp                                    #10.36
	.cfi_def_cfa 6, 16
	.cfi_offset 6, -16
        subq      $16, %rsp                                     #10.36
        movq      %rdi, -16(%rbp)                               #10.36
        movq      -16(%rbp), %rax                               #11.10
        movl      array1_size(%rip), %edx                       #11.14
        cmpq      %rdx, %rax                                    #11.14
        jae       ..B1.3        # Prob 50%                      #11.14
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.2:                         # Preds ..B1.1
                                # Execution count [0.00e+00]
        movzbl    temp(%rip), %eax                              #12.11
        movzbl    %al, %eax                                     #12.11
        movq      -16(%rbp), %rdx                               #12.33
        xorq      $255, %rdx                                    #12.37
        movl      $array1, %ecx                                 #12.26
        addq      %rdx, %rcx                                    #12.26
        movzbl    (%rcx), %edx                                  #12.26
        movzbl    %dl, %edx                                     #12.26
        imull     $512, %edx, %edx                              #12.44
        movslq    %edx, %rdx                                    #12.19
        movl      $array2, %ecx                                 #12.19
        addq      %rdx, %rcx                                    #12.19
        movzbl    (%rcx), %edx                                  #12.19
        movzbl    %dl, %edx                                     #12.19
        andl      %edx, %eax                                    #12.11
        movb      %al, temp(%rip)                               #12.11
                                # LOE rbx rbp rsp r12 r13 r14 r15 rip
..B1.3:                         # Preds ..B1.2 ..B1.1
                                # Execution count [0.00e+00]
        leave                                                   #13.1
	.cfi_restore 6
        ret                                                     #13.1
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
