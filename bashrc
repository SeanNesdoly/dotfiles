#!/bin/bash
#
# ~/.bashrc: executed by bash(1) for non-login shells.
#
# Sean Nesdoly
# 2017-08-15

# Prevent file clobbering
set -o noclobber

# Complete after man
complete -cf man

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;

# Line wrap on window resize
shopt -s checkwinsize

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# Colour definitions for shell text
C_LIGHTPURPLE="\[\033[1;35m\]"
C_LIGHTBLUE="\[\033[1;34m\]"
C_DEFAULT="\[\033[m\]"
C_LIGHTGREEN="\[\033[1;32m\]"

# Setting the prompt. Default prompt: \h:\W \u\$
export PS1="$C_LIGHTGREEN\t$C_DEFAULT:$C_LIGHTPURPLE\u@$C_LIGHTBLUE\W$C_DEFAULT\$ "

# Set private environment variables
if [ -r ~/.private ]
then
    source ~/.private
fi

# Configure 'pyenv' for the Bash shell
if command -v $HOME/.pyenv/bin/pyenv > /dev/null; then
    eval "$(pyenv init -)"
fi
