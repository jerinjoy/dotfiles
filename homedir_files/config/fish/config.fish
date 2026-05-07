# SPDX-FileCopyrightText: 2023 Jerin Joy
#
# SPDX-License-Identifier: Apache-2.0

umask 002

set -x EDITOR nvim
set -g fish_key_bindings fish_default_key_bindings
abbr -a vim nvim

# These aliases depend on the binaries being available.
function add_abbr_requiring_binaries
    abbr -a ls lsd
    abbr -a ltr lsd -ltr
    abbr -a ltra lsd -ltra

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

abbr -a gac "git add -u && git smart-commit -s -m"
abbr -a gc "git smart-commit -s -m"
abbr -a gamend "git commit -s --amend"
abbr -a gco "git checkout"
abbr -a gpush "git push --force-with-lease"
abbr -a gpull "git pull --rebase"
abbr -a gstatus "git status"
abbr -a gsubls "git submodule status --recursive"
abbr -a gshalist "git diff-tree --no-commit-id --name-only -r "

abbr -a h "history | rg"
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

if test -d $HOME/bin
    fish_add_path -pmP $HOME/bin/
end

# Tide Colors (Ithaca Dark)
set -x tide_git_color_branch 47a5fa # blue
set -x tide_git_color_operation 8773ff # purple
set -x tide_git_color_stash 3cd7f5 # cyan
set -x tide_git_color_conflicted f05f69 # red
set -x tide_git_color_staged 8773ff # purple
set -x tide_git_color_dirty ffdc32 # yellow
set -x tide_git_color_untracked 6ee146 # green

set -x tide_color_time 67788a

# Set OS icon dynamically based on current system
# Use universal variable to override any existing value from fish_variables
_tide_detect_os | read -l os_icon os_color os_bg_color
set -U tide_os_icon $os_icon

# FZF Ithaca Dark theme
set -x FZF_DEFAULT_OPTS "--color=fg:#f1f4f7,bg:#0f191e,hl:#8773ff --color=fg+:#f1f4f7,bg+:#1c2b33,hl+:#47a5fa --color=info:#ffdc32,prompt:#6ee146,pointer:#f05f69 --color=marker:#f05f69,spinner:#ffdc32,header:#67788a"

# Place all the local configs here. This file isn't checked into the repo.
if test -e $HOME/local.config.fish
    source $HOME/local.config.fish
end


# Placing this at the end as it breaks the syntax highligting in VScode.
abbr -a glog "git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'"
