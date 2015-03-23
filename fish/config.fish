alias ll="ls -lA"

set ANDROID_HOME /home/kenny/usr/android/android-sdk
set ANDROID_NDK /home/kenny/usr/android/android-ndk

set PATH $PATH ~/bin ~/.local/bin ~/.cabal/bin $ANDROID_HOME/platform-tools

set fish_greeting "fish"
set fish_color_cwd white

set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_color_branch yellow

set __fish_git_prompt_char_dirtystate '★'
set __fish_git_prompt_char_stagedstate '→'
set __fish_git_prompt_char_stashstate '←'

function prompt_pwd
    if test "$PWD" != "$HOME"
        printf "%s" (echo $PWD | sed -e 's|/private||' -e "s|^$HOME|~|")
    else
        echo '~'
    end
end

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
