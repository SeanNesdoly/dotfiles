#!/bin/bash
#
# Load all configuration "dot" files in the home directory.
#
# Sean Nesdoly
# 2017-08-15

# Prevent duplication of PATH elements in tmux sessions
if [ -f /etc/profile ]; then
    PATH=""
    source /etc/profile
fi

# Configure 'pyenv' for the Bash shell
if command -v "$HOME"/.pyenv/bin/pyenv > /dev/null; then
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init --path)"
fi

for file in "${HOME}"/.{path,bashrc,exports,aliases}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

