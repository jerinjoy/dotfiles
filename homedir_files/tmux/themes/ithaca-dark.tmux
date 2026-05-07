
# SPDX-FileCopyrightText: 2025 Jerin Joy
#
# SPDX-License-Identifier: Apache-2.0
#
# --- Ithaca Dark palette ---
set -g @bar_bg           "#0f191e"
set -g @band_bg          "#1c2b33"
set -g @text             "#f1f4f7"
set -g @muted            "#67788a"
set -g @dark             "#0f191e"

# accents
set -g @c1 "#47a5fa"   # blue
set -g @c2 "#ffdc32"   # yellow
set -g @c3 "#6ee146"   # green
set -g @c4 "#f05f69"   # red
set -g @c5 "#8773ff"   # purple

# pills
set -g @session_bg      "#6ee146"  # green left pill
set -g @active_bg       "#ffdc32"  # yellow active tab
set -g @inactive_bg     "#283943"   # inactive tab pill
set -g @time_bg         "#6ee146"  # green time pill

# borders / messages
set -g @pane_border        "#465a69"
set -g @pane_active_border "#47a5fa"
set -g @msg_fg             "#47a5fa"

# Pull in the shared layout
source-file ~/.tmux/themes/_template.tmux
