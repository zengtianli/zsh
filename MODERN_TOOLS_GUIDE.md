# 现代工具使用指南

## 🔧 重要修复说明

在初次配置时，发现某些现代工具的语法与传统工具差异较大，直接别名替换会导致错误。已经进行了以下修复：

### ❌ 问题工具及修复方案

#### 1. sd (现代sed替代)
**问题**: `sd` 语法与 `sed` 不兼容
- `sed 's/old/new/g' file` 
- `sd 'old' 'new' file`

**修复方案**: 
- ❌ 移除 `alias sed="sd"`
- ✅ 提供 `sdr()` 函数作为便捷包装
- ✅ 保留 `oldsed` 访问原始sed

```bash
# 使用方法
sdr "old_text" "new_text"           # 当前目录所有文件
sdr "old_text" "new_text" file.txt  # 指定文件
oldsed 's/old/new/g' file.txt       # 使用原始sed
```

#### 2. fd (现代find替代)
**问题**: `fd` 语法与 `find` 差异很大
- `find . -name "*.txt" -type f`
- `fd -e txt`

**修复方案**:
- ❌ 移除 `alias find="fd"`
- ✅ 提供 `fdf()` 函数直接使用fd
- ✅ 保留 `oldfind` 访问原始find

```bash
# 使用方法
fdf "*.txt"                    # 使用fd查找
fdf -t f -e txt               # fd语法
oldfind . -name "*.txt"       # 使用原始find
```

#### 3. httpie (现代curl替代)
**问题**: `httpie` 语法与 `curl` 完全不同
- `curl -X POST -H "Content-Type: application/json" -d '{"key":"value"}' url`
- `http POST url key=value`

**修复方案**:
- ❌ 移除 `alias curl="http"`
- ✅ 提供 `httpc` 别名使用httpie
- ✅ 保留 `oldcurl` 访问原始curl

```bash
# 使用方法
httpc GET api.example.com      # 使用httpie
httpc POST api.example.com key=value
oldcurl -X GET api.example.com # 使用原始curl
```

## ✅ 安全的别名替换

以下工具语法兼容，可以安全替换：

### 文件列表和查看
```bash
ll      # eza -l --icons --group-directories-first
la      # eza -la --icons --group-directories-first  
lt      # eza -T -L 2 --icons (树形显示)
cat     # bat (语法高亮)
```

### 系统监控
```bash
ps      # procs (彩色进程列表)
top     # btop (现代TUI)
df      # duf (彩色磁盘信息)
du      # dust (可视化目录占用)
```

### 网络工具
```bash
dig     # dog (友好DNS查询)
ping    # gping (图形化延迟)
```

## 🎯 推荐使用方式

### 1. 渐进式学习
- 先使用兼容的别名 (`ll`, `cat`, `ps`, `top`)
- 逐步学习专用函数 (`sdr`, `fdf`, `httpc`)
- 在需要时回退到原始工具 (`oldsed`, `oldfind`, `oldcurl`)

### 2. 查看帮助
```bash
util                    # 查看所有可用工具
check_modern_tools      # 检查工具安装状态
sdr --help             # 查看sd帮助
fdf --help             # 查看fd帮助
httpc --help           # 查看httpie帮助
```

### 3. 学习新语法
```bash
# fd 示例
fdf "config"           # 查找文件名含config的文件
fdf -t f -e json       # 查找.json文件
fdf -t d               # 只查找目录

# sd 示例  
sdr "old" "new"        # 替换当前目录所有文件
sdr "old" "new" *.txt  # 替换指定文件

# httpie 示例
httpc GET httpbin.org/get
httpc POST httpbin.org/post name=john age:=30
httpc --download GET example.com/file.zip
```

## 🔄 切换模式

如果你更喜欢传统工具，可以：

```bash
# 临时禁用现代工具
export ZSH_USE_MODERN_TOOLS="false"
rl  # 重新加载配置

# 重新启用
export ZSH_USE_MODERN_TOOLS="true"  
rl

# 或使用切换函数
toggle_modern_tools
```

## 📚 进一步学习

- **eza**: `eza --help` 查看更多选项
- **bat**: `bat --help` 了解语法高亮和主题
- **fd**: `fd --help` 学习高级查找选项
- **sd**: `sd --help` 了解正则表达式支持
- **httpie**: `http --help` 学习API调试技巧
- **dust**: `dust --help` 了解目录分析选项
- **procs**: `procs --help` 学习进程过滤选项

## ⚠️ 注意事项

1. **脚本兼容性**: 在脚本中仍然使用原始命令路径，如 `/usr/bin/find`
2. **学习曲线**: 新工具语法可能需要时间适应
3. **功能差异**: 某些高级功能可能在新旧工具间有差异
4. **性能**: 现代工具通常更快，但在某些特定场景下可能有差异

现代工具提供了更好的用户体验，但理解这些差异将帮助你更好地使用它们！

---

# 🚀 现代工具别名速查表

> 快速参考你可以直接使用的现代化命令行工具别名

## ✅ 直接替换别名（语法兼容，可放心使用）

