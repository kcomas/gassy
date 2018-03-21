.include "../write.S"

.globl _start


.section .text
    example: .asciz "Test String\n"

_start:
    movb $0, %al
    movq $example, %rdi
    len_call
    decq %rdx
    movq $1, %rdi
    movq $example, %rsi
    movq %rcx, %rdx
    write_call
    movq $0, %rdi
    exit_call
