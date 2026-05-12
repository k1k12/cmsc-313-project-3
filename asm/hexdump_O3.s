	.file	"hexdump.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"%08x "
.LC1:
	.string	"%02x "
.LC2:
	.string	"|"
	.text
	.p2align 4
	.globl	print_hex_dump
	.type	print_hex_dump, @function
print_hex_dump:
.LFB41:
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
	subq	$56, %rsp
	.cfi_def_cfa_offset 112
	movq	%rdi, 8(%rsp)
	leaq	16(%rsp), %r14
	movq	%fs:40, %rax
	movq	%rax, 40(%rsp)
	xorl	%eax, %eax
	movl	$0, 4(%rsp)
	.p2align 4,,10
	.p2align 3
.L2:
	movq	8(%rsp), %rcx
	movl	$16, %edx
	movl	$1, %esi
	movq	%r14, %rdi
	call	fread@PLT
	movq	%rax, %r13
	testq	%rax, %rax
	je	.L14
	movl	4(%rsp), %edx
	leaq	.LC0(%rip), %rsi
	xorl	%eax, %eax
	movq	%r14, %rbx
	movl	$2, %edi
	leaq	(%r14,%r13), %rbp
	movq	%r14, %r15
	call	__printf_chk@PLT
	.p2align 4,,10
	.p2align 3
.L3:
	movzbl	(%r15), %edx
	movq	%r12, %rsi
	movl	$2, %edi
	xorl	%eax, %eax
	addq	$1, %r15
	call	__printf_chk@PLT
	cmpq	%r15, %rbp
	jne	.L3
	movl	$124, %edi
	call	putchar@PLT
	call	__ctype_b_loc@PLT
	movq	%rax, %r15
	.p2align 4,,10
	.p2align 3
.L6:
	movzbl	(%rbx), %edx
	movq	(%r15), %rax
	movq	%rdx, %rdi
	testb	$64, 1(%rax,%rdx,2)
	jne	.L12
	movl	$46, %edi
.L12:
	call	putchar@PLT
	addq	$1, %rbx
	cmpq	%rbx, %rbp
	jne	.L6
	leaq	.LC2(%rip), %rdi
	call	puts@PLT
	addl	%r13d, 4(%rsp)
	jmp	.L2
	.p2align 4,,10
	.p2align 3
.L14:
	movq	40(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L15
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
.L15:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE41:
	.size	print_hex_dump, .-print_hex_dump
	.section	.rodata.str1.1
.LC3:
	.string	"Usage: %s <binary file>\n"
.LC4:
	.string	"rb"
.LC5:
	.string	"Error opening file"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB6:
	.section	.text.startup,"ax",@progbits
.LHOTB6:
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB42:
	.cfi_startproc
	endbr64
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	cmpl	$2, %edi
	je	.L17
	movq	(%rsi), %rcx
	movq	stderr(%rip), %rdi
	movl	$2, %esi
	xorl	%eax, %eax
	leaq	.LC3(%rip), %rdx
	call	__fprintf_chk@PLT
.L18:
	movl	$1, %eax
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L17:
	.cfi_restore_state
	movq	8(%rsi), %rdi
	leaq	.LC4(%rip), %rsi
	call	fopen@PLT
	movq	%rax, %rbx
	testq	%rax, %rax
	je	.L21
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
.LFSB42:
.L21:
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	leaq	.LC5(%rip), %rdi
	call	perror@PLT
	jmp	.L18
	.cfi_endproc
.LFE42:
	.section	.text.startup
	.size	main, .-main
	.section	.text.unlikely
	.size	main.cold, .-main.cold
.LCOLDE6:
	.section	.text.startup
.LHOTE6:
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
