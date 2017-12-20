#!/bin/bash

# update repository
git pull origin master;

# copy repository contents to home directory 
rsync --exclude ".git/" \
    --exclude ".DS_Store" \
    --exclude "bootstrap.sh" \
    --exclude "README.md" \
    -avh --no-perms . ~;

# evaluate the updated "dot" files
source ~/.bash_profile;