### 📂 文件列表 (eza 替代 ls)
```bash
ll          # 详细列表，图标，目录优先
la          # 显示隐藏文件
lt          # 树形显示（2层）
lg          # 显示Git状态
```

### 📄 文件查看 (bat 替代 cat)
```bash
cat file.txt    # 语法高亮查看文件
# 支持多种语言语法高亮，自动分页
```

### 📊 系统监控
```bash
ps              # procs - 彩色进程列表
top             # btop - 现代化系统监控界面
df              # duf - 彩色磁盘信息表格
du              # dust - 可视化目录占用分析
```

### 🌐 网络工具
```bash
dig example.com     # dog - 友好的DNS查询输出
ping example.com    # gping - 图形化延迟显示
```

### 📝 文件比较
```bash
diff file1 file2    # delta - 语法高亮差异显示
```

## 🔧 专用函数（需要学习新语法）

### 🔍 文件查找 (fd)
```bash
fdf "config"        # 查找文件名包含config
fdf "*.json"        # 查找所有json文件（自动处理通配符）
fdf -t f -e py      # 查找所有.py文件
fdf -t d            # 只查找目录
fdf --hidden        # 包含隐藏文件

# 回退到原始find
oldfind . -name "*.txt" -type f
```

### ✏️ 文本替换 (sd)
```bash
sdr "old_text" "new_text"              # 当前目录所有文件
sdr "old_text" "new_text" file.txt     # 指定文件
sdr "old_text" "new_text" *.py         # 指定文件类型

# 回退到原始sed
oldsed 's/old/new/g' file.txt
```

### 🌐 HTTP客户端 (httpie)
```bash
httpc GET api.example.com                    # GET请求
httpc POST api.example.com key=value         # POST with data
httpc PUT api.example.com/1 name=john        # PUT请求
httpc GET api.example.com X-API-Key:token    # 自定义头部
httpc --download GET example.com/file.zip    # 下载文件

# 回退到原始curl
oldcurl -X GET api.example.com
```

## 🎛️ 数据处理工具

### 📊 JSON/YAML处理
```bash
# JSON格式化（增强版jq）
jf data.json                    # 格式化显示
jf data.json '.users[]'         # jq查询
jf https://api.github.com/users # 支持URL

# YAML/JSON互转
yaml2json config.yml            # YAML转JSON
json2yaml data.json             # JSON转YAML

# 命令输出转JSON
psj                             # ps输出转JSON
dfj                             # df输出转JSON  
lsj                             # ls输出转JSON
```

### 📋 CSV数据处理
```bash
csv data.csv                    # 查看CSV文件
csv data.csv head              # 查看前几行
csv data.csv stats             # 统计信息
csv data.csv query             # 交互式查询
```

## 🔧 开发工具

### ⚡ 任务运行器 (just)
```bash
j                               # just（运行默认任务）
jl                              # just --list（列出所有任务）
```

### 📈 性能测试 (hyperfine)
```bash
bench 'command1' 'command2'     # 基准测试对比
```

### 🔒 安全工具
```bash
# 文件传输 (croc)
send file.txt                   # 发送文件
receive                         # 接收文件

# 文件加密 (age)
encrypt public_key file.txt     # 加密文件
decrypt encrypted.txt.age       # 解密文件
```

## 📋 保留的原始工具访问

所有现代工具都保留了原始版本的访问方式：
```bash
oldls       oldcat      oldfind     oldsed      oldcurl
oldps       oldtop      olddu       olddf       olddig  
oldping     olddiff     # ... 等等
```

## 🎯 实用增强函数

### 📁 智能文件操作
```bash
view file.json          # 智能文件查看（自动选择jq/yq/bat）
lsmart                  # 智能目录列表（Git仓库显示状态）
ff edit                 # 交互式文件查找并编辑
ff view                 # 交互式文件查找并查看
ff copy                 # 交互式文件查找并复制到剪贴板
```

### 🖥️ 系统管理
```bash
sysinfo                 # 综合系统状态检查
perf                    # 快速性能诊断
netcheck example.com    # 智能网络连接诊断
disk_usage             # 目录占用分析
```

### 🚀 开发辅助
```bash
project_init myproject node     # 智能项目初始化
serve 8080                      # 快速HTTP服务器
config vim                      # 快速编辑配置文件
backup important.txt            # 快速备份文件
```

## 🎮 工具管理命令

```bash
# 检查工具状态
check_modern_tools              # 查看安装状态
util                           # 查看所有可用功能

# 工具管理
toggle_modern_tools            # 切换现代/传统工具模式
install_modern_tools           # 一键安装推荐工具

# 配置重载
rl                             # 重新加载zsh配置
```

## 💡 使用技巧

1. **渐进式学习**: 先使用兼容的别名(`ll`, `cat`, `ps`)，再逐步学习专用函数
2. **查看帮助**: 每个工具都支持 `--help` 参数
3. **错误处理**: 出问题时可以用 `old*` 前缀访问原始工具
4. **性能**: 现代工具通常更快，输出更美观
5. **脚本**: 在脚本中仍建议使用完整路径如 `/usr/bin/find`

现在你拥有了一套现代化、高效、美观的命令行工具集！🎉 