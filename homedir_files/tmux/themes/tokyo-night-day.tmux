
# SPDX-FileCopyrightText: 2023 Jerin Joy
#
# SPDX-License-Identifier: Apache-2.0
#
# --- Tokyo Night Day (light variant, dark-bg adapted) ---
set -g @bar_bg           "#1a1b26"
set -g @band_bg          "#24283b"
set -g @text             "#d5d6db"
set -g @muted            "#8990b3"
set -g @dark             "#0f0f14"

# accents (day palette, brightened for dark bg)
set -g @c1 "#2e7de9"   # blue
set -g @c2 "#f5a623"   # warm amber
set -g @c3 "#587539"   # muted green
set -g @c4 "#f52a65"   # hot pink
set -g @c5 "#9854f1"   # violet

# pills
set -g @session_bg      "#2e7de9"  # blue left pill
set -g @active_bg       "#f5a623"  # amber active tab
set -g @inactive_bg     "#3b4261"   # inactive tab pill
set -g @time_bg         "#2e7de9"  # blue time pill

# borders / messages
set -g @pane_border        "#3b4261"
set -g @pane_active_border "#2e7de9"
set -g @msg_fg             "#f52a65"

# Pull in the shared layout
source-file ~/.tmux/themes/_template.tmux
