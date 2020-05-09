#!/bin/bash
set -e
set -x

function install_file {
    (mv -f $2 /tmp 2>/dev/null) || true
    ln -s $(realpath $1) $2
}

# NeoVim
mkdir -p ~/.config/nvim

install_file init.vim ~/.config/nvim/init.vim
install_file coc-settings.json ~/.config/nvim/coc-settings.json

vim +PlugInstall +qall
vim +CocInstall coc-python coc-tsserver coc-eslint coc-json coc-css coc-vetur coc-rls +qall

# zsh
command -v autojump >/dev/null || sudo apt install autojump
[ -e ~/.oh-my-zsh ] || sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
install_file .zshrc ~/.zshrc
install_file helgefmi.zsh-theme ~/.oh-my-zsh/custom/helgefmi.zsh-theme

# other
install_file .tmux.conf ~/.tmux.conf
install_file .screenrc ~/.screenrc
install_file .flake8 ~/.flake8
