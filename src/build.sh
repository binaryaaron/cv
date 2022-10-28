# prerequsites
# helpful gist https://gist.github.com/peterhurford/75957ba9335e755013b87254ec85fab1

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
brew tap homebrew/cask-fonts
brew_cask_install font-hack

sudo tlmgr update --self
sudo tlmgr install texliveonfly 
sudo tlmgr install xelatex
sudo tlmgr install adjustbox
sudo tlmgr install tcolorbox
sudo tlmgr install collectbox
sudo tlmgr install ucs
sudo tlmgr install environ
sudo tlmgr install trimspaces
sudo tlmgr install titling
sudo tlmgr install enumitem
sudo tlmgr install rsfs
sudo tlmgr install biblatex
sudo tlmgr install biber


