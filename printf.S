.section .text
    format: .asciz "%s\n"
    .globl _start

_start:
    movq 16(%rsp), %rsi
    movq $format, %rdi
    movq $0, %rax
    call printf
    movq $3, %rdi
    call exit
