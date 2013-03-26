ASM=nasm
CC=gcc
EXEC=probleme

all: probleme
	$(CC) -o $^ $^.o

probleme: probleme.asm
	$(ASM) -g -f elf64 $@.asm

clean:
	rm *.o
	rm problem2

mrproper: clean
	rm $(EXEC)