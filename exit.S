.section .text

.macro exit_call
    # exit code is placed into rdi
    movq $60, %rax
    syscall
.endm
