.section .text
    arg_msg: .ascii "Requires extacly 1 argument\n"
    new_line: .ascii "\n"

.globl _start

_start:
    popq %rbx
    cmpq $2, %rbx
    jne arg_error
    addq $8, %rsp
    popq %rsi
    call str_to_int
    pushq %rax
    pushq %rax
    call fib
    jmp print_int

arg_error:
    movq $1, %rax
    movq $1, %rdi
    movq $arg_msg, %rsi
    movq $28, %rdx
    syscall
    movq $1, %rbx
    jmp exit

.type str_to_int, @function
str_to_int:
    xorq %rax, %rax
    movq $10, %rcx

part_str:
    cmpb $0x0, (%rsi)
    je done_str
    movb (%rsi), %bl
    subb $48, %bl
    mulq %rcx
    addq %rbx, %rax
    incq %rsi
    jmp part_str

done_str:
    ret

.type fib, @function
fib:
    pushq %rbp
    movq %rsp, %rbp
    movq 16(%rbp), %rax
    cmpq $0, %rax
    je fib_done
    cmpq $1, %rax
    je fib_done
    decq %rax
    push %rax
    push %rax
    call fib
    movq %rax, 16(%rbp)
    movq 24(%rbp), %rbx
    subq $2, %rbx
    push %rbx
    push %rbx
    call fib
    addq 16(%rbp), %rax

fib_done:
    movq %rbp, %rsp
    popq %rbp
    ret

print_int:
    movq $0, %rdx
    movq $10, %rbx
    divq %rbx
    addq $48, %rdx
    addq $0x0, %rdx
    push %rdx
    incq %r12
    cmpq $0x0, %rax
    jne print_int

    movq $1, %rax
    mulq %r12
    movq $8, %r12
    mulq %r12
    movq %rax, %rdx

    movq $1, %rax
    movq $1, %rdi
    movq %rsp, %rsi
    syscall

    movq $1, %rax
    movq $1, %rdi
    movq $new_line, %rsi
    movq $1, %rdx
    syscall
    mov $0, %rbx

exit:
    movq $0x3C, %rax
    syscall
