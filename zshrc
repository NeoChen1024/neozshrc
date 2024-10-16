#    NeoZshRC v1.00
#    Copyright (C) 2017 Neo_Chen

declare OS="OTHER"

# Platform Specific
case "$(uname)" in
	*BSD) OS="BSD";;
	Linux) OS="LINUX";;
esac

declare -i NJOBS=1

if which nproc 2>&1 > /dev/null; then
	NJOBS="$(nproc)"
fi

setopt no_global_rcs
setopt inc_append_history
setopt share_history
setopt transient_rprompt
setopt hist_ignore_space
unsetopt completealiases

HISTFILE="$HOME/.histfile"
fpath=($HOME/.zsh.d/fp $fpath)
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
try-source F-Sy-H
