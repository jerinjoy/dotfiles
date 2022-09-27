set -x EDITOR vim

# Abbreviations

abbr -a gco "git checkout"
abbr -a gpush "git push --force-with-lease"
abbr -a gpull "git pull --rebase"
abbr -a glog "git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'"
abbr -a gstatus "git status"
# List all the submodules
abbr -a gsubls "git submodule status --recursive"

abbr -a ll exa -lh
abbr -a ls exa
abbr -a ltr exa -lh --git --sort=newest

abbr -a cat "bat --theme=Dracula "
abbr -a kit "bat --style=plain,header "

abbr -a diff "delta"

abbr -a vim nvim

abbr -a h "history | ag"
abbr -a c "clear"

if test -d /opt/homebrew/bin
  fish_add_path -pmP /opt/homebrew/bin
end

if test -d $HOME/.cargo/bin/
  fish_add_path -pmP $HOME/.cargo/bin/
end

if test -d $HOME/.local/bin
  fish_add_path -pmP $HOME/.local/bin
end

# Add the ccache softlinks for the compilers to the path.
if test -d /opt/homebrew/opt/ccache/libexec
  fish_add_path -pmP /opt/homebrew/opt/ccache/libexec
end

if test -d /Users/joy/workspace/dv-release/darwin/bin
  fish_add_path -aP /Users/joy/workspace/dv-release/darwin/bin
end

if test -d /Users/joy/Library/Python/3.10/bin
  fish_add_path -aP /Users/joy/Library/Python/3.10/bin
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



