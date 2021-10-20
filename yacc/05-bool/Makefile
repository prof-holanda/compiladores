CC := gcc
YACC := bison
LEX := flex
CFLAGS := -Wall -g
LDFLAGS += 
PROJ := bool

$(PROJ).tab.h $(PROJ).tab.c: $(PROJ).y
	$(YACC) -d $<

lex.yy.c: $(PROJ).l $(PROJ).tab.h
	$(LEX) $<

# flex+bison only binary
$(PROJ): $(PROJ).tab.c lex.yy.c
	$(CC) $< $(CFLAGS) -o $@ $(LDFLAGS)

