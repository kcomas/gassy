    .section	.rodata
.LC0:
    .string	"Kevin"
.LC1:
    .string	"Hello World"
.LC2:
    .string	"%s My Name Is %s\n"
    .text
    .globl	main
main:
    leaq .LC0(%rip), %rdx
    leaq .LC1(%rip), %rsi
    leaq .LC2(%rip), %rdi
    movq $0, %rax
    call printf@plt
    movq $0, %rdi
    call exit@plt
