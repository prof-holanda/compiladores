flex calc.l
bison -d calc.y
gcc -o calc.exe lex.yy.c calc.tab.c
rm lex.yy.c 
rm calc.tab.c
rm calc.tab.h
