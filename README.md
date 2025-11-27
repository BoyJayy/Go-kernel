# Go-kernel
эт небольшой эксперимент в виде простейшего ядра на Go

запуск через граб.
собирается под всл или линукс:
```make```
ручная сборка:
```bash
cd kernel
GOOS=linux GOARCH=386 CGO_ENABLED=0 go build -buildmode=c-archive -o ../kernel.a

cd ..

gcc -m32 -c boot/boot.s -o boot.o
ld -m elf_i386 -T linker.ld -o kernel.elf boot.o kernel.a

cp kernel.elf iso/boot/
grub-mkrescue -o go-kernel.iso iso
```
если через qemu:
```
qemu-system-i386 -cdrom go-kernel.iso
```
