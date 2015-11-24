set ANDROID_HOME /home/kenny/usr/android/android-sdk
set ANDROID_NDK /home/kenny/usr/android/android-ndk

set GOPATH /home/kenny/go

set PATH $PATH ~/bin ~/.local/bin ~/.cabal/bin $ANDROID_HOME/platform-tools

set fish_greeting "Finally, a command line shell for the 90s"
set fish_color_cwd white

set fish_greeting 'Finally, a command line shell for the 90s'

set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_color_branch yellow

set __fish_git_prompt_char_dirtystate '★'
set __fish_git_prompt_char_stagedstate '→'
set __fish_git_prompt_char_stashstate '←'

set -x VREP /home/kenny/usr/vrep/vrep

eval (dircolors -c ~/.dircolors | sed 's/>&\/dev\/null$//')
