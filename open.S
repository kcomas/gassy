.macro open_call
    # %rdi filename
    # %rsi flags
    # %rdx mode
    movq $2, %rax
    syscall
.endm

.macro read_call
    # %rdi fd
    # %rsi buffer
    # %rdx buffer size
    movq $0, %rax
    syscall
.endm
