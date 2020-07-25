#!/bin/bash
exec &> >(tee -a ~/.log.txt)
echo "i logged"

xmodmap ~/mysetup/.Xmodmap &
/home/rajatv/scripts/compton.sh &

export PATH="$HOME/.local/bin:$PATH"
export PATH="/root/.gem/ruby/2.7.0/bin:$PATH"

export EDITOR="nvim"
export TERMINAL="alacritty"
export BROWSER="firefox"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

export ANDROID_HOME=/opt/android-sdk

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/bin/caa:$PATH"

export VK_ICD_FILENAMES=/usr/share/vulkan/icd.d/intel_icd.x86_64.json:/usr/share/vulkan/icd.d/primus_vk_wrapper.json
export LC_ALL=en_US.UTF-8
exec dwm
