#!/bin/bash
tmux new -d -s Odroid

tmux splitw -h -p 80
tmux splitw -h -p 80
tmux splitw -h -p 80
tmux select-layout even-horizontal
tmux selectp -t 0
tmux splitw -v -p 50
tmux selectp -t 2
tmux splitw -v -p 50
tmux selectp -t 4
tmux splitw -v -p 50
tmux selectp -t 6
tmux splitw -v -p 50

tmux send -t Odroid.0 "ssh tom@192.168.1.31" ENTER
tmux send -t Odroid.1 "ssh tom@192.168.1.32" ENTER
tmux send -t Odroid.2 "ssh tom@192.168.1.33" ENTER
tmux send -t Odroid.3 "ssh tom@192.168.1.34" ENTER
tmux send -t Odroid.4 "ssh tom@192.168.1.35" ENTER
tmux send -t Odroid.5 "ssh tom@192.168.1.36" ENTER
tmux send -t Odroid.6 "ssh tom@192.168.1.37" ENTER
tmux send -t Odroid.7 "ssh tom@192.168.1.38" ENTER

tmux set -w synchronize-panes on
tmux a -t Odroid
