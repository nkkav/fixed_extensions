CC = gcc
CFLAGS = -Wall -Wextra -pedantic -O2
EXE = .exe

all: gentestround

gentestround: gentestround.o
	$(CC) gentestround.o -o gentestround

tidy:
	rm -f *.o

clean:
	rm -f *.o gentestround$(EXE)
