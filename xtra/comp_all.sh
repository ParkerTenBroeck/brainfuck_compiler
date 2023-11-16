nasm -f elf64 ./asm/*.asm -o ./obj/as.elf
g++ -O3 -fPIC -T link.ld -nostartfiles ./obj/* ./cxx/*  -o ./out/all.out
objcopy -I elf64-little  -j .text.start -j .text.other -j .text.dyn_fn -j .data -O binary ./out/all.out ./out/raw.bin
objdump -dtrTRh ./out/all.out
xxd ./out/raw.bin