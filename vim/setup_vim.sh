#!/usr/bin/env bash

############################  SETUP PARAMETERS
app_name='welkinspring-dotfiles'
[ -z "$APP_PATH" ] && APP_PATH="$PWD"
[ -z "$REPO_URL" ] && REPO_URL='https://github.com/welkinspring/dotfiles.git'
[ -z "$REPO_BRANCH" ] && REPO_BRANCH='master'
debug_mode='1'
update_setting='0'
# this is vim plugins manager tool which is tiny and agile
[ -z "$PLUG_URL" ] && PLUG_URL="https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"

############################  BASIC SETUP TOOLS
msg() {
    printf '%b\n' "$1" >&2
}

success() {
    if [ "$ret" -eq '0' ]; then
        msg "\33[32m[✔]\33[0m ${1}${2}"
    fi
}

error() {
    msg "\33[31m[✘]\33[0m ${1}${2}"
    exit 1
}

debug() {
    if [ "$debug_mode" -eq '1' ] && [ "$ret" -gt '1' ]; then
        msg "An error occurred in function \"${FUNCNAME[$i+1]}\" on line ${BASH_LINENO[$i+1]}, we're sorry for that."
    fi
}

program_exists() {
    local ret='0'
    command -v $1 >/dev/null 2>&1 || { local ret='1'; }
    # fail on non-zero return value
    if [ "$ret" -ne 0 ]; then
        return 1
    fi
    return 0
}

program_must_exist() {
    program_exists $1
    # throw error on non-zero return value
    if [ "$?" -ne 0 ]; then
        error "you must have '$1' installed to continue."
    fi
}

variable_set() {
    if [ -z "$1" ]; then
        error "you must have your HOME environmental variable set to continue."
    fi
}

lnif() {
    if [ -e "$1" ] ; then
        ln -sf "$1" "$2"
    fi
    ret="$?"
    debug
}

############################ SETUP FUNCTIONS
create_symlinks() {
    local source_path="$1"
    local target_path="$2"
    lnif "$source_path/vimrc" 		"$target_path/.vimrc"
    lnif "$source_path/vimrc.plugins" 	"$target_path/.vim_dotfiles/.vimrc.plugs"

    ret="$?"
    success "setting up vim symlinks."
    debug
}

setup_plug() {
    local system_shell="$SHELL"
    export SHELL='/bin/sh'
    msg "starting update/install plugins for $1"
    "$1" +PlugClean +PlugInstall +qall
    export SHELL="$system_shell"
    success "successfully updated/installed plugins using vim-plug for $1"
    debug
}

install_vim_plug() {
    curl -fLo "$1/plug.vim" --create-dirs "$2"
    success "successfully installed/updated $3 for $4"
    debug
}

############################ MAIN()
variable_set "$HOME"
program_must_exist "git"
program_must_exist "curl"
mkdir -p "$HOME/.vim_dotfiles/session"

read -p "do you want to update vimrc and vim-plug (Y for Yes , any other key for No)? " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    update_setting='1'
fi
ret=0
if [ "$update_setting" -eq '1' ]; then
    cd ..; git pull
    success "update to the latest version of welkinspring-dotfiles"
fi

if [ -f $HOME/.vim_dotfiles/.vimrc.local ]; then
    success "$HOME/.vim_dotfiles/.vimrc.local exists."
else
    cp $APP_PATH/vimrc.local $HOME/.vim_dotfiles/.vimrc.local
    success "$HOME/.vim_dotfiles/.vimrc.local does not exist, created it."
fi

create_symlinks "$APP_PATH" "$HOME"

if program_exists "vim"; then
    if [ "$update_setting" -eq '1' ]; then
        install_vim_plug "$HOME/.vim_plugins/autoload" "$PLUG_URL" "vim-plug" "vim"
    fi
    setup_plug "vim"
fi

msg "\nthanks for installing welkinspring's dotfiles"
msg "`date +%Y` https://github.com/welkinspring/dotfiles.git"
