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
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$56, %rsp
	.cfi_def_cfa_offset 112
	movq	%rdi, 8(%rsp)
	movq	%fs:40, %rax
	movq	%rax, 40(%rsp)
	xorl	%eax, %eax
	movl	$0, 4(%rsp)
	leaq	.LC1(%rip), %r13
	jmp	.L2
.L4:
	leaq	.LC4(%rip), %rsi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk@PLT
.L5:
	addq	$1, %rbx
	cmpq	%rbp, %rbx
	je	.L12
.L6:
	movzbl	(%rbx), %edx
	movzbl	%dl, %ecx
	movq	(%r12), %rax
	testb	$64, 1(%rax,%rcx,2)
	je	.L4
	movzbl	%dl, %edx
	movq	%r15, %rsi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk@PLT
	jmp	.L5
.L12:
	leaq	.LC5(%rip), %rsi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk@PLT
	addl	%r14d, 4(%rsp)
.L2:
	leaq	16(%rsp), %rdi
	movq	8(%rsp), %rcx
	movl	$16, %edx
	movl	$1, %esi
	call	fread@PLT
	movq	%rax, %r14
	testq	%rax, %rax
	je	.L13
	movl	4(%rsp), %edx
	leaq	.LC0(%rip), %rsi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk@PLT
	leaq	16(%rsp), %rbx
	leaq	(%r14,%rbx), %rbp
	movq	%rbx, %r12
.L3:
	movzbl	(%r12), %edx
	movq	%r13, %rsi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk@PLT
	addq	$1, %r12
	cmpq	%rbp, %r12
	jne	.L3
	leaq	.LC2(%rip), %rsi
	movl	$2, %edi
	movl	$0, %eax
	call	__printf_chk@PLT
	call	__ctype_b_loc@PLT
	movq	%rax, %r12
	leaq	.LC3(%rip), %r15
	jmp	.L6
.L13:
	movq	40(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L14
	addq	$56, %rsp
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
.L14:
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
	.text
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
	je	.L16
	movq	(%rsi), %rcx
	leaq	.LC6(%rip), %rdx
	movl	$2, %esi
	movq	stderr(%rip), %rdi
	movl	$0, %eax
	call	__fprintf_chk@PLT
	movl	$1, %eax
.L15:
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L16:
	.cfi_restore_state
	movq	8(%rsi), %rdi
	leaq	.LC7(%rip), %rsi
	call	fopen@PLT
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L20
	movq	%rax, %rdi
	call	print_hex_dump
	movq	%rbx, %rdi
	call	fclose@PLT
	movl	$0, %eax
	jmp	.L15
.L20:
	leaq	.LC8(%rip), %rdi
	call	perror@PLT
	movl	$1, %eax
	jmp	.L15
	.cfi_endproc
.LFE25:
	.size	main, .-main
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
