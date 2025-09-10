##### Shared tmux theme template (uses palette vars) #####

# Bar basics
set -g status-position bottom
set -g status-justify left
set -g status-style "bg=#{@bar_bg} fg=#{@text}"
set -g status-left-length 60
set -g status-right-length 100
set -g status-interval 5
set -g window-status-separator ""

##### LEFT — session name pill → band #####
set -g status-left '#[fg=#{@session_bg},bg=#{@bar_bg}]#[fg=#{@dark},bg=#{@session_bg},bold] #S #[fg=#{@session_bg},bg=#{@band_bg}]'

##### WINDOWS — band for inactive; pill for active #####
setw -g window-status-style "bg=#{@band_bg},fg=#{@muted}"

# Inactive windows: colored index cycle; neutral name
setw -g window-status-format "#[bg=#{@band_bg},fg=#{?#{==:#I,1},#{@c1},#{?#{==:#I,2},#{@c2},#{?#{==:#I,3},#{@c3},#{?#{==:#I,4},#{@c4},#{@c5}}}}},bold] #I #[fg=#{@text}]#W "

# Active window pill (bridges band)
setw -g window-status-current-format '#[fg=#{@active_bg},bg=#{@band_bg}]#[fg=#{@dark},bg=#{@active_bg},bold] #I #W* #[fg=#{@active_bg},bg=#{@band_bg}]'

##### RIGHT — time pill (arrow on left) #####
set -g @time_fmt "+%a %m/%d %H:%M"
set -g status-right '#[fg=#{@session_bg},bg=#{@bar_bg}]#[fg=#{@dark},bg=#{@session_bg},bold] %a %m/%d %H:%M #[fg=#{@session_bg},bg=#{@band_bg}]'

##### Panes / messages #####
set -g pane-border-style "fg=#{@pane_border}"
set -g pane-active-border-style "fg=#{@pane_active_border}"
set -g message-style "bg=#{@bar_bg} fg=#{@msg_fg}"
set -g message-command-style "bg=#{@bar_bg} fg=#{@msg_fg}"
