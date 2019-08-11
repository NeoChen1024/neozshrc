#    NeoZshRC v1.00
#    Copyright (C) 2017 Neo_Chen

declare OS="OTHER"
declare -i NJOBS=1
setopt no_global_rcs
setopt inc_append_history
setopt share_history
setopt transient_rprompt
setopt hist_ignore_space

HISTFILE=~/.histfile
HISTSIZE=4096
SAVEHIST=4096
typeset -A key
bindkey -e
autoload -U colors && colors
autoload -U run-help
autoload run-help-git
autoload run-help-svn
autoload run-help-svk
autoload zmv
alias help=run-help

umask 037
mesg y # 打開talk聊天支援

# Platform Specific
case $OSTYPE in
	*bsd*) OS="BSD";;
	linux*) OS="LINUX";;
esac

# 載入zsh.d裡的所有鬼東東
for i in ~/.zsh.d/??-* ;do
source $i
done

# Plugins
try-source zsh-navigation-tools
try-source fast-syntax-highlighting
