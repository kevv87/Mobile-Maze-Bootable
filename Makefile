COMPILER = nasm
SIMULATOR = qemu-system-x86_64 -hda
RM = rm -rf 

default: build simulate

build:
	${COMPILER} -f bin bootloader.asm -o boot.bin

custom:
	${COMPILER} -f bin ${file} -o boot.bin

simulate: boot.bin
	${SIMULATOR} boot.bin

clean:
	${RM} boot.bin
