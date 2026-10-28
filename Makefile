# paper.tex -> paper.pdf, supplement.tex -> supplement.pdf, cover_letter.tex -> cover_letter.pdf
#
#   make            the manuscript
#   make supplement the supplementary material
#   make cover      the cover letter on its own
#   make clean      remove the intermediate files
#
# Uses tectonic when it is installed (it fetches missing packages itself),
# otherwise latexmk with XeLaTeX and BibTeX.

ifneq ($(shell command -v tectonic 2>/dev/null),)
TEX = tectonic --keep-logs
else ifneq ($(shell command -v latexmk 2>/dev/null),)
TEX = latexmk -xelatex -interaction=nonstopmode -halt-on-error
else
TEX = $(error needs tectonic or latexmk)
endif

.PHONY: all supplement cover clean
.DELETE_ON_ERROR:

all: paper.pdf

supplement: supplement.pdf

cover: cover_letter.pdf

paper.pdf: paper.tex refs.bib cover_text.tex cas-sc.cls cas-common.sty cas-model2-names.bst $(wildcard figures/*)
	$(TEX) paper.tex

supplement.pdf: supplement.tex $(wildcard figures/supp/*)
	$(TEX) supplement.tex

cover_letter.pdf: cover_letter.tex cover_text.tex
	$(TEX) cover_letter.tex

clean:
	rm -f *.aux *.bbl *.blg *.log *.out *.fls *.fdb_latexmk *.xdv *.fff *.lof *.ttt
