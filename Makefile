ifeq ($(OS),Windows_NT)
	RM := del
	DEV_NULL := 2> $$null
else
	DEV_NULL := 2>/dev/null
endif

TEX_FLAGS := --pdf-engine xelatex

# LaTeX and beamer LaTeX must be installed
exercicios.pdf: exercicios.md
	pandoc -t pdf $(TEX_FLAGS) -s $< -o $@

%.pdf: %.md
	pandoc -t beamer $(TEX_FLAGS) -s $< -o $@

# Here engine may be s5, slidy, slideous, dzslides, or revealjs.
# But all these framworks must be installed.
ENGINE := slidy
%.html: %.md
	pandoc -s -t $(ENGINE) -s $< -o $@

clean:
	$(RM) *.html $(DEV_NULL)
	$(RM) *.pdf $(DEV_NULL)
	$(RM) $$null

.PHONY: clean