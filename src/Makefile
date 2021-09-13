ifeq ($(OS),Windows_NT)
	FLEX := win_flex
	CC := gcc
	BIN_EXT = .exe
	DEV_NULL := 2> $$null
	RM = del
else
	DEV_NULL := 2>/dev/null
	FLEX := FLEX
	BIN_EXT := ""
endif

%.yy.c: %.l
	$(FLEX) -o $@ $<

%$(BIN_EXT): %.yy.c
	$(CC) $< $(CFLAGS) -o $@ $(LDFLAGS)

clean:
	$(RM) *.exe $(DEV_NULL)
	$(RM) *.yy.c $(DEV_NULL)
	$(RM) *~ $(DEV_NULL)
	$(RM) $$null

.PHONY: clean
