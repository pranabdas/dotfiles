# based on https://github.com/philip82148/simplerich-zsh-theme
echo "Current session started: $(date)"

precmd() {
    local last_cmd_return_code=$?

    update_command_status() {
        _COMMAND_STATUS="%(!.#.$)%{$reset_color%}"
    }

    update_status_symbol() {
        local color=""
        local symbol="• "
        local command_result=$1
        if $command_result; then
            color="%{$fg[green]%}"
            symbol="• "
        else
            color="%{$fg[red]%}"
            symbol="⊗ "
        fi
        _STATUS_SYMBOL="${color}${symbol}%{$reset_color%}"
    }

    local last_cmd_result=true
    if [ "$last_cmd_return_code" = "0" ]; then
        last_cmd_result=true
    else
        last_cmd_result=false
    fi

    _GIT_INFO=$(_omz_git_prompt_info)
    update_command_status $last_cmd_result
    update_status_symbol $last_cmd_result
}

# set option
setopt PROMPT_SUBST

# timer
TMOUT=1
TRAPALRM() {
    if [ "$WIDGET" = "" ] || [ "$WIDGET" = "accept-line" ]; then
        zle reset-prompt
    fi
}

# git
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[cyan]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[cyan]%}]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[yellow]%}*"

_prompt() {
    user_info() {
        echo "${_STATUS_SYMBOL}%{$fg[magenta]%}%n%{$reset_color%}@%{$fg[yellow]%}%m%{$reset_color%}:"
    }

    directory_info() {
        echo "%{$fg_bold[blue]%}%~%{$reset_color%}"
    }

    git_info() {
        echo "${_GIT_INFO}"
    }

    command_status() {
        echo "${_COMMAND_STATUS}"
    }

    echo "$(user_info) $(directory_info) $(git_info)
$(command_status) "
}

PROMPT='%(?,,%{$fg[red]%}Exited: $?%{$reset_color%}
)
$(_prompt)'

RPROMPT='%{$fg[green]%}[%*]%{$reset_color%}'
