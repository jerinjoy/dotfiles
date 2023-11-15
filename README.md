# dotfiles

Installs my dev environment.

I use `fish` as my default shell, `nvim`/`lvim` as my editor in the terminal, and `tmux` as my terminal multiplexer.

See `[config.yaml](config.yaml)` to for the packages that will be installed.

## Installation

```
./setup_env.py
```

**Add `-f` to force**

Set up the "TokyoNight Storm" fish theme:

```
fish_config theme choose "TokyoNight Storm"
```

Configure the tide prompt:

```
tide configure
```

### Dry Run

See what changes will be made to your system before running the script.

## Dependencies

Install the `pyyaml` package. The setup script uses it to parse the `config.yaml` file.

```
pip3 install pyyaml
```
