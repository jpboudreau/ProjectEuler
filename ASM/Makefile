ASM=nasm
CC=gcc

all: problem1
	

problem1: problem1.asm
	$(ASM) -g -f elf64 problem1.asm
	$(CC) -o build/$@ problem1.o

clean:
	rm *.o