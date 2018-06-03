apt install zsh
chsh -s /bin/zsh root # now logout from the root user, log in again, and you will get the zsh shell.
echo $SHELL

apt install wget git
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
source ~/.zshrc

vim ~/.zshrc # pick one zsh theme - let's say 'risto' theme.

# then change the 'ZSH_THEME' line 10 with 'risto' theme as below.
# ZSH_THEME='risto'
source ~/.zshrc

# go to the 'plugins' line and add some plugins that you want to enable inside the bracket(). For example, here's the change I made in my case:
plugins=(git extract web-search yum git-extras docker vagrant)

# go to ~/.oh-my-zsh/themes/risto.zsh-theme add the following configuration.
# private configuration, refer:http://www.drbunsen.org/the-text-triumvirate/
function virtualenv_info {
	[ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}

function box_name {
		[ -f ~/.box-name ] && cat ~/.box-name || hostname -s
}

PROMPT='
%{$fg[magenta]%}%n%{$reset_color%} at %{$fg[yellow]%}$(box_name)%{$reset_color%} in %{$
fg_bold[green]%}${PWD/#$HOME/~}%{$reset_color%}$(git_prompt_info)
$(virtualenv_info)%(?,,%{${fg_bold[blue]}%}[%?]%{$reset_color%} )$ '

ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}?"
ZSH_THEME_GIT_PROMPT_CLEAN=""

local return_status="%{$fg[red]%}%(?..⤬)%{$reset_color%}"
RPROMPT='${return_status}%{$reset_color%}'

# others stuff
