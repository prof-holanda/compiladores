include ../Makefile

LDFLAGS += -lm -lfl

calc.tab.h calc.tab.c: calc.y
	$(BISON) -d $<

calc.lex.c: calc.l calc.tab.h
	$(FLEX) -o$@ $<

# flex+bison only binary
calc: calc.tab.c calc.lex.c
	$(CC) $^ $(CFLAGS) -o $@ $(LDFLAGS)

