COMPILER = nasm
SIMULATOR = qemu-system-x86_64 -hda
RM = rm -rf 

default: build simulate

build: bootloader.asm game.asm
	${COMPILER} -f bin bootloader.asm -o bootloader.bin
	${COMPILER} -f bin game.asm -o game.bin
	cat bootloader.bin game.bin > boot.bin

custom:
	${COMPILER} -f bin ${file} -o boot.bin

simulate: boot.bin
	${SIMULATOR} boot.bin

clean:
	${RM} *.bin
