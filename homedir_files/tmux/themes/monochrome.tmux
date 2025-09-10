# --- Monochrome (dark, filled pills unified) ---
# Base
set -g @bar_bg           "#1e1e2e"   # Dark base
set -g @band_bg          "#1e1e2e"   # Match bar so it blends in
set -g @text             "#e6e6e6"   # Soft white
set -g @muted            "#a7a7a7"   # Muted gray
set -g @dark             "#0b0b0d"   # Near-black

# Grayscale accents
set -g @c1 "#f5f5f5"
set -g @c2 "#d9d9d9"
set -g @c3 "#b3b3b3"
set -g @c4 "#8c8c8c"
set -g @c5 "#6e6e6e"
set -g @c6 "#4a4a4a"

# Pills
set -g @session_bg   "#b3b3b3"   # Mid gray session pill
set -g @battery_bg   "#6e6e6e"   # Dark gray battery pill
set -g @time_bg "#{@session_bg}"

# Active tab standout
set -g @active_bg    "#f5f5f5"   # Bright fill for active tab

# Borders/messages
set -g @pane_border        "#3b3b4a"
set -g @pane_active_border "#a7a7a7"
set -g @msg_fg             "#cccccc"

# Shared layout
source-file ~/.tmux/themes/_template.tmux