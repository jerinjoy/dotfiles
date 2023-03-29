# dotfiles

Installs my dev environment.

I use `fish` as my shell, `nvim` as my editor in the terminal, and `tmux` as my terminal multiplexer.

## Installation

```
./setup_env.py
```

Set up the "TokyoNight Storm" fish theme:

```
fish_config theme choose "TokyoNight Storm"
```

Configure the tide prompt:

```
tide configure
```


## Installation Script

```
❯ ./setup_env.py --help                                                                                                       jerin@Obelix.local
usage: setup_env.py [-h] [--config_file CONFIG_FILE] [--add_homebrew_packages ADD_HOMEBREW_PACKAGES [ADD_HOMEBREW_PACKAGES ...]]
                    [--add_fish_plugins ADD_FISH_PLUGINS [ADD_FISH_PLUGINS ...]] [-f] [--dry_run] [-v]

options:
  -h, --help            show this help message and exit
  --config_file CONFIG_FILE
                        YAML config file.
  --add_homebrew_packages ADD_HOMEBREW_PACKAGES [ADD_HOMEBREW_PACKAGES ...]
                        Additional Homebrew packages to install (macOS only)
  --add_fish_plugins ADD_FISH_PLUGINS [ADD_FISH_PLUGINS ...]
                        Additional fish plugins to install
  -f, --force           Overwite existing files if they exist.
  --dry_run             List the changes that will be made and the packages that will be installed.
  -v, --verbose         Verbose output.
```

### Dry Run

See what changes will be made to your system before running the script.

## Dependencies

Install the `pyyaml` package. The setup script uses it to parse the `config.yaml` file.

```
pip3 install pyyaml
```
