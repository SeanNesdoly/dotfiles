#!/bin/bash
#
# Load all configuration "dot" files in the home directory.
#
# Sean Nesdoly
# 2017-08-15

for file in ~/.{exports,aliases,bashrc}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;
