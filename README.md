# dotfiles

A collection of my personal *NIX configuration files, used in **Mac OS X*.

The dotfiles contained within this version-controlled directory lack the usual
"." prefix as they are *symlinked* into the `$HOME` directory using the
[bashdot](https://github.com/bashdot/bashdot) tool. When the symlinks are
created in the `$HOME` directory, it automatically prefixes them with a dot.

`.bootstrap.sh` was previously used to copy dotfiles into the `$HOME` directory
and is now kept as a backup. It is prefixed with a dot to hide it from the
`bashdot` tool.

### Symlink files in version-controlled directory to `$HOME`

The `dotfiles` directory must be in `$HOME`.
```bash
cd ~
bashdot install dotfiles
```
