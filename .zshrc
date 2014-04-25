#
# .zshrc
#
#     written by t-nakaym 2009/04/29
#

# Set up environment variables
if [ `uname -s` = "FreeBSD" ]; then
    export LANG=ja_JP.eucJP
    export LC_ALL=ja_JP.eucJP
else
    export LANG=ja_JP.UTF-8
    export LC_ALL=ja_JP.UTF-8
fi
export PATH=${HOME}/local/bin:$PATH:/sbin:/usr/sbin:$HOME/bin
export MANPATH=$X11HOME/man:/usr/man:/usr/lang/man:/usr/local/man:/usr/share/man
export MAIL=/var/spool/mail/$USERNAME
export EDITOR=vim
export PAGER='lv -c'
export LESS=-cx3M
export HELPDIR=/usr/local/lib/zsh/help  # directory for run-help function to find docs

# Use hard limits, except for a smaller stack and no core dumps
unlimit
limit stack 8192
limit core 0
limit -s

umask 022

# Set up aliases
alias mv='nocorrect mv'       # no spelling correction on mv
alias cp='nocorrect cp'       # no spelling correction on cp
alias mkdir='nocorrect mkdir' # no spelling correction on mkdir
alias j=jobs
alias pu=pushd
alias po=popd
alias d='dirs -v'
alias h=history
alias grep=egrep
alias vi=vim
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lld='ls -ld'
alias llh='ls -lh'
alias lsd='ls -ld *(-/DN)'
alias lsa='ls -ld .*'
alias sl='sl -e'
alias rm='rm -i'
alias -g L='| less'
alias -g G='| grep'
alias -g H='| head'
alias -g T='| tail'
alias -g N='| nkf'
if [ x"$TERM" = "xdumb" -o x"$TERM" = "xemacs" ]; then
    alias ls='ls -F'
elif ls --color=auto > /dev/null 2>&1; then
    alias ls='ls -F --color=auto --show-control-char'
    if [ -f "$HOME/.dircolors" ]; then
        eval `dircolors -b "$HOME/.dircolors"`
    fi
elif [ -x /usr/local/bin/gnuls ]; then
    alias ls='/usr/local/bin/gnuls -F --color=auto --show-control-char'
    if [ -f "$HOME/.dircolors" ]; then
        eval `dircolors -b "$HOME/.dircolors"`
    fi
else
    alias ls='ls -F'
fi
if where lv > /dev/null 2>&1; then
    alias less='lv -c'
elif where jless > /dev/null 2>&1; then
    alias less=jless
fi
if [ -f "$HOME/.ssh/nopass-dsa" ]; then
    alias ssh='ssh -i "$HOME/.ssh/nopass-dsa"'
    alias scp='scp -i "$HOME/.ssh/nopass-dsa"'
fi
where jman > /dev/null 2>&1; [ $? -eq 0 ] && alias man=jman
where pgrep > /dev/null 2>&1; [ $? -eq 0 ] && alias pgrep='pgrep -l'

# shell functions
setenv() { typeset -x "${1}${1:+=}${(@)argv[2,$#]}" }  # csh compatibility
freload() { while (( $# )); do; unfunction $1; autoload -U $1; shift; done }

fpath=($fpath ~/.zfunc)
for func in $^fpath/*(N-.x:t); autoload $func

typeset -U path cdpath fpath manpath

# Command history settings
HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=50000
setopt hist_ignore_dups # ignore duplication command history list
setopt share_history    # share command history data

# Set prompts
PROMPT='[%n@%m(%T)] '
RPROMPT=' %~'           # prompt for right side of screen

# Watch for my friends
#watch=( $(<~/.friends) )       # watch for people in .friends file
watch=(notme)                   # watch for everybody but me
LOGCHECK=300                    # check every 5 min for login/logout activity
WATCHFMT='%n %a %l from %m at %t.'

# Set/unset  shell options
setopt   notify globdots correct pushdtohome cdablevars autolist
setopt   correctall autocd recexact longlistjobs
setopt   autoresume histignoredups pushdsilent clobber #noclobber
setopt   autopushd pushdminus extendedglob rcquotes mailwarning
unsetopt bgnice autoparamslash
setopt   ignoreeof always_last_prompt

# Autoload zsh modules when they are referenced
zmodload -a zsh/stat stat
zmodload -a zsh/zpty zpty
zmodload -a zsh/zprof zprof
zmodload -ap zsh/mapfile mapfile

# key bindings
bindkey -e                 # emacs key bindings
bindkey ' ' magic-space    # also do history expansion on space
bindkey '^I' complete-word # complete on tab, leave expansion to _expand

# for color names
autoload -U colors
colors

# Setup new style completion system. To see examples of the old style (compctl
# based) programmable completion, check Misc/compctl-examples in the zsh
# distribution.
autoload -U compinit
compinit

# Completion Styles

# list of completers to use
zstyle ':completion:*::::' completer _expand _complete _ignored _approximate

# allow one error for every three characters typed in approximate completer
zstyle -e ':completion:*:approximate:*' max-errors \
    'reply=( $(( ($#PREFIX+$#SUFFIX)/3 )) numeric )'

# insert all expansions for expand completer
zstyle ':completion:*:expand:*' tag-order all-expansions

# formatting and messages
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
zstyle ':completion:*' group-name ''

# match uppercase from lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# offer indexes before parameters in subscripts
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters

# command for process lists, the local web server details and host completion
#zstyle ':completion:*:processes' command 'ps -o pid,s,nice,stime,args'
#zstyle ':completion:*:urls' local 'www' '/var/www/htdocs' 'public_html'
zstyle '*' hosts $hosts

# Filename suffixes to ignore during completion (except after rm command)
zstyle ':completion:*:*:(^rm):*:*files' ignored-patterns '*?.o' '*?.c~' \
    '*?.old' '*?.pro'
# the same for old style completion
#fignore=(.o .c~ .old .pro)

# ignore completion functions (until the _ignored completer)
zstyle ':completion:*:functions' ignored-patterns '_*'

# dynamic modification of screen title
if [ "$TERM" = "screen" ]; then
    if [ `uname -s` = "Linux" ]; then
        ECHO_OPTION="-ne"
        HOSTNAME_OPTION=""
    elif [ `uname -s` = "FreeBSD" ]; then
        ECHO_OPTION="-n"
        HOSTNAME_OPTION="-s"
    else
        ECHO_OPTION="-n"
        HOSTNAME_OPTION=""
    fi

    preexec(){
        echo $ECHO_OPTION "\033k${1}\033\\"
    }

    cur_prompt=$PROMPT
    precmd(){
        sname=`basename "$SHELL"`
        hname=`hostname $HOSTNAME_OPTION`
        echo $ECHO_OPTION "\033k${sname}@${hname}\033\\"
        PROMPT="%{%(?..$fg[red])%}$cur_prompt%{%(?..$reset_color)%}"
    }
fi

# settings for rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# settings for nvm
[ -s "$HOME/.nvm/nvm.sh" ] && . "$HOME/.nvm/nvm.sh"

# read environment dependent settings
[ `uname -s` = "FreeBSD" -a -f "$HOME/.zshrc.freebsd" ] && source "$HOME/.zshrc.freebsd"
[ `uname -s` = "Linux" -a -f "$HOME/.zshrc.linux" ] && source "$HOME/.zshrc.linux"
[ -f "$HOME/.zshrc.local" ] && source "$HOME/.zshrc.local"

echo ".zshrc: finished read .zshrc"
