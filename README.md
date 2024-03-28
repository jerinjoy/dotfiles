<!--
SPDX-FileCopyrightText: 2023 Jerin Joy

SPDX-License-Identifier: Apache-2.0
-->

# dotfiles

Installs my dev environment using [Dotbot](https://github.com/anishathalye/dotbot)

![terminal](docs/terminal.jpg)

## Installation

```
./install
```

## Post Installation Configuration

### Set up the [TokyoNight Storm](https://github.com/folke/tokyonight.nvim) theme in `fish`:

```
fish_config theme choose "TokyoNight Storm"
```

### Configure the tide prompt:

```
tide configure
```

### Create a `~/local.config.fish` file

Place configuration that shouldn't be part of this repo in a `~/local.config.fish` file.

The Fish [configuration file](homedir_files/config/fish/config.fish) looks for this file and sources it if it's available.

### Create a `~/user.gitconfig` file

Place user-specific configuration (name, email) in `~/user.gitconfig`.

Example:

```bash
❯ bat --style=plain,header  ~/user.gitconfig
File: /Users/joy/user.gitconfig
# This is not checked into dotfiles and is local to this machine.

[user]
    name = J Joy
    email = j@joy.com

[alias]
  # everything I've checked in since last night
  today = log --since=00:00:00 --all --no-merges --oneline --author=j@joy.com
```

## Tools Installed

### fish

I use [`fish`](https://fishshell.com) as my default shell and [`fisher`](https://github.com/jorgebucaran/fisher) to manage my fish plugins.

The plugins listed in [`fish_plugins`](homedir_files/config/fish/fish_plugins) are installed by fisher.

### neovim

I use [Neovim](https://neovim.io) as my editor in the terminal with the [LazyVim](https://www.lazyvim.org/).

I use VSCode as my primary editor.

### tmux

I use [`tmux`](https://github.com/tmux/tmux/wiki) as my terminal multiplexer.

The plugins in [`~/.tmux/plugins/`](homedir_files/tmux/plugins/) are installed.

### Homebrew

I use [Homebrew](https://brew.sh) to install packages on macOS. The [`Brewfile`](Brewfile) lists the packages that are installed.

**NOTE: Homebrew will only be installed on macOS.**

## Troubleshooting

### Install complains that it can't find the dotbot executable

```shell
❯ ./install
./install:27: no such file or directory: /home/joy/dotfiles/dotbot/bin/Dotbot
````

Run:

```shell
git submodule deinit -f . && git submodule update --init --recursive
```

### For issues with LazyVim (NeoVim) clear out these directories.

```shell
rm -r ~/.local/state/nvim/
rm -r ~/.local/share/nvim/
````
