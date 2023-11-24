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
set -o vi             # Use vi mode with Readline

# Line wrap on window resize
shopt -s checkwinsize

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# Colour codes for shell text with proper ANSI escape codes.
# Format="\033[38;5;nm" (https://en.wikipedia.org/wiki/ANSI_escape_code#8-bit)
#   \033[  = Control Sequence Introducer
#   38;5;  = Prefix denoting support for 256-colour lookup tables
#   n      = Foreground colour code
#   m      = Terminating symbol
RESET="\[\033[0m\]"
TIME_COLOUR="\[\033[38;5;35m\]"       # #00af5f
USER_HOST_COLOUR="\[\033[38;5;127m\]" # #af00af
PWD_COLOUR="\[\033[38;5;32m\]"        # #0087d7

# Setting the prompt. Default prompt: \h:\W \u\$
export PS1="$TIME_COLOUR[\t]$USER_HOST_COLOUR\u@\h$RESET:$PWD_COLOUR\w\n$RESET\$ "

# Use gruvbox's 256-colour palette to correct colours displayed in vim
GRUVBOX_COLOURS="$HOME/.vim/plugged/gruvbox/gruvbox_256palette.sh"
[ -x "$GRUVBOX_COLOURS" ] && source "$GRUVBOX_COLOURS"
unset GRUVBOX_COLOURS

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
