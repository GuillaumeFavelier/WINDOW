LD=-nostdlib -lSDL -lc -lGL -lGLU
EXE=main

MAIN: clear MAIN.o
	gcc main.o -o $(EXE) $(LD)
	strip $(EXE)

MAIN.o:
	nasm -f elf64 -o main.o main.asm

clear:
	clear screen

clean:
	@rm *.o
	@echo "Nettoyage terminé"

cleanall: clean
	@rm $(EXE)
	@rm *~
	@echo "Nettoyage additionnel terminé"
