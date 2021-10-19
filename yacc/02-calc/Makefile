include ../Makefile

LDFLAGS += -lfl

y.tab.h y.tab.c: calc.y
	$(BISON) -d $<

lex.yy.c: calc.l y.tab.h
	$(FLEX) -o$@ $<

# flex+bison only binary
calc: calc.tab.c lex.yy.c
	$(CC) $^ $(CFLAGS) -o $@ $(LDFLAGS)

