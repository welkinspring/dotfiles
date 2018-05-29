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
