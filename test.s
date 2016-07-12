	.file	"test.c"
	.text
.globl main
	.type	main, @function
main:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$16, %esp
	movb	$1, -1(%ebp)
	movb	-1(%ebp), %al
	addl	$2, %eax
	movb	%al, -1(%ebp)
	leave
	ret
	.size	main, .-main
	.ident	"GCC: (Illumos gcc-4.4.4-il-3) 4.4.4"
