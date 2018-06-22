#!/usr/bin/env sh

app_dir="$HOME/work-dotfiles"

warn() {
    echo "$1" >&2
}

die() {
    warn "$1"
    exit 1
}

rm -rf $HOME/.vim*
rm -rf $app_dir
