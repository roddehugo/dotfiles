# colors

tm_icon="☯"
tm_color_active=colour213
tm_color_inactive=colour241
tm_color_feature=colour4
tm_color_music=colour203

# separators
tm_separator_left_bold="◀"
tm_separator_left_thin="❮"
tm_separator_right_bold="▶"
tm_separator_right_thin="❯"

# default statusbar lengths
set -g status-left-length 10
set -g status-right-length 150
set -g status-interval 5

# default statusbar colors
set -g status-style bg=default,fg=$tm_color_active

# default window title colors
set -g window-status-style bg=default,fg=$tm_color_inactive
set -g window-status-format "#I #W"

# active window title color
set -g window-status-current-style bg=default,fg=$tm_color_active
set -g window-status-current-format "#[bold]#I #W"

# pane border
set -g pane-border-style bg=default,fg=$tm_color_inactive
set -g pane-active-border-style bg=default,fg=$tm_color_active

# message
set -g message-style bg=default,fg=$tm_color_active

# command message
set -g message-command-style bg=default,fg=default

# pane number display
set -g display-panes-colour $tm_color_inactive
set -g display-panes-active-colour $tm_color_active

# clock
set -g clock-mode-colour $tm_color_active

# prefix highlight colors
set -g @prefix_highlight_fg $tm_color_active
set -g @prefix_highlight_bg default
set -g @prefix_highlight_copy_prompt '^C'
set -g @prefix_highlight_copy_mode_attr bg=default,fg=$tm_color_inactive

# music
tm_itunes="#[fg=$tm_color_music]#(osascript ~/Workspaces/applescripts/itunes.applescript)"
#tm_rdio="#[fg=$tm_color_music]#(osascript ~/Workspaces/applescripts/rdio.applescript)"
#tm_spotify="#[fg=$tm_color_music]#(osascript ~/Workspaces/applescripts/spotify.applescript)"

# battery level
tm_battery="#(battery -pte)"

# prepare status components
tm_date="#[fg=$tm_color_inactive]%R %d %b"
tm_host="#[fg=$tm_color_feature,bold]#H"
tm_session_name="#[fg=$tm_color_feature,bold]$tm_icon #S"
tm_prefix_highlight="#{prefix_highlight}"

set -g status-left $tm_session_name' '
set -g status-right $tm_itunes' '$tm_prefix_highlight' '$tm_date' '$tm_battery'  '$tm_host
