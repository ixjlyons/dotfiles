function fish_prompt
    set last_status $status

    set_color normal
    printf '┌'
    set_color --bold blue
    printf '%s' (whoami)
    set_color normal
    set_color cyan
    printf '@'
    set_color --bold green
    printf '%s ' (hostname)
    set_color normal

    set_color $fish_color_cwd
    printf '[%s] ' (prompt_pwd)
    set_color normal
    printf '%s ' (__fish_git_prompt)
    set_color normal
    printf '\n└─▶ '
end
