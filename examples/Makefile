COMPILER = nasm
SIMULATOR = qemu-system-x86_64
RM = rm -rf

custom:
	${COMPILER} -f bin ${file} -o boot.bin

simulate: boot.bin
	${SIMULATOR} -hda boot.bin

clean:
	${RM} boot.bin

