SRC = $(wildcard *.tex)

PDFS = $(SRC:.tex=.pdf)

all: clean pdf

en: clean_en
	mkdir -p build
	xelatex -output-directory=build resume_en.tex

zh_CN: clean_zh_CN
	mkdir -p build
	xelatex -output-directory=build resume.tex 

	# UNCOMMENT the 2 lines below if you want to use bibliographic references
	# bibtex build/resume-zh_CN
	# xelatex -output-directory=build resume-zh_CN.tex 

	xelatex -output-directory=build resume.tex 

pdf: clean $(PDFS)

%.pdf:  %.tex
	xelatex $<

ifeq ($(OS),Windows_NT)
	# on Windows
	RM = cmd //C del
else
	# on Unix/Linux
	RM = rm -f
endif

clean:
	# $(RM) *.log *.aux *.bbl *.blg *.synctex.gz *.out *.toc *.lof *.idx *.ilg *.ind *.pdf
	$(RM) build/*

clean_en:
	$(RM) resume_en.pdf

clean_zh_CN:
	$(RM) resume.pdf
