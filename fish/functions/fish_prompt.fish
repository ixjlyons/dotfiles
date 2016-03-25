function fish_prompt
    set -l pwd $PWD
    set -l home_dir (string match -r "$HOME(/.*|\$)" "$pwd")
    if set -q home_dir[2]
        set pwd "~$home_dir[2]"
    end

    set_color blue
    printf "%s" (whoami)
    set_color cyan
    printf '::'
    set_color green
    printf "%s" (hostname)

    set_color normal
    printf "[$pwd]"
    set_color normal
    printf '%s ' (__fish_git_prompt)
    set_color normal
    printf '\n〉'
end
