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

# @TODO: Add tab completion for SSH hostnames in ~/.ssh/config, ignoring wildcards
# [ -e "$HOME/.ssh/config" ] && \
#     complete -o "default" -o "nospace" -W \
#     "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" \
#     scp sftp ssh;

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
[ -r ~/.private ] && source ~/.private

# Configure 'pyenv' for the Bash shell
if command -v "$HOME"/.pyenv/bin/pyenv > /dev/null; then
    eval "$(pyenv init -)"
fi

# github.com/junegunn/fzf: command-line fuzzy finder.
# Run "$(brew --prefix fzf)"/install to create ~/.fzf.* scripts.
if command -v fzf > /dev/null && [ -f ~/.fzf.bash ]; then
    # shellcheck source=../.fzf.bash
    source "$HOME"/.fzf.bash

    # Set fd (https://github.com/sharkdp/fd) as the default source for fzf
    if command -v fd > /dev/null; then
        export FZF_DEFAULT_COMMAND='fd --type f'

        # Use fd for CTRL-T as well
        export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    fi
fi
