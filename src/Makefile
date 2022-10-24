SHELL=/bin/bash
SRC_BASE_NAME=agonzales_resume

basic: agonzales_resume.tex
	xelatex agonzales_resume.tex


complete:
	xelatex agonzales_resume.tex
	xelatex agonzales_resume.tex

resume:
	xelatex '\input{agonzales_resume.tex}'
	biber agonzales_resume
	xelatex '\input{agonzales_resume.tex}'

cv:
	xelatex '\def\docmode{c} \input{agonzales_resume.tex}'
	biber agonzales_resume
	xelatex '\def\docmode{c} \input{agonzales_resume.tex}'
	mv agonzales_resume.pdf agonzales_cv.pdf

build_env: build.sh agonzales_resume.tex
	build.sh
	sudo texliveonfly -c xelatex agonzales_resume.tex

clean:
	for ext in dvi ps pdf out aux log idx ind ilg toc bbl blg bcf run.xml; \
		do rm -f "$(SRC_BASE_NAME).$$ext";                                 \
	done
    