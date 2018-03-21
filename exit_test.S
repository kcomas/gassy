.include "../exit.S"

.section .text

.globl _start

_start:
    movq $32, %rdi
    exit_call
