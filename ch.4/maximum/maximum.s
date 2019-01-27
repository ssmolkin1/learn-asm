.section .data

data_items_1:
.long 3,67,34,222,45,75,54,34,2,44,33,22,11,66,255

data_items_2:
.long 1,4,104,231,107

data_items_3:
.long 240, 239, 201, 227

.section .text

.globl _start
_start:
push $15
push $data_items_1
call maximum
add $16, %rsp
push $5
push $data_items_2
call maximum
add $16, %rsp
push $4
push $data_items_3
call maximum
add $16, %rsp
mov %eax, %ebx
mov $1, %rax
int $0x80

.type maximum, @function
maximum:
# store old bp, position new bp
push %rbp
mov %rsp, %rbp

# main function
mov $0, %edi
mov 16(%rbp), %rcx
mov (%rcx), %ebx
mov %ebx, %eax

start_loop:
inc %rdi
cmp 24(%rbp), %rdi
jge loop_exit
mov %rdi, %rcx
imul $4, %rcx
add 16(%rbp), %rcx
mov (%rcx,%rdi,4), %ebx
cmp %eax, %ebx
jle start_loop
mov %ebx, %eax
jmp start_loop

loop_exit:
#function clean up
mov %rbp, %rsp
pop %rbp
ret
