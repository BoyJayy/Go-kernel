CC = gcc
LD = ld
GO = go

all: kernel.elf

kernel.a:
	cd kernel && $(GO) build -buildmode=c-archive -o ../kernel.a

boot.o: boot/boot.s
	$(CC) -m32 -c $< -o $@

kernel.elf: boot.o kernel.a linker.ld
	$(LD) -m elf_i386 -T linker.ld -o $@ boot.o kernel.a

clean:
	rm -f boot.o kernel.a kernel.elf
