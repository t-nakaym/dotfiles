#
# .bashrc
#
#     written by t-nakaym 2009/04/29
#

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# use zsh if exists
which zsh 2>&1 > /dev/null
if [ $? -eq 0 ]; then
    echo ".bashrc: using zsh as login shell"
    export SHELL=`which zsh`
    export KICKED_BY_BASH=yes
    exec zsh -l
fi

echo ".bashrc: No usable zsh. Use bash instead"
source "$HOME/.bashrc.orig"
