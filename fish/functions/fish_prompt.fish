function fish_prompt
    set last_status $status

    set_color blue
    printf '%s' (whoami)
    set_color cyan
    printf '::'
    set_color green
    printf '%s' (hostname)

    set_color $fish_color_cwd
    printf '[%s]' (prompt_pwd)
    set_color normal
    printf '%s ' (__fish_git_prompt)
    set_color normal
    printf '\n〉'
end
