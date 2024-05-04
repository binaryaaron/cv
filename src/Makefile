SHELL=/bin/bash
SRC_BASE_NAME=agonzales_resume
CV_BASE_NAME=agonzales_cv


resume: $(SRC_BASE_NAME).tex clean
	lualatex $(SRC_BASE_NAME) | texlogfilter
	biber $(SRC_BASE_NAME)
	lualatex $(SRC_BASE_NAME) | texlogfilter
	lualatex $(SRC_BASE_NAME) | texlogfilter

all:
	clean
	resume

build_env: build.sh
	bash build.sh

clean:
	for ext in dvi ps pdf out aux log idx ind ilg toc bbl blg bcf run.xml; \
		do rm -f "$(SRC_BASE_NAME).$$ext";                                 \
		rm -f "$(CV_BASE_NAME).$$ext";                                 \
	done

deploy: resume
	cp $(SRC_BASE_NAME).pdf ~/Dropbox/resume/

