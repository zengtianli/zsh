# Environment Variables
export HISTSIZE=1000
export SAVEHIST=1000
export ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim
export TIANLIB='/Users/tianli/Library/Mobile Documents/iCloud~md~obsidian/Documents/Tianli_brain'
export XDG_CONFIG_HOME="$HOME/.config"
export NVM_DIR="$HOME/.config/nvm"
export GOPATH="$HOME/go"
export EDITOR=/usr/local/bin/nvim
export VISUAL=/usr/local/bin/nvim
export PATH="$PATH:/usr/local/opt/w3m/bin:/usr/local/go/bin:$GOPATH/bin:/usr/local/opt/php/bin:/usr/local/opt/php/sbin:/opt/homebrew/opt/openjdk/bin"
export W3M_IMG_DISPLAY="/usr/local/opt/w3m/bin/w3mimgdisplay"
# ZIM Framework Initialization
if [[ ! -e ${ZIM_HOME}/zimfw.zsh ]]; then
  if (( ${+commands[curl]} )); then
    curl -fsSL --create-dirs -o ${ZIM_HOME}/zimfw.zsh \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  else
    mkdir -p ${ZIM_HOME} && wget -nv -O ${ZIM_HOME}/zimfw.zsh \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  fi
fi
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZDOTDIR:-${HOME}}/.zimrc ]]; then
  source ${ZIM_HOME}/zimfw.zsh init -q
fi
source ${ZIM_HOME}/init.zsh
# Key Bindings
bindkey -e
zmodload -F zsh/terminfo +p:terminfo
# Bind arrow keys and 'j/k' in vicmd mode to history substring search
for key ('^[[A' '^P' ${terminfo[kcuu1]}) bindkey ${key} history-substring-search-up
for key ('^[[B' '^N' ${terminfo[kcud1]}) bindkey ${key} history-substring-search-down
for key ('k') bindkey -M vicmd ${key} history-substring-search-up
for key ('j') bindkey -M vicmd ${key} history-substring-search-down
unset key
# Custom keybinding for lazygit
# History Configuration
setopt HIST_IGNORE_ALL_DUPS
# Shell Options and Autocomplete
WORDCHARS=${WORDCHARS//[\/]}
ZSH_AUTOSUGGEST_MANUAL_REBIND=1
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# Conda and Mamba Configuration
__conda_setup="$('/Users/tianli/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/tianli/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/Users/tianli/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/tianli/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup
if [ -f "/Users/tianli/miniforge3/etc/profile.d/mamba.sh" ]; then
    . "/Users/tianli/miniforge3/etc/profile.d/mamba.sh"
fi
# Node Version Manager (NVM)
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# Aliases
alias ex='export https_proxy=127.0.0.1:7890'
alias lg=lazygit
alias ra=joshuto
alias td=todoist
alias python=python3
# zstyle Configurations
zstyle ':zim:git' aliases-prefix 'g'
zstyle ':zim:termtitle:precmd' format '%1~'
# Extra Source Files
source "$GOPATH/src/github.com/sachaos/todoist/todoist_functions.sh"
source $(brew --prefix)/share/zsh/site-functions/_todoist_peco
PROG=todoist source "$GOPATH/src/github.com/urfave/cli/autocomplete/zsh_autocomplete"
function zle_eval {
    echo -en "\e[2K\r"
    eval "$@"
    zle redisplay
}
function openlazygit {
    zle_eval lazygit
}
zle -N openlazygit; bindkey "^G" openlazygit
export PATH="/Users/tianli/Desktop/useful_scripts:$PATH"
export LDFLAGS="-L/usr/local/opt/libffi/lib"
export PKG_CONFIG_PATH="/usr/local/opt/libffi/lib/pkgconfig"
export QT_PLUGIN_PATH=/Users/tianli/miniforge3/lib/python3.10/site-packages/PyQt6/Qt6/plugins

function smart_vim() {
  DIR="$(dirname "$1")"
  
  if [ ! -d "$DIR" ]; then
    mkdir -p "$DIR"
  fi
  
  nvim "$1"
}

alias vim=smart_vim
alias addch="~/add_comment_header.sh"
# zshrc 文件

# 加载 .env 文件
if [ -f "/Users/tianli/Documents/sync/zsh/env" ]; then
  source "/Users/tianli/Documents/sync/zsh/env"
fi

# 其他 zshrc 配置...

