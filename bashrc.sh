#!/bin/bash

# customize bash prompt
__git_ps1()
{ 
    local b="$(git symbolic-ref HEAD 2>/dev/null)";
    if [ -n "$b" ]; then
        printf "$1" "${b##refs/heads/}";
    fi
}
export PS1='\[\e[0;95m\]In \w:\n\[\e[0;37m\]\D{%a %b %e %r}\[\e[0m\] \[\e[0;96m\]\u\[\e[0;91m\]@\h\[\e[0m\] \[\e[1;95m\]\W\[\e[0m\] $(__git_ps1 "(\[\e[1;33m\]%s\[\e[m\])") \[\e[1;33m\]\$\[\e[0m\] '
# What this looks like (ignoring colors):
#   In ~/code/faust:
#   Mon Aug 19 07:59:54 PM chris.rebert@devbox faust (master) $

# colorize `ls` (and other cmd) output
export CLICOLOR=YES
# suppress dupe history entries
export HISTCONTROL=erasedups
# preserve shell history
shopt -s histappend
# set history length
export HISTFILESIZE=10000

# have `cd` keep history and auto-ls
cd()
{
    if [ -z "${1}" ]; then
        set -- "$HOME" # defaulting
    fi
    pushd "${1}" > /dev/null && ls
}

# view manpages as PDFs in Preview
pan()
{
    man -t "${1}" | open -f -a /Applications/Preview.app
}

# concat multiple PDFs together
# usage: pdfjoin -o out.pdf file1.pdf file2.pdf
alias pdfjoin='/System/Library/Automator/Combine\ PDF\ Pages.action/Contents/Resources/join.py'

# for virtualenvwrapper
export WORKON_HOME=$HOME/venvs
export PROJECT_HOME=$HOME/code
source /usr/local/bin/virtualenvwrapper.sh
# for Go
export PATH=$PATH:/usr/local/opt/go/libexec/bin
