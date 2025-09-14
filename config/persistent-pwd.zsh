# ============================================================================
# 持久化工作目录配置
# ============================================================================
# 功能：记住上次的工作目录，新开终端时自动切换到该目录

# 定义保存目录信息的文件路径
PERSISTENT_PWD_FILE="${HOME}/.zsh_last_dir"

# 保存当前目录到文件的函数
save_current_dir() {
    # 避免保存家目录，因为那是默认位置
    if [[ "$PWD" != "$HOME" ]]; then
        echo "$PWD" >| "$PERSISTENT_PWD_FILE"
    fi
}

# 恢复上次保存的目录
restore_last_dir() {
    # 检查文件是否存在且可读
    if [[ -f "$PERSISTENT_PWD_FILE" && -r "$PERSISTENT_PWD_FILE" ]]; then
        local last_dir
        last_dir="$(cat "$PERSISTENT_PWD_FILE" 2>/dev/null)"
        
        # 检查目录是否仍然存在且可访问
        if [[ -n "$last_dir" && -d "$last_dir" && "$last_dir" != "$HOME" ]]; then
            cd "$last_dir" 2>/dev/null || {
                # 如果无法切换到保存的目录，删除记录文件
                rm -f "$PERSISTENT_PWD_FILE" 2>/dev/null
            }
        fi
    fi
}

# 使用 zsh 的 chpwd 钩子，每次切换目录时自动保存
autoload -U add-zsh-hook
add-zsh-hook chpwd save_current_dir

# 在新的 shell 会话开始时恢复目录
# 但只在交互式 shell 中执行，避免影响脚本
if [[ $- == *i* ]] && [[ -z "$PERSISTENT_PWD_RESTORED" ]]; then
    restore_last_dir
    export PERSISTENT_PWD_RESTORED=1
fi

# 可选：提供手动清除保存目录的命令
clear_saved_dir() {
    if [[ -f "$PERSISTENT_PWD_FILE" ]]; then
        rm -f "$PERSISTENT_PWD_FILE"
        echo "已清除保存的目录记录"
    else
        echo "没有找到保存的目录记录"
    fi
}

# 可选：显示当前保存的目录
show_saved_dir() {
    if [[ -f "$PERSISTENT_PWD_FILE" && -r "$PERSISTENT_PWD_FILE" ]]; then
        local saved_dir
        saved_dir="$(cat "$PERSISTENT_PWD_FILE" 2>/dev/null)"
        if [[ -n "$saved_dir" ]]; then
            echo "保存的目录: $saved_dir"
        else
            echo "保存的目录记录为空"
        fi
    else
        echo "没有找到保存的目录记录"
    fi
}
