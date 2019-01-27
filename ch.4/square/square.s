.section .text
.globl _start

_start:
push $5
call square
add $16, %rsp
mov %rax, %rbx
mov $1, %rax
int $0x80

.type square, @function
square:
push %rbp
mov %rsp, %rbp
mov 16(%rbp), %rax
imul 16(%rbp), %rax
mov %rbp, %rsp
pop %rbp
ret
