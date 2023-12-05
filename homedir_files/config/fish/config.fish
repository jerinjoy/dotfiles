# SPDX-FileCopyrightText: 2023 Jerin Joy
#
# SPDX-License-Identifier: Apache-2.0

set -x EDITOR nvim

# These aliases depend on the binaries being available.
function add_abbr_requiring_binaries
    abbr -a ls exa
    abbr -a ltr exa -lh --git --sort=newest
    abbr -a ltra exa -lh --git --sort=newest -a

    abbr -a cat "bat "
    abbr -a kit "bat --style=plain,header "
    abbr -a less "bat --style=plain "
    abbr -a diff delta
    abbr -a v "fd --type f --hidden --exclude .git | fzf-tmux -p --reverse | xargs nvim"
end

# Abbreviations

# These will be overriden if exa is avaialable
abbr -a ltr "ls -ltr"
abbr -a ltra "ls -ltra"

abbr -a gco "git checkout"
abbr -a gpush "git push --force-with-lease"
abbr -a gpull "git pull --rebase"
abbr -a gstatus "git status"
abbr -a gsubls "git submodule status --recursive"
abbr -a gshalist "git diff-tree --no-commit-id --name-only -r "

abbr -a h "history | ag"
abbr -a c clear

switch (uname)
    case Darwin
        if test -d /opt/homebrew/bin
            fish_add_path -pmP /opt/homebrew/bin
        end

        # Add the ccache softlinks for the compilers to the path.
        if test -d /opt/homebrew/opt/ccache/libexec
            fish_add_path -pmP /opt/homebrew/opt/ccache/libexec
        end

        # These are only installed by default on macOS using Homebrew
        add_abbr_requiring_binaries
end

if test -d $HOME/.cargo/bin/
    fish_add_path -pmP $HOME/.cargo/bin/
end

if test -d $HOME/.local/bin
    fish_add_path -pmP $HOME/.local/bin
end

if test -d $HOME/.local/bin/lvim
    fish_add_path -aP $HOME/.local/bin/
end

# Tide Colors
set -x tide_git_branch_color f1fa8c # yellow
set -x tide_git_operation_color ff79c6 # purple
set -x tide_git_stash_color 8be9fd # cyan
set -x tide_git_conflicted_color ff5555 # red
set -x tide_git_staged_color ff79c6 # pink
set -x tide_git_dirty_color ffb86c # orange
set -x tide_git_untracked_color 50fa7b # green

set -x tide_time_color 6272a4

# Set FZF Dracula theme
# https://draculatheme.com/fzf
set -x FZF_DEFAULT_OPTS "--color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9 --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9 --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6 --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4"

# Place all the corporate configs here. This file is in .gitignore.
if test -e $HOME/corporate.config.fish
    source $HOME/corporate.config.fish
end


# Placing this at the end as it breaks the syntax highligting in VScode.
abbr -a glog "git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'"
