.section .data
    items: .quad 3,67,34,222,45,75,54,34,44,33,22,11,66,0

.section .text
.globl _start
_start:
    movq $0, %rdi
    movq items(,%rdi,8), %rax
    movq %rax, %rbx

loop:
    cmpq $0, %rax
    je exit
    incq %rdi
    movq items(,%rdi,8), %rax
    cmpq %rbx, %rax
    jle loop
    movq %rax, %rbx
    jmp loop

exit:
    movq $1, %rax
    int $0x80

