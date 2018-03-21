.section .text
    msg: .ascii "Hello"
    format: .asciz "%s\n"
    .globl main

main:
   movq format(%rip), %rdi
   lea  msg(%rip), %edi
   movq msg(%rip), %rsi
   xor %rax, %rax
   call printf@plt
