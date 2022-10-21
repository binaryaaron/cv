# prerequsites

brew_cask_install() {
    echo "\nInstalling $1"
    if brew list $1 &>/dev/null; then
        echo "${1} is already installed"
    else
        brew install --cask $1 && echo "$1 is installed"
    fi
}
brew_install() {
    echo "\nInstalling $1"
    if brew list $1 &>/dev/null; then
        echo "${1} is already installed"
    else
        brew install $1 && echo "$1 is installed"
    fi
}

brew_cask_install basictex
brew_install biber
sudo tlmgr update --self
sudo tlmgr install texliveonfly 


sudo texliveonfly -c xelatex agonzales_resume.tex
biber agonzales_resume.bib
sudo texliveonfly -c xelatex agonzales_resume.tex
