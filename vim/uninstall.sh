#!/usr/bin/env sh


warn() {
    echo "$1" >&2
}

die() {
    warn "$1"
    exit 1
}

rm $HOME/.vimrc
rm $HOME/.vim_dotfiles/.vimrc.local
rm $HOME/.vim_dotfiles/vimrc.plugs

rm -rf $HOME/.vim
