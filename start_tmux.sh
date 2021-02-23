#!/bin/bash
SESSION="dan"
SESSIONEXISTS=$(tmux list-sessions | grep $SESSION)
if [ "$SESSIONEXISTS" = "" ]
then
    tmux new -ds $SESSION

    tmux rename-window -t 0 'etl-container'
    tmux send-keys 'cd ~/projects/etl-container' Enter 'clear' Enter
    tmux splitw -h -t "$SESSION:0.0"
    tmux send-keys 'cd ~/projects/etl-container' Enter 'clear' Enter

    tmux new-window -t $SESSION:1 -n 'dev-loadbalancer'
    tmux send-keys -t 'dev-loadbalancer' 'cd ~/projects/dev-loadbalancer' Enter 'clear' Enter
    tmux splitw -h -t "$SESSION:1.0"
    tmux send-keys 'cd ~/projects' Enter 'clear' Enter

    tmux new-window -t $SESSION:2 -n 'customer-portal'
    tmux send-keys -t 'customer-portal' 'cd ~/projects/customer-portal' Enter 'clear' Enter
    tmux splitw -h -t "$SESSION:2.0"
    tmux send-keys -t 'customer-portal' 'cd ~/projects/customer-portal' Enter 'clear' Enter

    tmux new-window -t $SESSION:3 -n 'notes'
    tmux send-keys -t 'customer-portal' 'cd ~/projects/notes' Enter 'clear' Enter
    tmux splitw -h -t "$SESSION:3.0"

    tmux new-window -t $SESSION:4 -n 'recon-auth'
    tmux send-keys -t 'recon-auth' 'cd ~/projects/recon-authenticator' Enter 'clear' Enter
    tmux splitw -h -t "$SESSION:4.0"
    tmux send-keys -t 'recon-auth' 'cd ~/projects/recon-authenticator' Enter 'clear' Enter

    tmux new-window -t $SESSION:5 -n 'customer-apis'
    tmux send-keys -t 'customer-apis' 'cd ~/projects/customer-apis' Enter 'clear' Enter
    tmux splitw -h -t "$SESSION:5.0"
    tmux send-keys -t 'customer-apis' 'cd ~/projects/customer-apis' Enter 'clear' Enter

    tmux new-window -t $SESSION:6 -n 'web_backend'
    tmux send-keys -t 'web_backend' 'cd ~/projects/web_backend' Enter 'clear' Enter
    tmux splitw -h -t "$SESSION:6.0"
    tmux send-keys -t 'web_backend' 'cd ~/projects/web_backend' Enter 'clear' Enter
    tmux splitw -v -t "$SESSION:6.1"
    tmux send-keys -t 'web_backend' 'cd ~/projects' Enter 'clear' Enter
fi
tmux attach -t $SESSION
