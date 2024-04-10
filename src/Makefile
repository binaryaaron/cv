SHELL=/bin/bash
SRC_BASE_NAME=resume_tagged
CV_BASE_NAME=agonzales_cv

basic: agonzales_resume.tex
	xelatex -shell-escape -output-driver="xdvipdfmx -z 0" '\input{agonzales_resume.tex}'

resume:
	xelatex -shell-escape -output-driver="xdvipdfmx -z 0" '\input{$(SRC_BASE_NAME)}'
	biber $(SRC_BASE_NAME)
	xelatex -shell-escape -output-driver="xdvipdfmx -z 0" '\input{agonzales_resume.tex}'
	xelatex -shell-escape -output-driver="xdvipdfmx -z 0" '\input{agonzales_resume.tex}'

new-resume: $(SRC_BASE_NAME).tex clean
	lualatex $(SRC_BASE_NAME) | texlogfilter
	biber $(SRC_BASE_NAME)
	lualatex $(SRC_BASE_NAME) | texlogfilter
	lualatex $(SRC_BASE_NAME) | texlogfilter

all:
	cv
	resume

build_env: build.sh
	bash build.sh

clean:
	for ext in dvi ps pdf out aux log idx ind ilg toc bbl blg bcf run.xml; \
		do rm -f "$(SRC_BASE_NAME).$$ext";                                 \
		rm -f "$(CV_BASE_NAME).$$ext";                                 \
	done
