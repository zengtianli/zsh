# 🚀 现代化ZSH配置

一套经过精心设计和极致精简的ZSH终端配置，集成了现代命令行工具和高效工作流，让你的终端体验提升10倍。

## ✨ 核心特性

- **🔧 极简架构**: 精简至9个核心文件，维护成本最低
- **⚡ 现代工具**: 集成18种现代CLI工具，美观高效
- **🎯 智能功能**: 20+增强函数，自动化日常操作
- **🔄 统一管理**: brew/进程/conda统一管理界面
- **📋 完整文档**: 详细使用指南和快速参考

## 📁 项目结构

```
zsh/                              # 极简ZSH配置目录
├── zshrc                        # 主配置 (合并环境变量)
├── zimrc                        # Zim框架配置
├── gitconfig                    # Git配置
├── readme.md                    # 项目说明 (本文件)
├── MODERN_TOOLS_GUIDE.md        # 现代工具完整指南
├── zsh-功能汇总.md              # 核心功能汇总
├── config/                      # 配置文件目录 (6个文件)
│   ├── conda.zsh               # 统一Conda管理 (eager/lazy模式)
│   ├── env.zsh                 # 环境变量配置
│   ├── fzf.zsh                 # FZF核心配置
│   ├── mappings.zsh            # 键盘映射
│   ├── modern-tools.zsh        # 现代工具统一配置
│   └── fzf/                    # FZF工具集 (4个精选工具)
│       ├── brew-tools          # 统一Homebrew管理
│       ├── process-tools       # 统一进程管理
│       ├── modern-git          # Git工具集成
│       └── util                # 工具总览
├── functions/                   # 自定义函数
│   └── cd_git_root.zsh         # Git根目录跳转
├── ssh/                        # SSH配置
└── .zim/                       # Zim框架文件
```

## 🚀 快速开始

### 1. 克隆仓库
```bash
git clone <repository-url> ~/.config/zsh
cd ~/.config/zsh
```

### 2. 检查依赖
```bash
# 检查现代工具安装状态
check_modern_tools

# 一键安装推荐工具
install_modern_tools
```

### 3. 配置ZSH
```bash
# 将zshrc链接到用户目录
ln -s ~/.config/zsh/zshrc ~/.zshrc

# 重新加载配置
source ~/.zshrc
```

### 4. 验证安装
```bash
# 查看所有可用功能
util

# 测试现代工具
ll              # eza文件列表
check_modern_tools   # 工具状态检查
```

## 🎯 核心功能

### ⚡ 现代工具替代

| 传统工具 | 现代替代 | 功能增强 |
|:---------|:---------|:---------|
| `ls` | `eza` | 彩色图标、Git状态、树形显示 |
| `cat` | `bat` | 语法高亮、行号、Git集成 |
| `find` | `fd` | 直观语法、遵循.gitignore |
| `ps` | `procs` | 彩色高亮、树形显示 |
| `top` | `btop` | 现代TUI界面 |
| `du` | `dust` | 可视化目录占用 |
| `df` | `duf` | 彩色表格磁盘信息 |
| `dig` | `dog` | 友好DNS查询输出 |
| `ping` | `gping` | 图形化延迟显示 |
| `curl` | `httpie` | 人类友好语法 |

### 🎮 核心快捷键

| 快捷键 | 功能 |
|:-------|:-----|
| `Ctrl+G` | 打开LazyGit |
| `Ctrl+O` | 在当前目录打开Finder |
| `Ctrl+P` | FZF文件搜索 |
| `Ctrl+R` | FZF历史命令搜索 |
| `Ctrl+T` | FZF目录切换 |

### 🛠️ 统一管理工具

```bash
# Homebrew统一管理
brew-tools              # 安装/更新/清理包

# 进程统一管理  
process-tools           # 查看/终止/监控进程

# Conda模式切换
conda_status            # 查看Conda状态
toggle_conda_mode       # 切换eager/lazy模式

# 工具总览
util                    # 查看所有可用功能
```

### 🎯 智能增强函数

```bash
# 文件操作
view file.json          # 智能文件查看
lsmart                  # 智能目录列表
ff edit                 # 交互式文件查找

# 系统诊断
sysinfo                 # 综合系统状态
perf                    # 快速性能诊断
netcheck example.com    # 智能网络诊断

# 开发工具
project_init myapp node # 智能项目初始化
serve 8080              # 快速HTTP服务器
config vim              # 快速编辑配置

# 数据处理
jf data.json            # JSON格式化查询
csv data.csv            # CSV查看处理
```

## 🔧 配置定制

### 现代工具控制
```bash
# 禁用现代工具
export ZSH_USE_MODERN_TOOLS="false"
rl

# 重新启用
export ZSH_USE_MODERN_TOOLS="true"
rl

# 一键切换
toggle_modern_tools
```

### Conda模式切换
```bash
# 切换到延迟加载（启动更快）
export ZSH_CONDA_MODE="lazy"
rl

# 切换到即时加载（开发便利）
export ZSH_CONDA_MODE="eager"
rl
```

### 添加自定义别名
编辑 `config/modern-tools.zsh` 文件：
```bash
# 在文件末尾添加
alias myalias="my_command"
```

## 📚 文档说明

| 文档 | 内容 |
|:-----|:-----|
| `readme.md` | 项目说明和快速入门 (本文件) |
| `MODERN_TOOLS_GUIDE.md` | 现代工具完整使用指南 |
| `zsh-功能汇总.md` | 核心功能详细汇总 |

## 🎯 使用建议

### 新手入门路径
1. **熟悉快捷键**: `Ctrl+G`, `Ctrl+P`, `Ctrl+R`
2. **查看功能**: 运行 `util` 了解所有功能
3. **安装工具**: 运行 `check_modern_tools` 和 `install_modern_tools`
4. **阅读文档**: 查看 `MODERN_TOOLS_GUIDE.md`

### 高效工作流
1. **文件管理**: `ll`, `la`, `view`, `ff`
2. **系统监控**: `sysinfo`, `perf`, `process-tools`
3. **开发工具**: `project_init`, `serve`, `modern-git`
4. **包管理**: `brew-tools`

## 💡 故障排除

### 常见问题
```bash
# 配置不生效
rl                      # 重新加载配置

# 现代工具不可用
check_modern_tools      # 检查安装状态
install_modern_tools    # 安装缺失工具

# 功能不明确
util                    # 查看所有功能
cat MODERN_TOOLS_GUIDE.md  # 查看详细指南
```

### 依赖检查
```bash
# 核心依赖
which fzf zoxide nvim lazygit yazi

# 现代工具检查
check_modern_tools
```

## 🏆 项目亮点

### 极致精简 (相比传统配置)
- **文件数量**: 减少60-70%
- **维护成本**: 极低
- **学习曲线**: 平缓
- **功能完整**: 100%保持

### 现代化体验
- **美观输出**: 彩色、图标、高亮
- **性能优越**: 现代工具更快
- **用户友好**: 直观语法和错误提示
- **兼容性强**: 保留原始工具访问

### 智能设计
- **条件加载**: 仅在工具存在时启用
- **统一管理**: 相关功能集中控制
- **文档完整**: 详细使用指南
- **易于扩展**: 模块化设计

## 📈 更新历程

- **2024.08**: 现代工具集成，18种CLI工具
- **2024.08**: 第一次重构，FZF工具精简
- **2024.08**: 终极精简，文件数量减少60%+
- **当前**: 极简架构，完美平衡功能与维护性

---

**享受现代化、高效、美观的终端体验！** 🎉✨

如有问题或建议，请查看 `MODERN_TOOLS_GUIDE.md` 获取详细帮助。


