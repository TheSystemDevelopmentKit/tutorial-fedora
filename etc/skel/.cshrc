#setenv TZ EET-2EEST,M3.5.0/3,M10.5.0/4
setenv PATH ${PATH}:${HOME}/bin
setenv EDITOR /usr/bin/gvim 
# This disables GTK-related warnings when run on terminal
setenv NO_AT_BRIDGE 1


#SSH-agent
#if ( ! $?SSH_AUTH_SOCK ) then
    #    eval `ssh-agent -c -t 900`
    #        ssh-add
    #    endif
#endif
#Aliases
alias rm 'rm -i'
alias grepps 'ps -fu `whoami` | grep \!* | grep -v grep' '| awk' "'{print" '$2' "}'" '| xargs'
alias hupps  'kill -HUP `grepps \!*`' 
alias ssh 'ssh -X'
alias h 'history'
#alias xterm 'xterm -maximize -e screen'

alias vim 'vimx'
alias assh 'eval `ssh-agent -c` && ssh-add'


# Local installations to the path 
setenv PATH ${PATH}:${HOME}/.local/bin
setenv PATH ${PATH}:${HOME}/.local/share/coursier/bin

set autolist
set nobeep

#Get vim keybindings for bash
#bindkey -v

