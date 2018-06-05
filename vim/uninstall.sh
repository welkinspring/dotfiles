#!/usr/bin/env sh

warn() {
    echo "$1" >&2
}

die() {
    warn "$1"
    exit 1
}

unlink .vimrc

rm $HOME/.vimrc
rm -rf $HOME/.vim
