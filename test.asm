section .text
global _start

add rsp,1000 *8
mov rbx, rsp
_start:
mov rax, 1
mov rdi, 1
mov rdx, 1
push 98
mov rsi, rdi
syscall
add rsp,8 *8
add rsp,128 
lea rsi, [rbx]
lea rsi, [rbx + 1]
lea rsi, [rbx - 1]
lea rsi, [rbx + 128]
lea rsi, [rbx -129]