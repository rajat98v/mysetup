# yay -S starship
# git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh

plugins=(
    zsh-autosuggestions
    last-working-dir
    history
    sudo
    z
    )

eval "$(starship init zsh)"

alias music='ncmpcpp'                                 # open ncmcpp music
alias r='lfcd'                                      # ranger
alias v='nvim'                                        # nvim
alias N='sudo -E nvim'                                # sudo nvim
alias cv='nvim ~/.config/nvim/init.vim'        # nvim config
alias ci='nvim ~/.config/i3/config'            # i3 config
alias yp=youtube-dl -o '%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s'
alias yd='youtube-dl'

# to source lfcd function from file lfcd.sh
# now use lfcd instead of lf command to cd into directory you quit
source ~/.config/lf/lfcd.sh
source ~/.config/lf/lficons

export EDITOR="nvim"

