#!/bin/bash
# prerequsites
# helpful gist https://gist.github.com/peterhurford/75957ba9335e755013b87254ec85fab1

brew_cask_install() {
    printf "\nInstalling %s" "$1"
    if brew list "$1" &>/dev/null; then
        echo "${1} is already installed"
    else
        brew install --cask "$1" && echo "$1 is installed"
    fi
}
brew_install() {
    printf "\n Installing %s" "$1"
    if brew list "$1" &>/dev/null; then
        echo "${1} is already installed"
    else
        brew install "$1" && echo "$1 is installed"
    fi
}

brew_cask_install basictex
eval "$(/usr/libexec/path_helper)"
# Update $PATH to include `/usr/local/texlive/2022basic/bin/universal-darwin`
brew_install biber
brew tap homebrew/cask-fonts
brew_cask_install font-hack

sudo tlmgr update --self
sudo tlmgr install texliveonfly  \
xelatex \
adjustbox \
tcolorbox \
collectbox \
ucs \
environ \
trimspaces \
titling \
enumitem \
rsfs \
biblatex \
biber \
chktex \
latexindent \
marvosym \
biblatex-ieee \
lastpage \
xurl
