section .text.dyn_fn progbits alloc exec nowrite
; section 

global print: function

print:
mov r11, $0123456789abcdef
jmp r11


global lol_jpg: function

lol_jpg:
mov r11, $0123456789abcdef
jmp r11

