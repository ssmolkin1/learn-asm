.section .text
.globl _start

_start:
# push args
push $4
# call function
call factorial
# remove args from stack
add $8, %rsp
# exit program, returning result as exit code
mov %rax, %rbx
mov $1, %rax
int $0x80

.type factorial, @function
factorial:
# store old bp and initialize bp to sp
push %rbp
mov %rsp, %rbp

# function logic
mov $1, %rax
mov 16(%rbp), %rdi

## while loop, decrementing %rdi
loop_start:
cmp $0, %rdi
je loop_end
imul %rdi
dec %rdi
jmp loop_start

loop_end:
mov %rbp, %rsp
pop %rbp
ret
