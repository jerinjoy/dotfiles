# --- Catppuccin Mocha tuned vars ---
set -g @bar_bg           "#11111b"   # Mantle
set -g @band_bg          "#1e1e2e"   # Base
set -g @text             "#cdd6f4"   # Text
set -g @muted            "#6c7086"   # Subtext0
set -g @dark             "#181825"   # Crust for pills with light fg

# accents
set -g @c1 "#89dceb"   # Sky blue
set -g @c2 "#facc15"   # Bright golden yellow
set -g @c3 "#94e2d5"   # Teal
set -g @c4 "#f38ba8"   # Red
set -g @c5 "#fab387"   # Peach

# pills
set -g @session_bg      "#89dceb"   # Sky blue (session pill)
set -g @active_bg       "#facc15"   # Bright yellow (active tab)
set -g @time_bg         "#74c7ec"   # Sapphire (time pill)
set -g @time_fg         "#11111b"   # Dark fg for contrast

# borders / messages
set -g @pane_border        "#45475a"   # Overlay0
set -g @pane_active_border "#89dceb"   # Sky blue
set -g @msg_fg             "#facc15"   # Bright yellow (ties in with active tab)

# Shared layout
source-file ~/.tmux/themes/_template.tmux
