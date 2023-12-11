SHELL=/bin/bash
SRC_BASE_NAME=agonzales_resume
CV_BASE_NAME=agonzales_cv

basic: agonzales_resume.tex
	xelatex agonzales_resume.tex

resume:
	xelatex '\input{agonzales_resume.tex}'
	biber agonzales_resume
	xelatex '\input{agonzales_resume.tex}'
	xelatex '\input{agonzales_resume.tex}'

cv:
# sets variable docmode which activates flag in doc content
	xelatex '\def\docmode{c} \input{agonzales_resume.tex}'
	biber agonzales_resume
	xelatex '\def\docmode{c} \input{agonzales_resume.tex}'
	xelatex '\def\docmode{c} \input{agonzales_resume.tex}'
	mv agonzales_resume.pdf agonzales_cv.pdf

all:
	cv
	resume

build_env: build.sh
	bash build.sh
# sudo texliveonfly -c xelatex agonzales_resume.tex
# biber agonzales_resume
# sudo texliveonfly -c xelatex agonzales_resume.tex


clean:
	for ext in dvi ps pdf out aux log idx ind ilg toc bbl blg bcf run.xml; \
		do rm -f "$(SRC_BASE_NAME).$$ext";                                 \
		rm -f "$(CV_BASE_NAME).$$ext";                                 \
	done
    