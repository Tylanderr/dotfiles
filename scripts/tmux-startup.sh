#! /bin/bash
# Uncomment for a single window to start up
tmux new-session -s Dev -n nvim

# Uncomment for multiple windows to startup
#tmux new-session -s Dev -n nvim -d
#tmux new-window -t Dev:2 -n term
#tmux select-window -t Dev:1
#tmux -2 attach-session -t Dev
