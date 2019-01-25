.section .data

data_items:
.long 3,67,34,222,45,75,54,34,2,44,33,22,11,66,255

.section .text

.globl _start
_start:
movl $0, %edi
movl $4, %eax
movl $13, %ecx
mull %ecx
movl %eax, %ecx
addl $data_items, %ecx
movl data_items, %eax
movl %eax, %ebx

start_loop:
incl %edi
movl $4, %eax
mull %edi
addl $data_items, %eax
cmpl %eax, %ecx
je loop_exit
movl data_items(,%edi,4), %eax
cmpl %ebx, %eax
jle start_loop
movl %eax, %ebx
jmp start_loop

loop_exit:
movl $1, %eax
int $0x80
