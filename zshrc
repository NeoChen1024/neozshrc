# Created by newuser for 5.2
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=16384
SAVEHIST=16384
typeset -A key
unset GLOBAL_RCS
bindkey -e
autoload -U colors && colors
autoload -U run-help
autoload run-help-git
autoload run-help-svn
autoload run-help-svk
alias help=run-help

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

mesg y

for i in `ls ~/.zsh.d` ;do
source ~/.zsh.d/$i
done
