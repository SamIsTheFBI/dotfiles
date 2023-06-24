#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

alias wget='wget -N'
alias tree='tree -a -I .git'
alias dots='/usr/sbin/git --git-dir=/home/samisthefbi/.dotfiles/ --work-tree=/home/samisthefbi'
alias vi='/usr/bin/nvim'
alias spotify='LD_PRELOAD=/usr/local/lib/spotify-adblock.so spotify -no-zygote'
alias rempd='pkill mpd && rm ~/.config/mpd/database && mpd &'
alias ll='ls -al'
alias cc='echo 3 | sudo tee /proc/sys/vm/drop_caches'
alias d='echo "Space left:$(df -h /dev/sda7 --output=avail | sed -n 2p)"'
alias s='sxiv -aq '
alias ss='sxiv -iaq <<< "$(find -L . -mindepth 1 -maxdepth 1 -type f | shuf)"'
alias sc='sxiv -iaq <<< "$(find -L . -mindepth 1 -maxdepth 1 -type f | sort -V)"'
alias h='tac ~/.bash_history | cut -d ";" -f2- | sed 1d | fzf | xclip -r -sel c'
alias n='setsid nemo .'
alias z='zathura'
alias mpv='mpv --no-keepaspect-window --save-position-on-quit'
alias m='mpv -- "$(fzf)"'
alias sd="ls -t | sed 's/\ /\\ /g' | xargs sxiv -aq --"
alias sdr="ls -tr | sed 's/\ /\\ /g' | xargs sxiv -aq --"
alias mpvd="ls -t | sed 's/\ /\\\ /g' | xargs mpv --no-keepaspect-window --no-resume-playback --"
alias mpvdr="ls -tr | sed 's/\ /\\\ /g' | xargs mpv --no-keepaspect-window --no-resume-playback --"

export PATH="~/.local/bin:$PATH:~/eww/target/release"
complete -f -X '!*.zip' decompress
complete -f -X '!*.cbz' decompress
complete -f -X '!*.cbr' decompress
complete -f -X '!*.rar' decompress
# exec zsh
# Install Ruby Gems to ~/gems
export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"
