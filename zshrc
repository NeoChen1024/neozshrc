#    NeoZshRC v1.00
#    Copyright (C) 2017 Neo_Chen
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program. If not, see <http://www.gnu.org/licenses/>.

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
alias help=run-help
umask 033
mesg y # 打開talk聊天支援
# 載入zsh.d裡的所有鬼東東
for i in ~/.zsh.d/??-* ;do
source $i
done
# Plugins
source /usr/local/share/zsh-navigation-tools/zsh-navigation-tools.plugin.zsh
source ~/.local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
