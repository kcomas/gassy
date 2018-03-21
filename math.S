.section .data

.globl _start

_start:
    pushq $3
    call math_add
    movq %rax, %rbx
    movq $1, %rax
    int $0x80

math_add:
    pushq %rbp
    movq %rsp, %rbp
    movq 16(%rbp), %rax
    movq %rbp, %rsp
    popq %rbp
    ret
