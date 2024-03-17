# ZSH 配置说明

这是我的 `zsh` 配置文件，包括环境变量、框架初始化、按键绑定、历史记录配置、自动完成、高亮显示以及其他自定义函数和别名设置的详细信息。

## 环境变量设定

以下是一些主要的环境变量设置：

- `HISTSIZE` 和 `SAVEHIST` 设置命令历史记录的大小。
- `ZIM_HOME` 指定了 ZIM 框架的家目录。
- `EDITOR` 和 `VISUAL` 都设置为使用 `nvim` 作为默认编辑器。
- `PATH` 环境变量包括了多个重要的二进制文件路径。

## ZIM 框架初始化

如果 `zimfw.zsh` 文件不存在，会使用 `curl` 或 `wget` 从 GitHub 下载 ZIM 框架的最新版本，并执行初始化操作。

## 按键绑定

- 绑定了上下箭头和 `j/k` 键以在命令历史中进行子字符串搜索。
- 自定义按键 `"^G"` 用于快速打开 `lazygit`。

## 历史配置

- `HIST_IGNORE_ALL_DUPS` 选项被设置为忽略所有重复的历史记录项，以便历史更加简洁。

## 自动完成和高亮显示配置

- 使用 `ZSH_AUTOSUGGEST_MANUAL_REBIND` 和 `ZSH_HIGHLIGHT_HIGHLIGHTERS` 选项启用了自动建议和语法高亮功能。

## Conda 和 Mamba 配置

- 为 `conda` 和 `mamba`（Python 包管理器）配置了初始化脚本和环境路径。

## Node Version Manager (NVM)

- 加载了 `nvm` 和 `nvm bash_completion` 用于管理 Node.js 版本。

## 别名设置

- 设置了一系列快捷命令别名，例如 `lg` 为 `lazygit`，`td` 为 `todoist` 等。

## 额外的源文件加载

- 加载了与 `todoist` 相关的函数和自动完成脚本。

## 自定义函数和别名

- `zle_eval` 和 `openlazygit` 函数提供了终端命令执行的便捷方式。
- `smart_vim` 函数提供了一个智能的 `nvim` 启动脚本。

## 加载外部环境变量文件

- 通过检查并加载 `/Users/tianli/Documents/sync/zsh/env` 来添加额外的环境变量配置，其中可能包含敏感信息。


```markdown
## 自定义函数

这部分介绍 `zshrc` 中定义的自定义函数及其用途。

### zle_eval

`zle_eval` 函数用于执行给定的命令，并清除当前终端行。这在你需要刷新当前行的内容后执行命令时非常有用。

```zsh
function zle_eval {
    echo -en "\e[2K\r"
    eval "$@"
    zle redisplay
}
```

### openlazygit

`openlazygit` 函数封装了 `lazygit` 命令，它使用 `zle_eval` 函数来清除当前行并启动 `lazygit`，这是一个终端中的 Git 用户界面。

```zsh
function openlazygit {
    zle_eval lazygit
}
zle -N openlazygit; bindkey "^G" openlazygit
```

### smart_vim

`smart_vim` 函数是一个智能化的 `nvim` 启动脚本，它检查目标文件的目录是否存在，如果不存在则创建目录后再打开文件。

```zsh
function smart_vim() {
  DIR="$(dirname "$1")"
  
  if [ ! -d "$DIR" ]; then
    mkdir -p "$DIR"
  fi
  
  nvim "$1"
}
alias vim=smart_vim
```

## 别名设置

别名设置使得命令行操作更加快速和直观。

- `ex`: 设置代理。
- `lg`: 启动 `lazygit`。
- `ra`: 启动 `joshuto`，一个终端文件管理器。
- `td`: 启动 `todoist` 应用。
- `python`: 默认使用 `python3`。

## 加载外部环境变量文件

为了保护敏感信息，外部 `.env` 文件被用于存放私密数据，而 `zshrc` 会在启动时加载这些变量。


请确保这个 `.env` 文件没有被推送到任何公共仓库，以防敏感信息泄漏。

## 使用提示

以下是一些使用此 `zshrc` 配置的提示：

- 当你首次在新的终端环境中运行 `zsh` 时，ZIM 框架将会自动初始化并下载所需的脚本。
- 为了避免潜在的冲突，确保你的 `.env` 文件位于 `.gitignore` 文件中，并且没有被 Git 跟踪。
- 别名和函数旨在提高命令行操作效率，不要忘了使用它们来简化你的工作流。

