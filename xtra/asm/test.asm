section .text.dyn_fn progbits alloc exec nowrite
; section 

global print: function

print:
mov r11, $0123456789abcdef
jmp r11


global lol_jpg: function

lol_jpg:
mov r11, $0123456789abcdef


section .text.start progbits alloc exec nowrite

global _start: function

_start:


mov rbx, rdi
jmp START_END
START_END:
add BYTE [rbx], 0x08
cmp byte [rbx], 0
je LOOP_END_0
LOOP_START_0:
add BYTE [rbx+1], 0x04
lea rbx,[rbx+1]
cmp byte [rbx], 0
je LOOP_END_1
LOOP_START_1:
add BYTE [rbx+1], 0x02
add BYTE [rbx+2], 0x03
add BYTE [rbx+3], 0x03
add BYTE [rbx+4], 0x01
add BYTE [rbx], 0xff
cmp byte [rbx], 0
jne LOOP_START_1
LOOP_END_1:
add BYTE [rbx+1], 0x01
add BYTE [rbx+2], 0x01
add BYTE [rbx+3], 0xff
add BYTE [rbx+5], 0x01
lea rbx,[rbx+5]
cmp byte [rbx], 0
je LOOP_END_2
LOOP_START_2:
lea rbx,[rbx-1]
cmp byte [rbx], 0
jne LOOP_START_2
LOOP_END_2:
add BYTE [rbx-1], 0xff
lea rbx,[rbx-1]
cmp byte [rbx], 0
jne LOOP_START_0
LOOP_END_0:
lea rdi, [rbx+2]
call print
add BYTE [rbx+3], 0xfd
lea rdi, [rbx+3]
call print
add BYTE [rbx+3], 0x07
lea rdi, [rbx+3]
call print
lea rdi, [rbx+3]
call print
add BYTE [rbx+3], 0x03
lea rdi, [rbx+3]
call print
lea rdi, [rbx+5]
call print
add BYTE [rbx+4], 0xff
lea rdi, [rbx+4]
call print
lea rdi, [rbx+3]
call print
add BYTE [rbx+3], 0x03
lea rdi, [rbx+3]
call print
add BYTE [rbx+3], 0xfa
lea rdi, [rbx+3]
call print
add BYTE [rbx+3], 0xf8
lea rdi, [rbx+3]
call print
add BYTE [rbx+5], 0x01
lea rdi, [rbx+5]
call print
add BYTE [rbx+6], 0x02
lea rdi, [rbx+6]
call print
lea rbx,[rbx+6]
ret

; jmp START_END

; GET_IN:
; mov r11, 0x0123456789abcdef
; jmp r11
; START_END:
; add BYTE  [rdi], 08
; cmp byte  [rdi], 0
; je LOOP_END_0
; LOOP_START_0:
; lea    rdi,[rdi+1]
; add BYTE  [rdi], 04
; cmp byte  [rdi], 0
; je LOOP_END_1
; LOOP_START_1:
; lea    rdi,[rdi+1]
; add BYTE  [rdi], 02
; lea    rdi,[rdi+1]
; add BYTE  [rdi], 03
; lea    rdi,[rdi+1]
; add BYTE  [rdi], 03
; lea    rdi,[rdi+1]
; add BYTE  [rdi], 01
; lea    rdi,[rdi-4]
; add BYTE  [rdi], 0xff
; cmp byte  [rdi], 0
; jne LOOP_START_1
; LOOP_END_1:
; lea    rdi,[rdi+1]
; add BYTE  [rdi], 0x01
; lea    rdi,[rdi+1]
; add BYTE  [rdi], 01
; lea    rdi,[rdi+1]
; add BYTE  [rdi], 0xff
; lea    rdi,[rdi+2]
; add BYTE  [rdi], 01
; cmp byte  [rdi], 0
; je LOOP_END_2
; LOOP_START_2:
; lea    rdi,[rdi-1]
; cmp byte  [rdi], 0
; jne LOOP_START_2
; LOOP_END_2:
; lea    rdi,[rdi-1]
; add BYTE  [rdi], 0xff
; cmp byte  [rdi], 0
; jne LOOP_START_0
; LOOP_END_0:
; lea    rdi,[rdi+2]
; push rdi
; call print
; pop rdi
; lea    rdi,[rdi+1]
; add BYTE  [rdi], 0xfd
; push rdi
; call print
; pop rdi
; add BYTE  [rdi], 07
; push rdi
; call print
; pop rdi
; push rdi
; call print
; pop rdi
; add BYTE  [rdi], 0x03
; push rdi
; call print
; pop rdi
; lea    rdi,[rdi+2]
; push rdi
; call print
; pop rdi
; lea    rdi,[rdi-1]
; add BYTE  [rdi], 0xff
; push rdi
; call print
; pop rdi
; lea    rdi,[rdi-1]
; push rdi
; call print
; pop rdi
; add BYTE  [rdi], 0x03
; push rdi
; call print
; pop rdi
; add BYTE  [rdi], 0xfa
; push rdi
; call print
; pop rdi
; add BYTE  [rdi], 0xf8
; push rdi
; call print
; pop rdi
; lea    rdi,[rdi+2]
; add BYTE  [rdi], 0x01
; push rdi
; call print
; pop rdi
; lea    rdi,[rdi+1]
; add BYTE  [rdi], 0x02
; push rdi
; call print
; pop rdi
; ret