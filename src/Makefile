ifeq ($(OS),Windows_NT)
	FLEX := win_flex
	BISON := win_bison
	CC := gcc
	BIN_EXT = .exe
	DEV_NULL := 2> $$null
	RM = del
else
	FLEX := FLEX
	BISON := bison
	BIN_EXT := ""
	DEV_NULL := 2>/dev/null	
endif

# flex
%.yy.c: %.l
	$(FLEX) -o $@ $<

# bison
%.tab.c: %.y
	$(BISON) -d $< -o $@

# flex+bison only binary
fb%$(BIN_EXT): fb%.tab.c fb%.yy.c lexyacc.c
	$(CC) $^ $(CFLAGS) -o $@ $(LDFLAGS)

# flex only binary
f%$(BIN_EXT): f%.yy.c 
	$(CC) $< $(CFLAGS) -o $@ $(LDFLAGS)

clean:
	$(RM) *.exe $(DEV_NULL)
	$(RM) *.yy.c $(DEV_NULL)
	$(RM) *~ $(DEV_NULL)
	$(RM) $$null

.PHONY: clean
