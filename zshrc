# ============================================================================
# ZSH Environment Setup (merged from zshenv and zprofile)
# ============================================================================

# From zshenv: Cargo environment
. "$HOME/.cargo/env"

# From zprofile: Homebrew environment  
eval "$(/opt/homebrew/bin/brew shellenv)"
export MYVIMRC=$HOME/.config/nvim/init.vim

# From zprofile: OrbStack integration
source ~/.orbstack/shell/init.zsh 2>/dev/null || :

# ============================================================================
# ZSH Main Configuration
# ============================================================================

# Get the directory of the zshrc file
ZSH_DIR="${${(%):-%x}:A:h}"

# Load configuration files from the 'config' directory
if [[ -d "$ZSH_DIR/config" ]]; then
  for config_file in "$ZSH_DIR"/config/*.zsh; do
    [[ -f "$config_file" ]] && source "$config_file"
  done
fi
zstyle ':zim:completion' dumpfile "${ZDOTDIR:-$HOME}/.zcompdump-$ZSH_VERSION"
zstyle ':zim' disable-version-check yes
source ${ZIM_HOME}/zimfw.zsh init -q
autoload -Uz compinit
if [[ -n ${ZDOTDIR:-$HOME}/.zcompdump(#qN.mh+24) ]]; then
  compinit -d "${ZDOTDIR:-$HOME}/.zcompdump-$ZSH_VERSION"
else
  compinit -C -d "${ZDOTDIR:-$HOME}/.zcompdump-$ZSH_VERSION"
fi
source ${ZIM_HOME}/init.zsh

# 重新加载现代工具别名（覆盖Zim的utility模块别名）
[[ -f "$ZSH_DIR/config/modern-tools.zsh" ]] && source "$ZSH_DIR/config/modern-tools.zsh"

[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"; [ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"
smart_vim() { mkdir -p "$(dirname "$1")"; nvim "$1" }
zstyle ':zim:git' aliases-prefix 'g'; zstyle ':zim:termtitle:precmd' format '%1~'
source "$GOPATH/src/github.com/sachaos/todoist/todoist_functions.sh"
PROG=todoist source "$GOPATH/src/github.com/urfave/cli/autocomplete/zsh_autocomplete"
[ -f "/Users/tianli/Documents/sync/zsh/env" ] && source "/Users/tianli/Documents/sync/zsh/env"

eval "$(zoxide init zsh)"

# Conda is now handled by the unified config/conda.zsh file
# Set mode before loading if needed: export ZSH_CONDA_MODE="lazy"

# Amazon Q post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh"
alias showall='osascript -e "tell application \"System Events\" to set visible of every process to true"'
alias hideall='osascript -e "tell application \"System Events\" to set visible of (every process whose name is not \"Finder\") to false"'
alias cc='claude --dangerously-skip-permissions'
