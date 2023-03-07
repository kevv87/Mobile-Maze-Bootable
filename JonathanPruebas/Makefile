.PHONY: all build clean runqemu

all: build runqemu clean

APP=shp

build:
	@nasm -f bin -o ${APP}.img ${APP}.asm
	@nasm -f bin -o ${APP}.com -Dcom_file=1 ${APP}.asm

clean:
	@rm ${APP}.img ${APP}.com

runqemu: shp.img
	@qemu-system-x86_64 -m 2048 -drive file=${APP}.img,format=raw