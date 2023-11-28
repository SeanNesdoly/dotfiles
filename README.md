# dotfiles

A collection of my personal \*NIX configuration files, used in *macOS*.

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
cd "$HOME"
bashdot install dotfiles
```

### Change default shell for machines running on Apple's M1 chip to an arm64-version of GNU bash

Source: https://support.apple.com/en-us/HT208050

```bash
# Install arm64-version of Homebrew
if ! command -v /opt/homebrew/bin/brew &> /dev/null; then
    # From https://brew.sh/
    arch -arm64 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

if ! command -v /opt/homebrew/bin/bash &> /dev/null; then
    # Install arm64-version of GNU bash
    echo -e "Before installation of arm64 GNU bash: $(type -P bash)"
    arch -arm64 /opt/homebrew/bin/brew install bash
    echo -e "After installation of arm64 GNU bash: $(type -P bash)"

    # Verify architecture
    echo -e "Architecture of $(file /opt/homebrew/bin/bash)"

    # Permit use of the homebrew-installed, arm64-version of GNU bash
    sudo echo /opt/homebrew/bin/bash >> /etc/shells

    # Change the default shell
    chsh -s /opt/homebrew/bin/bash
fi
```

To set the complete path that shells open with for a profile in Terminal,
without changing the system-wide default:
1. Terminal --> Preferences --> General
2. Under `Shells open with`, set the `Command (complete path)` to
`/opt/homebrew/bin/bash`

# Common, yet easily forgotten, commands
- Merge PDF files with `ImageMagick`:
  ```bash
  magick -density 150 in{1,2}.jpg out.pdf
  ```
  *(The macOS `Automator` python script `/System/Library/Automator/Combine\ PDF\
  Pages.action/Contents/Resources/join.py` has been moved or removed).*
