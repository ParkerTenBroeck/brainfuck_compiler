nasm -f elf64 test.asm -o as.out
objdump -d as.out
objcopy -I elf64-little -j .text -O binary as.out
