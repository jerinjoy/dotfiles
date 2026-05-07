
# SPDX-FileCopyrightText: 2025 Jerin Joy
#
# SPDX-License-Identifier: Apache-2.0
#
# --- Ithaca Light palette ---
set -g @bar_bg           "#f1f4f7"
set -g @band_bg          "#dee3e9"
set -g @text             "#1c2b33"
set -g @muted            "#67788a"
set -g @dark             "#1c2b33"

# accents
set -g @c1 "#0064e0"   # blue
set -g @c2 "#f0aa19"   # yellow
set -g @c3 "#28d232"   # green
set -g @c4 "#e6193b"   # red
set -g @c5 "#6441d2"   # purple

# pills
set -g @session_bg      "#28d232"  # green left pill
set -g @active_bg       "#f0aa19"  # yellow active tab
set -g @inactive_bg     "#cbd2d9"   # inactive tab pill
set -g @time_bg         "#28d232"  # green time pill

# borders / messages
set -g @pane_border        "#a4adb8"
set -g @pane_active_border "#0064e0"
set -g @msg_fg             "#0064e0"

# Pull in the shared layout
source-file ~/.tmux/themes/_template.tmux
