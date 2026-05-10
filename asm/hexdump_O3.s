	.file	"hexdump.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%08x "
.LC1:
	.string	"%02x "
.LC2:
	.string	"|"
.LC3:
	.string	"%c"
.LC4:
	.string	"."
.LC5:
	.string	"|\n"
	.text
	.p2align 4
	.globl	print_hex_dump
	.type	print_hex_dump, @function
print_hex_dump:
.LFB24:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	leaq	.LC1(%rip), %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$72, %rsp
	.cfi_def_cfa_offset 128
	movq	%rdi, 24(%rsp)
	movq	%fs:40, %rax
	movq	%rax, 56(%rsp)
	xorl	%eax, %eax
	leaq	32(%rsp), %rax
	movl	$0, 20(%rsp)
	movq	%rax, 8(%rsp)
	.p2align 4,,10
	.p2align 3
.L2:
	movq	24(%rsp), %rcx
	movq	8(%rsp), %rdi
	movl	$16, %edx
	movl	$1, %esi
	call	fread@PLT
	movq	%rax, %r13
	testq	%rax, %rax
	je	.L13
	movl	20(%rsp), %edx
	leaq	.LC0(%rip), %rsi
	movl	$2, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movq	8(%rsp), %r14
	movq	%r14, %rbx
	leaq	(%r14,%r13), %rbp
	.p2align 4,,10
	.p2align 3
.L3:
	movzbl	(%r14), %edx
	movq	%r12, %rsi
	movl	$2, %edi
	xorl	%eax, %eax
	addq	$1, %r14
	call	__printf_chk@PLT
	cmpq	%r14, %rbp
	jne	.L3
	leaq	.LC2(%rip), %rsi
	movl	$2, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	leaq	.LC3(%rip), %r14
	call	__ctype_b_loc@PLT
	movq	%rax, %r15
	jmp	.L6
	.p2align 4,,10
	.p2align 3
.L15:
	movq	%r14, %rsi
	movl	$2, %edi
	xorl	%eax, %eax
	addq	$1, %rbx
	call	__printf_chk@PLT
	cmpq	%rbx, %rbp
	je	.L14
.L6:
	movzbl	(%rbx), %ecx
	movq	(%r15), %rax
	movq	%rcx, %rdx
	testb	$64, 1(%rax,%rcx,2)
	jne	.L15
	leaq	.LC4(%rip), %rsi
	movl	$2, %edi
	xorl	%eax, %eax
	addq	$1, %rbx
	call	__printf_chk@PLT
	cmpq	%rbx, %rbp
	jne	.L6
.L14:
	leaq	.LC5(%rip), %rsi
	movl	$2, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	addl	%r13d, 20(%rsp)
	jmp	.L2
	.p2align 4,,10
	.p2align 3
.L13:
	movq	56(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L16
	addq	$72, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L16:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE24:
	.size	print_hex_dump, .-print_hex_dump
	.section	.rodata.str1.1
.LC6:
	.string	"Usage: %s <binary file>\n"
.LC7:
	.string	"rb"
.LC8:
	.string	"Error opening file"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB9:
	.section	.text.startup,"ax",@progbits
.LHOTB9:
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB25:
	.cfi_startproc
	endbr64
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	cmpl	$2, %edi
	je	.L18
	movq	(%rsi), %rcx
	movq	stderr(%rip), %rdi
	movl	$2, %esi
	xorl	%eax, %eax
	leaq	.LC6(%rip), %rdx
	call	__fprintf_chk@PLT
.L19:
	movl	$1, %eax
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L18:
	.cfi_restore_state
	movq	8(%rsi), %rdi
	leaq	.LC7(%rip), %rsi
	call	fopen@PLT
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L22
	movq	%rax, %rdi
	call	print_hex_dump
	movq	%rbx, %rdi
	call	fclose@PLT
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.type	main.cold, @function
main.cold:
.LFSB25:
.L22:
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	leaq	.LC8(%rip), %rdi
	call	perror@PLT
	jmp	.L19
	.cfi_endproc
.LFE25:
	.section	.text.startup
	.size	main, .-main
	.section	.text.unlikely
	.size	main.cold, .-main.cold
.LCOLDE9:
	.section	.text.startup
.LHOTE9:
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
