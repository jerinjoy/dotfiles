# SPDX-FileCopyrightText: 2023 Jerin Joy
#
# SPDX-License-Identifier: Apache-2.0
#
# --- Catppuccin LATTE (dark background tuned) ---
set -g @bar_bg           "#1e1e2e"   # Dark base (Mocha Base, good neutral)
set -g @band_bg          "#313244"   # Surface0 (subtle divider)
set -g @text             "#eff1f5"   # Latte Text (light on dark)
set -g @muted            "#acb0be"   # Latte Subtext0 (muted gray-blue)
set -g @dark             "#11111b"   # Crust, for pills with bright fg

# Accents from Latte (brightened so they pop on dark)
set -g @c1 "#1e66f5"   # Blue (rich, vivid)
set -g @c2 "#df8e1d"   # Yellow (amber/golden)
set -g @c3 "#40a02b"   # Green (emerald, clearer than pale latte green)
set -g @c4 "#d20f39"   # Red (crisp, not muted)
set -g @c5 "#fe640b"   # Orange (bold)

# Pills
set -g @session_bg      "#40a02b"   # Green (session pill, lively)
set -g @active_bg       "#df8e1d"   # Yellow (active tab, stands out)
set -g @time_bg         "#1e66f5"   # Blue (time pill, crisp contrast)

# Borders / messages
set -g @pane_border        "#45475a"   # Neutral gray border
set -g @pane_active_border "#1e66f5"   # Blue (focus)
set -g @msg_fg             "#df8e1d"   # Yellow (messages pop)

# Shared layout
source-file ~/.tmux/themes/_template.tmux
