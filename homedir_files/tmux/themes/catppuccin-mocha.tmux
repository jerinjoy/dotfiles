# SPDX-FileCopyrightText: 2023 Jerin Joy
#
# SPDX-License-Identifier: Apache-2.0
#
# --- Catppuccin Mocha (official palette) ---
# Surfaces
set -g @bar_bg           "#181825"   # Mantle
set -g @band_bg          "#1e1e2e"   # Base
set -g @text             "#cdd6f4"   # Text
set -g @muted            "#6c7086"   # Overlay 0
set -g @dark             "#11111b"   # Crust (for text on bright pills)

# Accents (Mocha)
set -g @c1 "#89b4fa"   # Blue
set -g @c2 "#cba6f7"   # Mauve
set -g @c3 "#fab387"   # Peach
set -g @c4 "#a6e3a1"   # Green
set -g @c5 "#f9e2af"   # Yellow

# Pills
set -g @session_bg       "#f9e2af"   # Yellow (hostname pill)
set -g @active_bg        "#89b4fa"   # Blue (active tab)
set -g @inactive_bg     "#45475a"   # Surface 1 (inactive tab pill)
set -g @time_bg          "#585b70"   # Surface 2 (gray time pill)

# Borders / messages
set -g @pane_border         "#45475a"   # Surface 1
set -g @pane_active_border  "#89b4fa"   # Blue
set -g @msg_fg              "#f38ba8"   # Red

# Shared layout
source-file ~/.tmux/themes/_template.tmux

# --- Overrides: light text on gray pills + macOS time format ---

# Detect OS for hostname pill glyph
if-shell '[ "$(uname -s)" = "Darwin" ]' 'set -g @os_logo ""' 'set -g @os_logo ""'
# Session pill: light text on gray (with rounded caps)
set -g status-left '#[fg=#{@session_bg},bg=#{@bar_bg}]#[fg=#{@dark},bg=#{@session_bg},bold] #{@os_logo} #S #[fg=#{@session_bg},bg=#{@band_bg}]'

# Time pill: light text on gray + macOS clock format (e.g. "Thu Oct 17  3:24 PM")
set -g status-right '#{prefix_highlight} #[fg=#{@time_bg},bg=#{@bar_bg}]#[fg=#{@text},bg=#{@time_bg},bold] %a %b %-d  %-l:%M %p #[fg=#{@time_bg},bg=#{@bar_bg}]'
