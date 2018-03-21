.include "../open.S"
.include "../write.S"

.section .bss
    .equ BUFFER_SIZE, 1
    .lcomm BUFFER_DATA, BUFFER_SIZE

.section .text
    to_load: .asciz "/etc/fstab"

.globl _start

_start:
    push %rbp
    movq %rsp, %rbp
    subq $8, %rsp
    movq $to_load, %rdi
    movq $0, %rsi
    movq $0, %rdx
    open_call
    movq %rax, -8(%rbp)
read_char:
    movq -8(%rbp), %rdi
    movq $BUFFER_DATA, %rsi
    movq $BUFFER_SIZE, %rdx
    read_call
    push %rax
    movq $1, %rdi
    movq $BUFFER_DATA, %rsi
    movq $BUFFER_SIZE, %rdx
    write_call
    pop %rax
    cmp $0, %rax
    jne read_char
    write_new_line
    movq %rsp, %rbp
    pop %rbp
    movq $0, %rdi
    exit_call
