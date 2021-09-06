# LaTeX and beamer LaTeX must be installed
FORMAT := beamer
slides.pdf: slides.md
	pandoc -t $(FORMAT) -s $< -o $@

# Here format may be s5, slidy, slideous, dzslides, or revealjs.
# But all these framworks must be installed.
FORMAT := revealjs
slides.html: slides.md
	pandoc -t $(FORMAT) -s $< -o $@
