#    NeoZshRC v1.00
#    Copyright (C) 2017 Neo_Chen

declare OS="OTHER"

# Platform Specific
case $OSTYPE in
	*bsd*) OS="BSD";;
	linux*) OS="LINUX";;
esac

declare -i NJOBS=1

if [ "$OS" = "LINUX" ]; then
	export NJOBS=`nproc`
fi

setopt no_global_rcs
setopt inc_append_history
setopt share_history
setopt transient_rprompt
setopt hist_ignore_space
setopt auto_cd

HISTFILE="$HOME/.histfile"
HISTSIZE=65536
SAVEHIST=65536
typeset -A key
bindkey -e
autoload -U colors && colors
autoload -U run-help
autoload run-help-git
autoload run-help-svn
autoload run-help-svk
autoload zmv

umask 037
mesg y # 打開talk聊天支援

# Load Host Specific RC
host_specific()
{
	local rc="$HOME/.zsh.d/host.$(hostname -s).rc"
	if [ -e "$rc" ]; then
		source "$rc"
	fi
}

# 載入zsh.d裡的所有鬼東東
for i in ~/.zsh.d/??-* ;do
source $i
done

# Plugins
try-source zsh-navigation-tools
try-source fast-syntax-highlighting
