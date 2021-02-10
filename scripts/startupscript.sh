#!/bin/bash
# xrandr --setprovideroutputsource modesetting NVIDIA-0
# xrandr --auto
prime-offload
exec &> >(tee -a ~/.log.txt)
echo "i logged"

# prime-offload &

# PATH
# to make binaries in $HOME./local/bin discoverable
export PATH="$HOME/.local/bin:$PATH"

# set path of ruby
export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
export PATH="$PATH:$GEM_HOME/bin"

# set path for npm & well as yarn so that to allow global package installation for current user
export PATH="$HOME/.node_modules/bin:$PATH"
export npm_config_prefix=~/.node_modules
# set path for rust cargo
export PATH="$HOME/.cargo/bin:$PATH"

export EDITOR="nvim"
export TERMINAL="alacritty"
export BROWSER="firefox"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

export ANDROID_HOME=/opt/android-sdk

export PATH="$HOME/bin/caa:$PATH"
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/.local/bin/statusbar

export VK_ICD_FILENAMES=/usr/share/vulkan/icd.d/intel_icd.x86_64.json:/usr/share/vulkan/icd.d/primus_vk_wrapper.json
export LC_ALL=en_US.UTF-8

xmodmap ~/mysetup/.Xmodmap &
/home/rajatv/scripts/compton.sh &

feh --bg-scale /home/rajatv/Pictures/wallpaper/architectural-design-architecture-buildings-city-374811.jpg &
feh --bg-scale /home/rajatv/Pictures/wallpaper/Beautiful-Galaxy-Wallpaper-1920x1200.jpg
deadd-notification-center &
trayer --edge top --align right --SetDockType true --SetPartialStrut true \
 --expand true --width 3 --transparent true --tint 0x191860 --height 28 &
blueman-applet &
nm-applet &
albert &
# /home/rajatv/mysetup/scripts/mountntfs.sh &


exec dwm
