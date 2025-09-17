
# SPDX-FileCopyrightText: 2023 Jerin Joy
#
# SPDX-License-Identifier: Apache-2.0
#
# --- Tokyo Night Storm palette vars ---
set -g @bar_bg           "#24283b"
set -g @band_bg          "#1f2335"
set -g @text             "#a9b1d6"
set -g @muted            "#a9b1d6"
set -g @dark             "#1a1b26"

# accents
set -g @c1 "#7aa2f7"   # blue
set -g @c2 "#e0af68"   # yellow
set -g @c3 "#9ece6a"   # green
set -g @c4 "#f7768e"   # red
set -g @c5 "#bb9af7"   # pink

# pills
set -g @session_bg      "#9ece6a"  # green left pill
set -g @active_bg       "#e0af68"  # yellow active tab
set -g @time_bg         "#9ece6a"  # green time pill

# borders / messages
set -g @pane_border        "#565f89"
set -g @pane_active_border "#7aa2f7"
set -g @msg_fg             "#7aa2f7"

# Pull in the shared layout
source-file ~/.tmux/themes/_template.tmux
