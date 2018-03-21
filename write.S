.include "../exit.S"

.section .text
    new_line: .ascii "\n"

.macro len_call
    # length of bytes with terminator
    # %al terminator
    # %rsi ptr to bytes
    # return %rcx with length
    subq %rcx, %rcx
    notq %rcx
    cld
    repne scasb
    notq %rcx
.endm

.macro write_call
    # %rdi fd
    # %rsi string to print
    # %rdx string length
    movq $1, %rax
    syscall
.endm

.macro write_new_line
    # %rdi fd
    movq $1, %rax
    movq $new_line, %rsi
    movq $1, %rdx
    syscall
.endm
