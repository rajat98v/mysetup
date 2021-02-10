# yay -S starship
# git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh

HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=1000
setopt SHARE_HISTORY


plugins=(
    zsh-autosuggestions
    last-working-dir
    history
    sudo
    z
    )

eval "$(starship init zsh)"

alias e='exit'
alias t='tmux'
alias r='lfcd'                                      # ranger
alias v='nvim'                                        # nvim
alias N='sudo -E nvim'                                # sudo nvim
alias cv='nvim ~/.config/nvim/init.vim'        # nvim config
alias yp=youtube-dl -o '%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s'
alias yd='youtube-dl --no-playlist'
alias ydd='youtube-dl --no-playlist -f 399+140 '

# to source lfcd function from file lfcd.sh
# now use lfcd instead of lf command to cd into directory you quit
source ~/.config/lf/lfcd.sh
source ~/.config/lf/lficons

export EDITOR="nvim"


# tabtab source for electron-forge package
# uninstall by removing these lines or running `tabtab uninstall electron-forge`
[[ -f /home/rajatv/STORAGE/New-Volume-2/workspace/xi-electron/node_modules/tabtab/.completions/electron-forge.zsh ]] && . /home/rajatv/STORAGE/New-Volume-2/workspace/xi-electron/node_modules/tabtab/.completions/electron-forge.zsh