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
if command -v $HOME/.pyenv/bin/pyenv > /dev/null; then
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init --path)"
fi

for file in "${HOME}"/.{bashrc,path,exports,aliases}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/local/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/local/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/usr/local/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/usr/local/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
