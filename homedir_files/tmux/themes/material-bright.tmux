# SPDX-FileCopyrightText: 2023 Jerin Joy
#
# SPDX-License-Identifier: Apache-2.0
#
# --- Material Design (bright on dark) ---
set -g @bar_bg           "#121212"   # Bar background (MD dark base)
set -g @band_bg          "#1e1e1e"   # Band/divider (slightly lighter than bar)
set -g @text             "#e0e0e0"   # Primary text on dark
set -g @muted            "#b0bec5"   # Blue Grey 200 (muted text)
set -g @dark             "#0b0b0d"   # Very dark for pill text when bg is bright

# Accents (Material palette – colorful but readable on dark)
set -g @c1 "#2196f3"     # Blue 500
set -g @c2 "#ffc107"     # Amber 500
set -g @c3 "#26a69a"     # Teal 400
set -g @c4 "#ff7043"     # Deep Orange 400
set -g @c5 "#ab47bc"     # Purple 400

# Pills
set -g @session_bg       "#90CAF9"   # Green 500 (session pill)
set -g @active_bg        "#FB8C00"   # Amber 500 (active tab)
set -g @time_bg          "#90CAF9"

# Borders / messages
set -g @pane_border         "#424242"   # Neutral border
set -g @pane_active_border  "#2979ff"   # Blue A400 (focused pane)
set -g @msg_fg              "#ff4081"   # Pink A200 (messages pop)

# Shared layout template
source-file ~/.tmux/themes/_template.tmux
