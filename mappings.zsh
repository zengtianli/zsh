function zle_eval {
    echo -en "\e[2K\r"
    eval "$@"
    zle redisplay
}

function openlazygit {
    zle_eval lazygit
}

zle -N openlazygit; bindkey "^G" openlazygit

function openranger {
    zle_eval ranger
}

#zle -N openranger; bindkey "^R" openlazygit

function openlazynpm {
    zle_eval lazynpm
}

#zle -N openlazynpm; bindkey "^N" openlazynpm


co() { cp -v "$1" "$(awk '{print $1}' ~/scripts/dirs | dmenu|sed "s|~|$HOME|")" ;}
