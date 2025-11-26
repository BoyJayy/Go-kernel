.set ALIGN,    1<<0
.set MEMINFO,  1<<1
.set FLAGS,    ALIGN | MEMINFO
.set MAGIC,    0x1BADB002
.set CHECKSUM, -(MAGIC + FLAGS)

    .section .multiboot
    .align 4
    .long MAGIC
    .long FLAGS
    .long CHECKSUM 

    .section .text
    .globl _start
    .extern main.main    

_start:
    cli
    mov $stack_top, %esp
    call main.main       

1:  hlt
    jmp 1b

    .section .bss
    .align 16
    .lcomm stack, 16384
stack_top:
