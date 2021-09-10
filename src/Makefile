ifeq ($(OS),Windows_NT)
	FLEX := win_flex
	CC := gcc
	BIN_EXT = .exe
else
	FLEX := FLEX
	BIN_EXT := ""
endif

%.yy.c: %.l
	$(FLEX) -o $@ $<

%$(BIN_EXT): %.yy.c
	$(CC) $< $(CFLAGS) -o $@ $(LDFLAGS)

clean:
	$(RM) *.exe *.yy.c

.PHONY: clean
